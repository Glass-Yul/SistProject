package com.sist.springbootEx1.repository;

import com.sist.springbootEx1.domain.MyShop;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
//@RequiredArgsConstructor
public class MyShopRepository {

    @PersistenceContext
    private EntityManager em;

    public void save(MyShop myShop) {
        em.persist(myShop);
    }

    public List<MyShop> findAll() {
        return em.createQuery("select m from MyShop m", MyShop.class).getResultList();
    }

    public MyShop findById(Long num) {
        return em.find(MyShop.class, num);
    }

    public void delete(MyShop myShop) {
        em.remove(myShop);
    }

    public void update(MyShop myShop) {
        em.merge(myShop);
    }



}
