package com.sist.springbootEx1.domain;

import jakarta.persistence.*;
import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Timestamp;

@Entity
@Data
//@Table(name = "myshop")
public class MyShop {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long num;

    private String name;

    private String price;

    private String color;

    private String receiving;

    @CreationTimestamp // now() 같은 거임
    @Column(updatable = false) // 수정 시 해당 컬럼은 수정하지 않음
    private Timestamp writeDay;
}
