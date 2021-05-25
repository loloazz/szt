#!/usr/bin/env bash
# **  文件名称: dwd_fact_szt_out_detail.sh
# **  创建日期: 2020年8月22日
# **  编写人员: qinxiao
# **  输入信息:
# **  输出信息:
# **
# **  功能描述:地铁出战数据
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



INSERT OVERWRITE TABLE dwd.dwd_fact_szt_out_detail partition(DAY = '${day}')
SELECT  car_no ,
       card_no ,
       close_date,
       company_name,
       conn_mark ,
       deal_date ,
       deal_money ,
       deal_type ,
       deal_value,
       equ_no,
       station
FROM dwd.dwd_fact_szt_in_out_detail
WHERE deal_type = '地铁出站'
  AND DAY = '${day}'
ORDER BY deal_date

"








