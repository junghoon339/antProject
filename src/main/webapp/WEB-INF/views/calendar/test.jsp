<script src="/controller/resources/codebase/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
	<script src="/controller/resources/codebase/locale/recurring/locale_recurring_cr.js" type="text/javascript" charset="utf-8"></script>
	<script src="/controller/resources/codebase/locale/locale_cr.js" type="text/javascript" charset="utf-8"></script>
	<link rel="stylesheet" href="/controller/resources/codebase/dhtmlxscheduler.css" type="text/css" charset="utf-8">
	<div id='scheduler_here' class='dhx_cal_container' style='width:900px;height:100%;'>
		<div class='dhx_cal_navline'>
			<div class='dhx_cal_prev_button'>&nbsp;</div>
			<div class='dhx_cal_next_button'>&nbsp;</div>
			<div class='dhx_cal_today_button'></div>
			<div class='dhx_cal_date'></div>
			<div class='dhx_cal_tab' name='month_tab' style='left:76px;'></div>
			<div class='dhx_cal_tab' name='week_tab' style='left:140px;'></div>
			<div class='dhx_cal_tab' name='day_tab' style='left:204px;'></div>
		</div>
		<div class='dhx_cal_header'></div>
		<div class='dhx_cal_data'></div>
	</div>
	<script>

	scheduler.config.serverLists = {};
	scheduler.config.time_step = 60;
	scheduler.config.start_on_monday = false;
	scheduler.config.auto_end_date = true;
	scheduler.config.first_hour = 9;
	scheduler.config.last_hour = 19;
	scheduler.config.day_date = '%D';
	scheduler.config.skin = 'terrace';
	scheduler.config.event_duration = 60;
	scheduler.config.month_date = '%Yyear %MMONTH';
	scheduler.config.default_date = '%YYEAR %MMONTH %jDAY';
	scheduler.init('scheduler_here',new Date(2017, 5, 12, 17, 28, 38),'month');
	scheduler.parse([{"end_date":"12/25/2016 09:00","id":21,"text":"test","start_date":"12/24/2016 05:00"}], "json");
	
	var dp = new dataProcessor("events");
	dp.init(scheduler);
	dp.setTransactionMode("POST", false);</script>