drop table if exists ads.ads_passenger_spend_time_day_top;
create external table ads.ads_passenger_spend_time_day_top
(
  card_no string,
  company_name string,
  ts_deal_type_station string,
  ts_next_station string,
  time_s double
)
COMMENT '每条线路单程直达乘客耗时平均值排行榜'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_passenger_spend_time_day_top';
