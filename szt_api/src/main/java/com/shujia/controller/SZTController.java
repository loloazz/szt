package com.shujia.controller;

import com.shujia.bean.LineSendPassengersDayTop;
import com.shujia.service.SZTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class SZTController {

    @Autowired
    private SZTService sztService;


    @GetMapping("/queryAdsLineSendPassengersDayTopByDay")
    public ArrayList<LineSendPassengersDayTop> queryAdsLineSendPassengersDayTopByDay(String day,String token) {
        System.out.println("接口被访问");
        return sztService.queryAdsLineSendPassengersDayTopByDay(day,token);
    }
}
