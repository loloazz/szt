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
      .config("spark.sql.shuffle.partitions",2)
      .enableHiveSupport()
      .getOrCreate()





    spark.sql(
      s"""
         |
        |INSERT OVERWRITE TABLE dwd.dwd_fact_szt_in_detail partition(DAY = '$day')
         |SELECT car_no ,
         |    card_no ,
         |    close_date ,
         |    company_name ,
         |    conn_mark ,
         |    deal_date ,
         |    deal_money ,
         |    deal_type,
         |    deal_value ,
         |    equ_no  ,
         |    station
         |FROM dwd.dwd_fact_szt_in_out_detail
         |WHERE deal_type = '地铁入站'
         |  AND DAY = '$day'
         |ORDER BY deal_date
         |
        |
      """.stripMargin)


  }
}
