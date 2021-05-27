package com.shujia.controller;


import com.shujia.bean.LineSendPassengersDayTop;
import com.shujia.service.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
public class DataController {


    @GetMapping("/test")
    public String test(String s) {
        System.out.println(s);
        return "成功";
    }


    @Autowired
    private DataService dataService;


    @GetMapping("/ads_line_send_passengers_day_top")
    public ArrayList<LineSendPassengersDayTop> ads_line_send_passengers_day_top(String day, String token) {

        //查询数据库判断token是否正确
        if (token == null || !token.equals("123456")) {
            return null;
        }

        return dataService.ads_line_send_passengers_day_top(day);
    }
}
