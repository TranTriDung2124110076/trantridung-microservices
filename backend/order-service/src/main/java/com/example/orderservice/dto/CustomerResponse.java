package com.example.orderservice.dto;

public record CustomerResponse(
        Long id,
        String fullName,
        String phone,
        String email,
        String status
) {
}
