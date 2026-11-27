package com.example.customerservice.service;

import com.example.customerservice.dto.CustomerAddressRequest;
import com.example.customerservice.dto.CustomerAddressResponse;
import com.example.customerservice.dto.CustomerRequest;
import com.example.customerservice.dto.CustomerResponse;
import com.example.customerservice.entity.Customer;
import com.example.customerservice.entity.CustomerAddress;
import com.example.customerservice.exception.BusinessException;
import com.example.customerservice.exception.ResourceNotFoundException;
import com.example.customerservice.repository.CustomerAddressRepository;
import com.example.customerservice.repository.CustomerRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

@Service
public class CustomerService {
    private final CustomerRepository customerRepository;
    private final CustomerAddressRepository addressRepository;

    public CustomerService(CustomerRepository customerRepository, CustomerAddressRepository addressRepository) {
        this.customerRepository = customerRepository;
        this.addressRepository = addressRepository;
    }

    public List<CustomerResponse> getAll() {
        return customerRepository.findAll()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public CustomerResponse getById(Long id) {
        Customer customer = findCustomer(id);
        if (!"ACTIVE".equalsIgnoreCase(customer.getStatus())) {
            throw new BusinessException("Khách hàng không hoạt động");
        }
        return toResponse(customer);
    }

    private CustomerResponse toResponse(Customer customer) {
        return CustomerResponse.fromEntity(customer);
    }

    @Transactional
    public CustomerResponse create(CustomerRequest request) {
        Customer customer = new Customer();
        applyCustomer(customer, request);
        return CustomerResponse.fromEntity(customerRepository.save(customer));
    }

    @Transactional
    public CustomerResponse update(Long id, CustomerRequest request) {
        Customer customer = findCustomer(id);
        applyCustomer(customer, request);
        customer.setUpdatedAt(LocalDateTime.now());
        return CustomerResponse.fromEntity(customerRepository.save(customer));
    }

    public List<CustomerAddressResponse> getAddresses(Long customerId) {
        findCustomer(customerId);
        return addressRepository.findByCustomerId(customerId).stream()
                .map(CustomerAddressResponse::fromEntity)
                .toList();
    }

    @Transactional
    public CustomerAddressResponse createAddress(Long customerId, CustomerAddressRequest request) {
        Customer customer = findCustomer(customerId);
        if (!"ACTIVE".equalsIgnoreCase(customer.getStatus())) {
            throw new BusinessException("Khách hàng không hoạt động");
        }
        CustomerAddress address = new CustomerAddress();
        address.setCustomer(customer);
        address.setAddress(request.address());
        address.setWard(request.ward());
        address.setDistrict(request.district());
        address.setCity(request.city());
        address.setIsDefault(request.isDefault() != null && request.isDefault());
        return CustomerAddressResponse.fromEntity(addressRepository.save(address));
    }

    private Customer findCustomer(Long id) {
        Long customerId = Objects.requireNonNull(id, "ID khách hàng không được để trống");
        return customerRepository.findById(customerId)
                .orElseThrow(() -> new ResourceNotFoundException(
                        "Không tìm thấy khách hàng với ID: " + customerId));
    }

    private void applyCustomer(Customer customer, CustomerRequest request) {
        customer.setFullName(request.fullName().trim());
        customer.setPhone(request.phone().trim());
        customer.setEmail(request.email().trim());
        customer.setStatus(request.status() == null ? "ACTIVE" : request.status().toUpperCase());
        if (!"ACTIVE".equals(customer.getStatus()) && !"INACTIVE".equals(customer.getStatus())) {
            throw new BusinessException("Trạng thái khách hàng không hợp lệ");
        }
    }
}
