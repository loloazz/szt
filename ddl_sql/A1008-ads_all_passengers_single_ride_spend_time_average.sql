drop table if exists ods.ads_all_passengers_single_ride_spend_time_average;
create external table ods.ads_all_passengers_single_ride_spend_time_average (
all_avg_time_s double comment '平均通勤时长'
)
COMMENT '所有乘客通勤时间平均值'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/ads/ads_all_passengers_single_ride_spend_time_average';
