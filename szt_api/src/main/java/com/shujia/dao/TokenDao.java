package com.shujia.dao;

import com.shujia.util.JDBCUtil;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Component
public class TokenDao {
    public Boolean queryByToken(String token) {

        Connection con = JDBCUtil.getConnection();

        try {
            PreparedStatement stat = con.prepareStatement("select * from tokens where token=?");

            stat.setString(1, token);

            ResultSet resultSet = stat.executeQuery();

            //查过token存在返回true
            if (resultSet.next()) {
                return true;
            }


        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            if (con!=null){
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }


        return false;
    }
}
