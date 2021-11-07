package com.shujia.service;

import com.shujia.bean.LineSendPassengersDayTop;
import com.shujia.dao.SZTDao;
import com.shujia.dao.TokenDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class SZTService {

    @Autowired
    private SZTDao sztDao;


    @Autowired
    private TokenDao tokenDao;


    public ArrayList<LineSendPassengersDayTop> queryAdsLineSendPassengersDayTopByDay(String day, String token) {
        if (tokenDao.queryByToken(token)) {
            return sztDao.queryAdsLineSendPassengersDayTopByDay(day);
        }
        return null;

    }

}