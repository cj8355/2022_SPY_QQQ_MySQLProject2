-- View '22 SPY data
select * from spy_vs_qqq_project2.spy;

-- View '22 QQQ data
select * from spy_vs_qqq_project2.qqq;

-- Percent daily change QQQ
select Date, SUM(open) as OpenPrice, SUM(`Adj Close`) as ClosePrice, Concat(Round((((sum(`Adj Close`) - sum(open))/ open) * 100), 2), "%") as PercentChange from spy_vs_qqq_project2.qqq
group by Date;

-- Percent daily change SPY
select Date, SUM(open) as OpenPrice, SUM(`Adj Close`) as ClosePrice, Concat(Round((((sum(`Adj Close`) - sum(open))/ open) * 100), 2), "%") as PercentChange from spy_vs_qqq_project2.spy
group by Date;

-- Top 10 Price Increases QQQ
select Date, SUM(open) as OpenPrice, SUM(`Adj Close`) as ClosePrice, Concat(Round((((sum(`Adj Close`) - sum(open))/ open) * 100), 2), "%") as PercentChange from spy_vs_qqq_project2.qqq
group by Date order by PercentChange DESC limit 10;

-- Top 10 Price Increases SPY
select Date, SUM(open) as OpenPrice, SUM(`Adj Close`) as ClosePrice, Concat(Round((((sum(`Adj Close`) - sum(open))/ open) * 100), 2), "%") as PercentChange from spy_vs_qqq_project2.spy
group by Date order by PercentChange DESC limit 10;

-- Top 10 Price Decreases QQQ
select Date, SUM(open) as OpenPrice, SUM(`Adj Close`) as ClosePrice, cast(Round((((sum(`Adj Close`) - sum(open))/ open) * 100), 2) as Float)  as PercentChange from spy_vs_qqq_project2.qqq
group by Date order by PercentChange ASC limit 10;

-- Top 10 Price Decreases SPY
select Date, SUM(open) as OpenPrice, SUM(`Adj Close`) as ClosePrice, cast(Round((((sum(`Adj Close`) - sum(open))/ open) * 100), 2) as Float)  as PercentChange from spy_vs_qqq_project2.spy
group by Date order by PercentChange ASC limit 10;

-- '22 Top 10 Vol days QQQ
select *  from spy_vs_qqq_project2.qqq order by Volume DESC limit 10;

-- '22 Top 10 Vol days SPY
select *  from spy_vs_qqq_project2.spy order by Volume DESC limit 10;


-- Join all data in both tables
select * from spy_vs_qqq_project2.spy inner join spy_vs_qqq_project2.qqq
on spy_vs_qqq_project2.spy.Date = spy_vs_qqq_project2.qqq.Date;