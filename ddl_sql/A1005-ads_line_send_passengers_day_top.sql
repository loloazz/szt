
-- 【体现线路运输贡献度】 每线路单日运输乘客总次数排行榜，进站算一次，出站并且联程算一次

DROP TABLE IF EXISTS ods.ads_line_send_passengers_day_top;
CREATE EXTERNAL TABLE ods.ads_line_send_passengers_day_top(
company_name String comment '线路名',
`count` int
)
comment  '每线路单日运输乘客总次数排行榜'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_line_send_passengers_day_top';
