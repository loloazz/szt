package com.shujia.dao;

import com.shujia.bean.LineSendPassengersDayTop;
import com.shujia.util.JDBCUtil;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@Component
public class DataDao {

    public ArrayList<LineSendPassengersDayTop> ads_line_send_passengers_day_top(String day) {
        //查询数据库获取指标
        Connection con = JDBCUtil.getConnection();


        ArrayList<LineSendPassengersDayTop> list = new ArrayList<>();


        try {
            PreparedStatement stat = con.prepareStatement("select * from ads_line_send_passengers_day_top where day=?");

            stat.setString(1, day);

            ResultSet resultSet = stat.executeQuery();

            while (resultSet.next()) {
                String company_name = resultSet.getString("company_name");
                long count = resultSet.getLong("count");
                LineSendPassengersDayTop top = new LineSendPassengersDayTop(company_name, count, day);
                list.add(top);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return list;

    }

}
