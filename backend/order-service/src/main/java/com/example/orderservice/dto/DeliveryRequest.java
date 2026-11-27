package com.example.orderservice.dto;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Positive;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;

public record DeliveryRequest(
        @NotNull(message = "customerId không được để trống")
        @Positive(message = "customerId phải lớn hơn 0")
        Long customerId,

        @NotNull(message = "serviceTypeId không được để trống")
        @Positive(message = "serviceTypeId phải lớn hơn 0")
        Long serviceTypeId,

        @NotBlank(message = "Tên người nhận không được để trống")
        @Size(max = 100, message = "Tên người nhận tối đa 100 ký tự")
        String receiverName,

        @NotBlank(message = "Số điện thoại người nhận không được để trống")
        @Pattern(regexp = "^(\\+84|0)[0-9]{9,10}$", message = "Số điện thoại người nhận không hợp lệ")
        String receiverPhone,

        @NotBlank(message = "Địa chỉ giao hàng không được để trống")
        @Size(max = 255, message = "Địa chỉ giao hàng tối đa 255 ký tự")
        String deliveryAddress,

        String packageDescription,

        @NotNull(message = "Trọng lượng không được để trống")
        @DecimalMin(value = "0.01", inclusive = true, message = "Trọng lượng phải lớn hơn 0")
        BigDecimal weight
) {
}
