package com.shujia.util;

import org.apache.commons.dbcp2.BasicDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class JDBCUtil {

    private static BasicDataSource dataSource;

    static {

        dataSource = new BasicDataSource();

        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://node1:3306/szt_ods?useUnicode=true&characterEncoding=utf-8");
        dataSource.setUsername("root");
        dataSource.setPassword("123456");

        //初始连接池大小
        dataSource.setInitialSize(5);

        //最大连接数量
        dataSource.setMaxIdle(10);


    }

    /**
     * 创建连接的工具
     */

    public static Connection getConnection() {
        //从连接池中获取连接
        //再连接池中已经创建好很多连接了，每一次获取连接是不重新创建
        Connection con = null;
        try {
            con = dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;

    }
}
