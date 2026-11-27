package com.example.customerservice.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record CustomerAddressRequest(
        @NotBlank(message = "Địa chỉ không được để trống")
        @Size(max = 255, message = "Địa chỉ tối đa 255 ký tự")
        String address,

        @NotBlank(message = "Phường/Xã không được để trống")
        String ward,

        @NotBlank(message = "Quận/Huyện không được để trống")
        String district,

        @NotBlank(message = "Tỉnh/Thành phố không được để trống")
        String city,

        Boolean isDefault
) {
}
