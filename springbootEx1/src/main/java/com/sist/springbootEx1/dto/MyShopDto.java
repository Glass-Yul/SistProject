package com.sist.springbootEx1.dto;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Entity
@Table(name = "myshop")
public class MyShopDto {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long num;

    private String name;

    private String price;

    private String color;

    private String receiving;

    @CreationTimestamp // now() 같은 거임
    private Timestamp writeDay;
}
