package com.example.orderservice.dto.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;

public class DeliveryStatusRequestDTO {
    @NotBlank(message = "Trạng thái không được để trống")
    @Pattern(regexp = "PENDING|DELIVERING|COMPLETED|CANCELLED",
            message = "Trạng thái không hợp lệ")
    private String status;

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
