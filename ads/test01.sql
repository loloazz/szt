                        dws_card_record_day_wide

字段名	                字段类型	        中文名
card_no         	    STRING	        卡号
deal_date_arr	        ARRAY<STRING>	交易时间
deal_value_arr	        ARRAY<STRING>	交易值
deal_type_arr	        ARRAY<STRING>	交易类型
company_name_arr	    ARRAY<STRING>	公司名称
station_arr	            ARRAY<STRING>	线路站点
conn_mark_arr	        ARRAY<STRING>	联程标记
deal_money_arr	        ARRAY<STRING>	交易金额
equ_no_arr	            ARRAY<STRING>	设备编码
`count`	                int	            数量




        每张卡日消费排行：ads_card_deal_day_top

                                                    dws_card_record_day_wide

    字段名	            字段类型	        中文名
    card_no	            STRING	        卡号
    deal_date_arr	    ARRAY<STRING>	交易时间列表
    deal_sum	        DOUBLE	        卡号交易总值
    company_name_arr	ARRAY<STRING>	公司名称列表
    station_arr	        ARRAY<STRING>	线路站点列表
    conn_mark_arr	    ARRAY<STRING>	联程标记列表
    deal_m_sum	        DOUBLE	        交易总金额
    equ_no_arr	        ARRAY<STRING>	设备编码列表
    `count`	            INT


select   card_no from dws.dws_card_record_day_wide

select

select * from
(

select t.card_no,t.day1,sum(value) as deal_sum from
(

select card_no,value,substring(day1,0,10) as day1  from dws.dws_card_record_day_wide
lateral view explode (deal_money_arr)  tmp  as  value


) as t

group by  t.card_no,t.day1

) as tt
order by tt.deal_sum desc

limit 10;





(select card_no,substring(date1,0,10)  from dws.dws_card_record_day_wide
lateral view explode (deal_date_arr)  tmpDay  as  date1)


hive> select mname,cate,lang from movie
lateral view explode(split(category,',')) tmp as cate
lateral view explode(split(language,','))  tmp as lang;

+--------------+-------+------------+
|    mname     | cate  |  lang      |
+--------------+-------+------------+
| 《疑犯追踪》       | 悬疑    | English    |
| 《疑犯追踪》       | 悬疑    | Chinese    |
| 《疑犯追踪》       | 悬疑    | Janpanese  |
| 《疑犯追踪》       | 悬疑    | Krease     |
| 《疑犯追踪》       | 动作    | English    |
| 《疑犯追踪》       | 动作    | Chinese    |
| 《疑犯追踪》       | 动作    | Janpanese  |
| 《疑犯追踪》       | 动作    | Krease     |
| 《疑犯追踪》       | 科幻    | English    |
| 《疑犯追踪》       | 科幻    | Chinese    |
| 《疑犯追踪》       | 科幻    | Janpanese  |
| 《疑犯追踪》       | 科幻    | Krease     |
| 《疑犯追踪》       | 剧情    | English    |
| 《疑犯追踪》       | 剧情    | Chinese    |
| 《疑犯追踪》       | 剧情    | Janpanese  |
| 《疑犯追踪》       | 剧情    | Krease     |
| 《Lie to me》  | 悬疑    | English    |
| 《Lie to me》  | 悬疑    | Chinese    |
| 《Lie to me》  | 悬疑    | Janpanese  |
| 《Lie to me》  | 悬疑    | Gernemic   |
| 《Lie to me》  | 警匪    | English    |
| 《Lie to me》  | 警匪    | Chinese    |
| 《Lie to me》  | 警匪    | Janpanese  |
| 《Lie to me》  | 警匪    | Gernemic   |
| 《Lie to me》  | 动作    | English    |
| 《Lie to me》  | 动作    | Chinese    |
| 《Lie to me》  | 动作    | Janpanese  |
| 《Lie to me》  | 动作    | Gernemic   |
| 《Lie to me》  | 心理    | English    |
| 《Lie to me》  | 心理    | Chinese    |
| 《Lie to me》  | 心理    | Janpanese  |
| 《Lie to me》  | 心理    | Gernemic   |
| 《Lie to me》  | 剧情    | English    |
| 《Lie to me》  | 剧情    | Chinese    |
| 《Lie to me》  | 剧情    | Janpanese  |
| 《Lie to me》  | 剧情    | Gernemic   |
| 《战狼2》        | 战争    | English    |
| 《战狼2》        | 战争    | Chinese    |
| 《战狼2》        | 战争    | Janpanese  |
| 《战狼2》        | 动作    | English    |
| 《战狼2》        | 动作    | Chinese    |
| 《战狼2》        | 动作    | Janpanese  |
| 《战狼2》        | 灾难    | English    |
| 《战狼2》        | 灾难    | Chinese    |
| 《战狼2》        | 灾难    | Janpanese  |
+--------------+-------+------------+
45 rows selected (0.052 seconds)
