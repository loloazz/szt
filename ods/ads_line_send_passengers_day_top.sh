#!/usr/bin/env bash
# **  文件名称: ads_line_send_passengers_day_top.sql
# **  创建日期: 2020年8月22日
# **  编写人员: qinxiao
# **  输入信息:
# **  输出信息:
# **
# **  功能描述:每线路单日运输乘客总次数排行榜
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

INSERT OVERWRITE TABLE ads.ads_line_send_passengers_day_top PARTITION(DAY = '${day}')
SELECT t1.company_name,
    t1.c+t2.c AS c
FROM
    (SELECT company_name,
        deal_type,
        conn_mark,
        count(*) c
    FROM dwd.dwd_fact_szt_in_out_detail
    WHERE DAY = '${day}' and deal_type='地铁入站'
    GROUP BY company_name,deal_type,conn_mark)
    t1,

    (SELECT company_name,
        deal_type,
        conn_mark,
        count(*) c
    FROM dwd.dwd_fact_szt_in_out_detail
    WHERE DAY = '${day}' and deal_type='地铁出站' and conn_mark='1'
    GROUP BY company_name,deal_type,conn_mark)
    t2

WHERE t1.company_name=t2.company_name
ORDER BY c DESC

"







