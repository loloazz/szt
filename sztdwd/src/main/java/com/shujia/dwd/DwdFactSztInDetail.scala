package com.shujia.dwd

import org.apache.spark.internal.Logging
import org.apache.spark.sql.SparkSession

object DwdFactSztInDetail extends Logging {
  def main(args: Array[String]): Unit = {

    if (args.length == 0) {
      log.error("时间参数为空")
      return
    }

    //时间参数
    val day = args(0)

    log.info(s"当前时间分区为：$day")


    val spark: SparkSession = SparkSession
      .builder()
      .appName("DwdFactSztInDetail")
      .enableHiveSupport()
      .getOrCreate()


    spark.sql(
      s"""
         |
        |INSERT OVERWRITE TABLE dwd.dwd_fact_szt_in_detail partition(DAY = '$day')
         |SELECT deal_date,
         |       close_date,
         |       card_no,
         |       deal_value,
         |       deal_type,
         |       company_name,
         |       car_no,
         |       station,
         |       conn_mark,
         |       deal_money,
         |       equ_no
         |FROM dwd.dwd_fact_szt_in_out_detail
         |WHERE deal_type = '地铁入站'
         |  AND DAY = '$day'
         |ORDER BY deal_date
         |
        |
      """.stripMargin)


  }
}
