drop table if exists dws.dws_in_out_sorted_card_date;
create external table dws.dws_in_out_sorted_card_date (
card_no string,
deal_date string,
deal_type string,
station string
)
comment  '宽表'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/dws/dws_in_out_sorted_card_date';
