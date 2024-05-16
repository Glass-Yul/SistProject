package com.sist.springbootEx1.controller;

import com.sist.springbootEx1.domain.Shop;
import com.sist.springbootEx1.domain.Test;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RestController
public class TestController {

    @GetMapping("/test")
    public Test hello() {
        Test test = new Test();
        test.setName("name");
        test.setAddr("강남");

        return test;
    }

    @GetMapping("/shop/list")
    public List<Shop> shopList() {
        List<Shop> list = new ArrayList<Shop>();

        for (int i = 0; i < 5; i++) {
            Shop shop = new Shop();
            shop.setShop("shop" + i + 1);
            shop.setCount(1);
            shop.setPrice(10000 + i * 1000);

            list.add(shop);
        }

        return list;
    }

    @GetMapping("/sist")
    public HashMap<String, String> hi() {
        HashMap<String, String> map = new HashMap<>();
        map.put("message", "Have a Nice Day!");

        return map;
    }

    //=======
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView view = new ModelAndView();
        view.addObject("name", "이효리");
        view.addObject("addr", "서울시");

        view.setViewName("home");
        return view;
    }

}
