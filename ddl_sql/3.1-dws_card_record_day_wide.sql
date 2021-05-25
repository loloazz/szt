
-- --DWS 宽表

drop table IF EXISTS dws.dws_card_record_day_wide;
create EXTERNAL TABLE dws.dws_card_record_day_wide(
    card_no STRING comment '卡号',
    deal_date_arr ARRAY < STRING >  comment '交易时间',
    deal_value_arr ARRAY < STRING >  comment '交易值',
    deal_type_arr ARRAY < STRING >  comment '交易类型',
    company_name_arr ARRAY < STRING >  comment '公司名称',
    station_arr ARRAY < STRING >  comment '线路站点',
    conn_mark_arr ARRAY < STRING >  comment '联程标记',
    deal_money_arr ARRAY < STRING >  comment '交易金额',
    equ_no_arr ARRAY < STRING >  comment '设备编码',
    `count` int
)
comment  '宽表'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/dws/dws_card_record_day_wide';
