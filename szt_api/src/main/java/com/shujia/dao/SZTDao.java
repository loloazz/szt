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
public class SZTDao {

    /**
     * 通过时间查询线路人次
     *
     * @param day 时间
     * @return
     */

    public ArrayList<LineSendPassengersDayTop> queryAdsLineSendPassengersDayTopByDay(String day) {

        ArrayList<LineSendPassengersDayTop> sendPassengersDayTops = new ArrayList<>();

        //1、创建链接
        Connection con = JDBCUtil.getConnection();

        try {
            PreparedStatement stat = con.prepareStatement("select * from ads_line_send_passengers_day_top where day=?");

            stat.setString(1, day);

            ResultSet resultSet = stat.executeQuery();

            //解析数据
            while (resultSet.next()) {
                String company_name = resultSet.getString("company_name");
                long count = resultSet.getLong("count");

                LineSendPassengersDayTop lineSendPassengersDayTop = new LineSendPassengersDayTop(company_name, count, day);

                sendPassengersDayTops.add(lineSendPassengersDayTop);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

        }

        return sendPassengersDayTops;

    }

}
