package com.example.orderservice.dto;

import com.example.orderservice.entity.Delivery;
import java.math.BigDecimal;
import java.time.LocalDateTime;

public record DeliveryResponse(
        Long id,
        Long customerId,
        Long serviceTypeId,
        String receiverName,
        String receiverPhone,
        String deliveryAddress,
        String packageDescription,
        BigDecimal weight,
        BigDecimal shippingFee,
        String status,
        LocalDateTime createdAt
) {
    public static DeliveryResponse fromEntity(Delivery delivery) {
        return new DeliveryResponse(
                delivery.getId(),
                delivery.getCustomerId(),
                delivery.getServiceType().getId(),
                delivery.getReceiverName(),
                delivery.getReceiverPhone(),
                delivery.getDeliveryAddress(),
                delivery.getPackageDescription(),
                delivery.getWeight(),
                delivery.getShippingFee(),
                delivery.getStatus(),
                delivery.getCreatedAt()
        );
    }
}
