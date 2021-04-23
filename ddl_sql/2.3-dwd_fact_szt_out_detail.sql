
-- -- - dwd_fact_szt_out_detail
drop table IF EXISTS dwd.dwd_fact_szt_out_detail;
create EXTERNAL TABLE IF NOT EXISTS dwd.dwd_fact_szt_out_detail(
    car_no String comment '车牌号',
    card_no String comment '卡号',
    close_date String comment '结算日期',
    company_name String comment '公司名称',
    conn_mark String comment '联程标记',
    deal_date String comment '交易时间',
    deal_money String comment '交易金额',
    deal_type String comment '交易类型',
    deal_value String comment '交易值',
    equ_no String comment '设备编码',
    station String comment '线路站点'
)

comment  '地铁出站'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/dwd/dwd_fact_szt_out_detail';
