
drop table IF EXISTS ods.ads_in_out_station_day_top;
CREATE EXTERNAL TABLE ods.ads_in_out_station_day_top(
    station STRING comment '线路站点',
    deal_date_arr ARRAY < STRING > comment '交易时间列表',
    card_no_arr ARRAY < STRING > comment '卡号列表',
    deal_value_arr ARRAY < STRING > comment '交易值列表',
    deal_type_arr ARRAY < STRING > comment '交易类型列表',
    company_name_arr ARRAY < STRING > comment '公司名称列表',
    conn_mark_arr ARRAY < STRING > comment '联程标记列表',
    deal_money_arr ARRAY < STRING > comment '交易金额列表',
    equ_no_arr ARRAY < STRING > comment '设备编码列表',
    `count` int
)
comment  '每站进站人次排行榜'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_in_out_station_day_top';
