package com.sist.springbootEx1.service;

import com.sist.springbootEx1.domain.MyShop;
import com.sist.springbootEx1.repository.MyShopRepository;
import jakarta.persistence.Id;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly=true)
public class MyShopService {
    @Autowired
    private MyShopRepository shopRepository;

    @Transactional
    public void save(MyShop shop) {
        shopRepository.save(shop);
    }

    public MyShop findById(Long num) {
        return shopRepository.findById(num);
    }

    public List<MyShop> findAll() {
        return shopRepository.findAll();
    }

    @Transactional
    public void delete(MyShop shop) {
        shopRepository.delete(shop);
    }

    @Transactional
    public void update(MyShop shop) {
        shopRepository.update(shop);
    }
}
