package com.sist.springbootEx1.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class MyShopDto {
    private Long num;
    private String name;
    private String price;
    private String color;
    private String receiving;
    private Timestamp release;
}
