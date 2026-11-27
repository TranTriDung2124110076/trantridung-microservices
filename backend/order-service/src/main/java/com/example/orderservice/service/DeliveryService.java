package com.example.orderservice.service;

import com.example.orderservice.client.CustomerClient;
import com.example.orderservice.dto.DeliveryRequest;
import com.example.orderservice.dto.DeliveryResponse;
import com.example.orderservice.dto.ServiceTypeRequest;
import com.example.orderservice.dto.ServiceTypeResponse;
import com.example.orderservice.entity.Delivery;
import com.example.orderservice.entity.ServiceType;
import com.example.orderservice.exception.BusinessException;
import com.example.orderservice.exception.ResourceNotFoundException;
import com.example.orderservice.repository.DeliveryRepository;
import com.example.orderservice.repository.ServiceTypeRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Service
public class DeliveryService {
    private static final BigDecimal WEIGHT_FEE = new BigDecimal("10000");

    private final DeliveryRepository deliveryRepository;
    private final ServiceTypeRepository serviceTypeRepository;
    private final CustomerClient customerClient;

    public DeliveryService(DeliveryRepository deliveryRepository,
                           ServiceTypeRepository serviceTypeRepository,
                           CustomerClient customerClient) {
        this.deliveryRepository = deliveryRepository;
        this.serviceTypeRepository = serviceTypeRepository;
        this.customerClient = customerClient;
    }

    public List<DeliveryResponse> getAll() {
        return deliveryRepository.findAll()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public DeliveryResponse getById(Long id) {
        return toResponse(findDelivery(id));
    }

    private DeliveryResponse toResponse(Delivery delivery) {
        return DeliveryResponse.fromEntity(delivery);
    }

    @Transactional
    public DeliveryResponse create(DeliveryRequest request) {
        customerClient.getCustomer(request.customerId());

        ServiceType serviceType = serviceTypeRepository.findById(request.serviceTypeId())
                .orElseThrow(() -> new ResourceNotFoundException("Không tìm thấy loại dịch vụ"));
        if (!"ACTIVE".equalsIgnoreCase(serviceType.getStatus())) {
            throw new BusinessException("Loại dịch vụ không hoạt động");
        }

        Delivery delivery = new Delivery();
        delivery.setCustomerId(request.customerId());
        delivery.setServiceType(serviceType);
        delivery.setReceiverName(request.receiverName().trim());
        delivery.setReceiverPhone(request.receiverPhone().trim());
        delivery.setDeliveryAddress(request.deliveryAddress().trim());
        delivery.setPackageDescription(request.packageDescription());
        delivery.setWeight(request.weight());
        delivery.setShippingFee(serviceType.getBasePrice().add(request.weight().multiply(WEIGHT_FEE)));
        delivery.setStatus("PENDING");
        return DeliveryResponse.fromEntity(deliveryRepository.save(delivery));
    }

    @Transactional
    public DeliveryResponse updateStatus(Long id, String status) {
        Delivery delivery = findDelivery(id);
        delivery.setStatus(status);
        delivery.setUpdatedAt(LocalDateTime.now());
        return DeliveryResponse.fromEntity(deliveryRepository.save(delivery));
    }

    public List<ServiceTypeResponse> getServiceTypes() {
        return serviceTypeRepository.findAll().stream().map(ServiceTypeResponse::fromEntity).toList();
    }

    @Transactional
    public ServiceTypeResponse createServiceType(ServiceTypeRequest request) {
        String status = request.status() == null ? "ACTIVE" : request.status().toUpperCase();
        if (!"ACTIVE".equals(status) && !"INACTIVE".equals(status)) {
            throw new BusinessException("Trạng thái loại dịch vụ không hợp lệ");
        }
        ServiceType serviceType = new ServiceType();
        serviceType.setServiceName(request.serviceName().trim());
        serviceType.setDescription(request.description());
        serviceType.setBasePrice(request.basePrice());
        serviceType.setStatus(status);
        return ServiceTypeResponse.fromEntity(serviceTypeRepository.save(serviceType));
    }

    private Delivery findDelivery(Long id) {
        return deliveryRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Không tìm thấy đơn giao hàng với ID: " + id));
    }
}
