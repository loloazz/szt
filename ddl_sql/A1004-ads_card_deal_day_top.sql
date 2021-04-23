---卡片单日消费排行榜
drop table IF EXISTS ods.ads_card_deal_day_top;
create EXTERNAL TABLE ods.ads_card_deal_day_top (
    card_no STRING comment '卡号',
    deal_date_arr ARRAY<STRING> comment '交易时间',
    deal_sum DOUBLE  comment '交易总值',
    company_name_arr ARRAY<STRING> comment '公司名称',
    station_arr ARRAY<STRING> comment '线路站点',
    conn_mark_arr ARRAY<STRING>  comment '联程标记',
    deal_m_sum DOUBLE  comment '交易总金额',
    equ_no_arr ARRAY<STRING> comment '设备编码',
    `count` INT
)
comment  '卡片单日消费排行榜'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_card_deal_day_top';
