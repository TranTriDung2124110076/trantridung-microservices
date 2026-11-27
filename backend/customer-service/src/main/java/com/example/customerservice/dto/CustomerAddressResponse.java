package com.example.customerservice.dto;

import com.example.customerservice.entity.CustomerAddress;

public record CustomerAddressResponse(
        Long id,
        Long customerId,
        String address,
        String ward,
        String district,
        String city,
        Boolean isDefault
) {
    public static CustomerAddressResponse fromEntity(CustomerAddress address) {
        return new CustomerAddressResponse(
                address.getId(),
                address.getCustomer().getId(),
                address.getAddress(),
                address.getWard(),
                address.getDistrict(),
                address.getCity(),
                address.isDefault()
        );
    }
}
