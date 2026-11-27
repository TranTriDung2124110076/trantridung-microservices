package com.example.customerservice.controller;

import com.example.customerservice.dto.CustomerAddressRequest;
import com.example.customerservice.dto.CustomerAddressResponse;
import com.example.customerservice.dto.CustomerRequest;
import com.example.customerservice.dto.CustomerResponse;
import com.example.customerservice.service.CustomerService;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
public class CustomerController {
    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @PostMapping
    public ResponseEntity<CustomerResponse> create(@Valid @RequestBody CustomerRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(customerService.create(request));
    }

    @GetMapping
    public List<CustomerResponse> getAll() {
        return customerService.getAll();
    }

    @GetMapping("/{id}")
    public CustomerResponse getById(@PathVariable Long id) {
        return customerService.getById(id);
    }

    @PutMapping("/{id}")
    public CustomerResponse update(@PathVariable Long id, @Valid @RequestBody CustomerRequest request) {
        return customerService.update(id, request);
    }

    @GetMapping("/{id}/addresses")
    public List<CustomerAddressResponse> getAddresses(@PathVariable Long id) {
        return customerService.getAddresses(id);
    }

    @PostMapping("/{id}/addresses")
    public ResponseEntity<CustomerAddressResponse> createAddress(
            @PathVariable Long id,
            @Valid @RequestBody CustomerAddressRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(customerService.createAddress(id, request));
    }
}
