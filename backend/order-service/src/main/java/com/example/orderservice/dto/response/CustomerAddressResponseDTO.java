package com.example.orderservice.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CustomerAddressResponseDTO {
    private Long id;
    private Long customerId;
    private String address;
    private String ward;
    private String district;
    private String city;
    @JsonProperty("isDefault")
    private boolean isDefault;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCustomerId() { return customerId; }
    public void setCustomerId(Long customerId) { this.customerId = customerId; }
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    public String getWard() { return ward; }
    public void setWard(String ward) { this.ward = ward; }
    public String getDistrict() { return district; }
    public void setDistrict(String district) { this.district = district; }
    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }
    @JsonProperty("isDefault")
    public boolean isDefault() { return isDefault; }
    @JsonProperty("isDefault")
    public void setIsDefault(boolean isDefault) { this.isDefault = isDefault; }
}
