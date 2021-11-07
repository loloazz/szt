package com.shujia.service;

import com.shujia.bean.LineSendPassengersDayTop;
import com.shujia.dao.DataDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class DataService {


    @Autowired
    private DataDao dataDao;


     public ArrayList<LineSendPassengersDayTop> ads_line_send_passengers_day_top(String day) {
        return dataDao.ads_line_send_passengers_day_top(day);
    }

}