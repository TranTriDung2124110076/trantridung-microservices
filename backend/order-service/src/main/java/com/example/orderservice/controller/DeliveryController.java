package com.example.orderservice.controller;

import com.example.orderservice.dto.request.DeliveryStatusRequestDTO;
import com.example.orderservice.dto.DeliveryRequest;
import com.example.orderservice.dto.DeliveryResponse;
import com.example.orderservice.dto.ServiceTypeRequest;
import com.example.orderservice.dto.ServiceTypeResponse;
import com.example.orderservice.service.DeliveryService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DeliveryController {
    private final DeliveryService deliveryService;

    public DeliveryController(DeliveryService deliveryService) {
        this.deliveryService = deliveryService;
    }

    @PostMapping("/deliveries")
    public ResponseEntity<DeliveryResponse> createDelivery(@Valid @RequestBody DeliveryRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(deliveryService.create(request));
    }

    @GetMapping("/deliveries")
    public List<DeliveryResponse> getDeliveries() {
        return deliveryService.getAll();
    }

    @GetMapping("/deliveries/{id}")
    public DeliveryResponse getDelivery(@PathVariable Long id) {
        return deliveryService.getById(id);
    }

    @PutMapping("/deliveries/{id}/status")
    public DeliveryResponse updateDeliveryStatus(
            @PathVariable Long id,
            @Valid @RequestBody DeliveryStatusRequestDTO request) {
        return deliveryService.updateStatus(id, request.getStatus().toUpperCase());
    }

    @GetMapping("/service-types")
    public List<ServiceTypeResponse> getServiceTypes() {
        return deliveryService.getServiceTypes();
    }

    @PostMapping("/service-types")
    public ResponseEntity<ServiceTypeResponse> createServiceType(
            @Valid @RequestBody ServiceTypeRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(deliveryService.createServiceType(request));
    }
}
