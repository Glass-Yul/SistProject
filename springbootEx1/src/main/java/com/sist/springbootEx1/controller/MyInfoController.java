package com.sist.springbootEx1.controller;

import com.fasterxml.jackson.annotation.JacksonAnnotationsInside;
import com.sist.springbootEx1.repository.MyInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/info")
public class MyInfoController {
    @Autowired
    private MyInfoRepository MyInfoRepository;


}
