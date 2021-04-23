drop table if exists ods.ads_line_single_ride_average_time_day_top;
create external table ods.ads_line_single_ride_average_time_day_top(
company_name string,
avg_time_s double
)
COMMENT '每条线路单程直达乘客耗时平均值排行榜'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_line_single_ride_average_time_day_top';

