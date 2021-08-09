#!/usr/bin/env bash
# **  文件名称: ads_card_deal_day_top.sh
# **  创建日期: 2020年8月22日
# **  编写人员: qinxiao
# **  输入信息:
# **  输出信息:
# **
# **  功能描述:卡片单日消费排行榜
# **  处理过程:
# **  Copyright(c) 2016 TianYi Cloud Technologies (China), Inc.
# **  All Rights Reserved.
#***********************************************************************************

#***********************************************************************************
#==修改日期==|===修改人=====|======================================================|
#
#***********************************************************************************



#获取脚本所在目录
shell_home="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#进入脚本目录
cd $shell_home


day=$1


spark-sql \
--master yarn-client \
--num-executors 2 \
--executor-memory 2G \
--executor-cores 1 \
--conf spark.sql.shuffle.partitions=4 \
-e "

insert overwrite table ads_card_deal_day_top partition (day='${day}')
SELECT
    t1.card_no,
    t1.deal_date_arr,
    t2.deal_sum,
    t1.company_name_arr,
    t1.station_arr,
    t1.conn_mark_arr,
    t3.deal_m_sum,
    t1.equ_no_arr,
    t1.`count`
from
    dws_card_record_day_wide as t1,
    (SELECT card_no, sum(deal_v) OVER(PARTITION BY card_no) AS deal_sum FROM dws_card_record_day_wide LATERAL VIEW explode(deal_value_arr) tmp as deal_v )t2,
    (SELECT card_no, sum(deal_m) OVER(PARTITION BY card_no) AS deal_m_sum FROM dws_card_record_day_wide LATERAL VIEW explode(deal_money_arr) tmp as deal_m )t3

    WHERE t1.day='${day}'  AND
    t1.card_no = t2.card_no AND
    t2.card_no = t3.card_no
    ORDER BY t2.deal_sum DESC



"







