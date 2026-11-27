package com.example.orderservice.dto;

public record CustomerAddressResponse(
        Long id,
        Long customerId,
        String address,
        String ward,
        String district,
        String city,
        Boolean isDefault
) {
}
