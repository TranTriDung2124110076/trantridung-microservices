package com.example.orderservice.dto;

import com.example.orderservice.entity.ServiceType;
import java.math.BigDecimal;

public record ServiceTypeResponse(
        Long id,
        String serviceName,
        String description,
        BigDecimal basePrice,
        String status
) {
    public static ServiceTypeResponse fromEntity(ServiceType serviceType) {
        return new ServiceTypeResponse(
                serviceType.getId(),
                serviceType.getServiceName(),
                serviceType.getDescription(),
                serviceType.getBasePrice(),
                serviceType.getStatus()
        );
    }
}
