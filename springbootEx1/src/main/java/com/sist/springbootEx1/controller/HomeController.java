package com.sist.springbootEx1.controller;

import com.sist.springbootEx1.domain.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

//@RestController
@Controller
public class HomeController {

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/form1")
    public String form1() {
        return "form/form1";
    }

    @PostMapping("/read1")
    public ModelAndView result1(@RequestParam String name
                        , @RequestParam String java
                        , @RequestParam String spring) {

        ModelAndView view = new ModelAndView();
        view.addObject("name", name);
        view.addObject("java", java);
        view.addObject("spring", spring);

        view.setViewName("result/result1");

        return view;
    }

    @GetMapping("/form2")
    public String form2() {
        return "form/form2";
    }

    /*@PostMapping("/show2")
    public ModelAndView result2(@RequestParam String name
            , @RequestParam String ph
            , @RequestParam String addr) {

        ModelAndView view = new ModelAndView();
        view.addObject("name", name);
        view.addObject("ph", ph);
        view.addObject("addr", addr);

        view.setViewName("result/result2");

        return view;
    }*/
    @PostMapping("/show2")
    public String result2(@ModelAttribute Member member) {

        return "result/result2";
    }



}
