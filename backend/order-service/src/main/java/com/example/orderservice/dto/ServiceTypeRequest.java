package com.example.orderservice.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.PositiveOrZero;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;

public record ServiceTypeRequest(
        @NotBlank(message = "Tên loại dịch vụ không được để trống")
        @Size(max = 100, message = "Tên loại dịch vụ tối đa 100 ký tự")
        String serviceName,

        String description,

        @NotNull(message = "Giá cơ bản không được để trống")
        @PositiveOrZero(message = "Giá cơ bản không được âm")
        BigDecimal basePrice,

        @NotBlank(message = "Trạng thái không được để trống")
        String status
) {
}
