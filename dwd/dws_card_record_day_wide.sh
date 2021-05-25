#!/usr/bin/env bash
# **  文件名称: dws_card_record_day_wide.sh
# **  创建日期: 2020年8月22日
# **  编写人员: qinxiao
# **  输入信息:
# **  输出信息:
# **
# **  功能描述:地铁出入站宽表数据
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



INSERT OVERWRITE TABLE dws.dws_card_record_day_wide PARTITION(DAY = '${day}')
SELECT card_no,
       collect_list(deal_date),
       collect_list(deal_value),
       collect_list(deal_type),
       collect_list(company_name),
       collect_list(station),
       collect_list(conn_mark),
       collect_list(deal_money),
       collect_list(equ_no),
       count(*) c
FROM dwd.dwd_fact_szt_in_out_detail
WHERE DAY = '${day}'
GROUP BY card_no
ORDER BY c DESC;

"







