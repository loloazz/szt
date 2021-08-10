drop table if exists dws.dws_in_out_sorted_card_date_wide;
create external table dws.dws_in_out_sorted_card_date_wide (
card_no string,
deal_date string,
ts string,
deal_value string,
deal_type string,
company_name string,
station string,
conn_mark string,
deal_money string,
equ_no string
)
comment  '宽表'
PARTITIONED BY (
    day string comment '天分区'
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS INPUTFORMAT 'org.apache.hadoop.mapred.TextInputFormat'
    OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
location '/daas/szt/dws/dws_in_out_sorted_card_date_wide';
