package com.example.orderservice.client;

import com.example.orderservice.dto.CustomerAddressResponse;
import com.example.orderservice.dto.CustomerResponse;
import com.example.orderservice.exception.BusinessException;
import com.example.orderservice.exception.ResourceNotFoundException;
import com.example.orderservice.exception.ServiceUnavailableException;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.stereotype.Component;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.client.RestClient;

import java.util.List;

@Component
public class CustomerClient {
    private final RestClient restClient;

    public CustomerClient(RestClient customerRestClient) {
        this.restClient = customerRestClient;
    }

    public CustomerResponse getCustomer(Long customerId) {
        try {
            CustomerResponse customer = restClient.get()
                    .uri("/api/customers/{id}", customerId)
                    .retrieve()
                    .body(CustomerResponse.class);
            if (customer == null) {
                throw new ResourceNotFoundException("Không tìm thấy khách hàng");
            }
            if (!"ACTIVE".equalsIgnoreCase(customer.status())) {
                throw new BusinessException("Khách hàng không hoạt động");
            }

            List<CustomerAddressResponse> addresses = restClient.get()
                    .uri("/api/customers/{id}/addresses", customerId)
                    .retrieve()
                    .body(new ParameterizedTypeReference<>() {});
            if (addresses == null || addresses.isEmpty()) {
                throw new BusinessException("Khách hàng chưa có địa chỉ giao hàng");
            }
            return customer;
        } catch (HttpClientErrorException.NotFound ex) {
            throw new ResourceNotFoundException("Không tìm thấy khách hàng");
        } catch (HttpClientErrorException ex) {
            throw new BusinessException("Dữ liệu khách hàng không hợp lệ");
        } catch (ResourceAccessException ex) {
            throw new ServiceUnavailableException("Không kết nối được Customer Service");
        }
    }
}
