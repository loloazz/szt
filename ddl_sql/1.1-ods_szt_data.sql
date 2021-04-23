
--2 ODS 原始数据不做任何处理
drop table IF EXISTS ods.ods_szt_data;
create EXTERNAL TABLE IF NOT EXISTS  ods_szt_data(
    car_no String comment '车牌号',
    card_no String comment '卡号',
    close_date String comment '结算日期',
    company_name String comment '公司名称',
    conn_mark String comment '联程标记',
    deal_date String comment '交易日期时间',
    deal_money String comment '交易金额',
    deal_type String comment '交易类型',
    deal_value String comment '交易值',
    equ_no String comment '设备编码',
    station String comment '线路站点'
)

comment  '深圳地铁刷卡信息表'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ods/ods_szt_data';


select * from ods_szt_data where DAY = '2018-09-01' LIMIT 10;

select collect_set(deal_type) from ods_szt_data; --["地铁出站", "地铁入站", "巴士"]
