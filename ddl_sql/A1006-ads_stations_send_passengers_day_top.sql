

-- 【体现利用率最高的车站区间】 每日运输乘客最多的车站区间排行榜

drop table if exists ods.ads_stations_send_passengers_day_top;
create external table ods.ads_stations_send_passengers_day_top(
short_stations string comment '车站区间',
`count` int
)

comment  '每日运输乘客最多的车站区间排行榜 '
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_stations_send_passengers_day_top';

