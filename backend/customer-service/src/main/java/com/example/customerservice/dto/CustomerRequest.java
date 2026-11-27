package com.example.customerservice.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public record CustomerRequest(
        @NotBlank(message = "Họ tên không được để trống")
        @Size(max = 100, message = "Họ tên tối đa 100 ký tự")
        String fullName,

        @NotBlank(message = "Số điện thoại không được để trống")
        @Pattern(regexp = "^(\\+84|0)[0-9]{9,10}$", message = "Số điện thoại Việt Nam không hợp lệ")
        String phone,

        @NotBlank(message = "Email không được để trống")
        @Email(message = "Email không hợp lệ")
        String email,

        @NotBlank(message = "Trạng thái khách hàng không được để trống")
        @Pattern(regexp = "ACTIVE|INACTIVE", message = "Trạng thái khách hàng không hợp lệ")
        String status
) {
}
