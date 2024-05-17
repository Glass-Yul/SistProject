package com.sist.springbootEx1.controller;

import com.sist.springbootEx1.domain.MyShop;
import com.sist.springbootEx1.dto.MyShopDto;
import com.sist.springbootEx1.repository.MyShopRepository;
import com.sist.springbootEx1.service.MyShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller()
@RequestMapping("/shop")
public class MyShopController {
    @Autowired
    private MyShopService myShopService;

    @GetMapping("")
    public String start() {
        return "redirect:/shop/list";
    }

    // 리스트
    @GetMapping("/list")
    public ModelAndView list() {
        ModelAndView view = new ModelAndView();
        List<MyShop> myShops = myShopService.findAll();

        view.addObject("myShops", myShops);
        view.addObject("totalCount", myShops.size());

        view.setViewName("myshop/shopList");

        return view;
    }

    // 입력폼
    @GetMapping("/writeform")
    public String addFrom() {
        return "myshop/addForm";
    }

    // insert
    @PostMapping("/insert")
    public String add(@ModelAttribute MyShop myShop) {
        myShopService.save(myShop);

        return "redirect:/shop/list";
    }

    // 수정폼
    @GetMapping("/updateform")
    public ModelAndView updateForm(@RequestParam Long num) {
        ModelAndView view = new ModelAndView();
        MyShop myShop = myShopService.findById(num);
        view.addObject("myShop", myShop);

        view.setViewName("myshop/updateForm");

        return view;
    }

    // 수정
    @PostMapping("/update")
    public String update(@ModelAttribute MyShop myShop) {
        myShopService.update(myShop);

        return "redirect:/shop/list";
    }

    // 삭제
    @GetMapping("/delete")
    public String delete(@RequestParam Long num) {
        MyShop findMyShop = myShopService.findById(num);
        myShopService.delete(findMyShop);

        return "redirect:/shop/list";
    }
}
