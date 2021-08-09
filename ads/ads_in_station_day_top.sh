#!/usr/bin/env bash
# **  文件名称: dwd_fact_szt_in_out_detail.sh
# **  创建日期: 2020年8月22日
# **  编写人员: qinxiao
# **  输入信息:
# **  输出信息:
# **
# **  功能描述:地铁入站数据
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

INSERT OVERWRITE TABLE ads.ads_in_station_day_top PARTITION(DAY = '${day}')
SELECT station,
       collect_list(deal_date),
       collect_list(card_no),
       collect_list(company_name),
       collect_list(equ_no),
       count(*) c
FROM dwd.dwd_fact_szt_in_detail
WHERE DAY = '${day}' and  station <> '""'
GROUP BY station
ORDER BY c DESC

"







