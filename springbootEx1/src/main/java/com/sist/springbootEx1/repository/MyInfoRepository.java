package com.sist.springbootEx1.repository;

import com.sist.springbootEx1.domain.MyInfo;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

@Repository
public class MyInfoRepository {
    @PersistenceContext
    private EntityManager em;

    public void save(MyInfo myInfo) {
        em.persist(myInfo);
    }



}
