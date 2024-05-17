package com.sist.springbootEx1.domain;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class MyInfo {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long num;

    private String name;

    private String ph;

    private String addr;

    private String photo;
}
