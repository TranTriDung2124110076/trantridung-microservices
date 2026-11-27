package com.example.customerservice.dto;

import com.example.customerservice.entity.Customer;
import java.time.LocalDateTime;

public record CustomerResponse(
        Long id,
        String fullName,
        String phone,
        String email,
        String status,
        LocalDateTime createdAt,
        LocalDateTime updatedAt
) {
    public static CustomerResponse fromEntity(Customer customer) {
        return new CustomerResponse(
                customer.getId(),
                customer.getFullName(),
                customer.getPhone(),
                customer.getEmail(),
                customer.getStatus(),
                customer.getCreatedAt(),
                customer.getUpdatedAt()
        );
    }
}
