<?php 
class ControllerAccountAnalytics extends Controller {
	private $error = array();

	public function index() {
		if (!$this->member->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/analytics', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/analytics');

		$this->document->setTitle($this->language->get('heading_title'));
		// $this->document->addStyle('catalog/view/theme/default/css/clientStyles.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/summernote/css/summernote-bs3.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/summernote/css/summernote.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/rickshaw/css/rickshaw.min.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/morris/css/morris.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/datatables/css/dataTables.bootstrap.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/datatables/css/ColVis.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/datatables/css/TableTools.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addStyle('catalog/view/theme/default/js/vendor/datepicker/css/bootstrap-datetimepicker.css');
		$this->document->addStyle('catalog/view/theme/default/css/minimal-update.css');
		$this->document->addStyle('catalog/view/theme/default/css/analytics.css');
		$this->document->addScript('catalog/view/theme/default/js/vendor/summernote/summernote.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/flot/jquery.flot.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/flot/jquery.flot.time.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/flot/jquery.flot.selection.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/flot/jquery.flot.animator.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/flot/jquery.flot.orderBars.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/easypiechart/jquery.easypiechart.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/rickshaw/raphael-min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/rickshaw/d3.v2.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/rickshaw/rickshaw.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/morris/morris.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/chosen/chosen.jquery.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datatables/jquery.dataTables.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datatables/ColReorderWithResize.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datatables/colvis/dataTables.colVis.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datatables/tabletools/ZeroClipboard.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datatables/tabletools/dataTables.tableTools.min.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datatables/dataTables.bootstrap.js');
		$this->document->addScript('catalog/view/theme/default/js/vendor/datepicker/bootstrap-datetimepicker.min.js');



		$this->load->model('account/analytics');
		$this->load->model('account/member');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),     	
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),        	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_analytics'),
			'href'      => $this->url->link('account/analytics', '', 'SSL'),       	
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$member_info = $this->model_account_member->getMember($this->member->getId());

		$this->data['action'] = $this->url->link('account/analytics', '', 'SSL');

		$this->data['intro'] = sprintf($this->language->get('intro'), $member_info['site_name']);

		$this->data['member_info'] = $member_info;

		if ($member_info['analytics_id']) {
			$analytics_id = 'ga:' . $member_info['analytics_id'];
		} else {
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}

		if (isset($this->request->post['endDate'])) {
			$endDate = date('Y-m-d', strtotime($this->request->post['endDate']));
		} else {
			$endDate = date('Y-m-d');
		}

		if (isset($this->request->post['startDate'])) {
			$startDate = date('Y-m-d', strtotime($this->request->post['startDate']));
		} else {
			$startDate = date('Y-m-d',strtotime('-1 month',strtotime($endDate)));
		}

		//$startDate = "2015-02-10";
		//$endDate = "2015-02-24";
		//$params = array('output' => 'dataTable');
		//$metrics = "ga:users, ga:newUsers, ga:sessions, ga:bounces";
		
		// Card Row 1
		$flipcards = array();
		$flipcards['metrics'] = "ga:sessions, ga:sessionsPerUser, ga:pageviews, ga:avgTimeOnPage";
		$flipcardsParams = array('output' => 'dataTable');
		$flip_card_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $flipcards['metrics'], $flipcardsParams);
		$this->data['flip_cards'] = $flip_card_results['totalsForAllResults'];

		// Card Row 2
		$flipcards2 = array();
		$flipcards2['metrics'] = "ga:uniquePageviews, ga:organicSearches";
		$flipcards2Params = array('output' => 'dataTable');
		$flip_card_results2 = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $flipcards2['metrics'], $flipcards2Params);
		$this->data['flip_cards2'] = $flip_card_results2['totalsForAllResults'];

		// Card Row 3
		// $flipcards3 = array();
		// $flipcards3['metrics'] = "ga:bounceRate, ga:sessionsPerUser";
		// $flipcards3Params = array('output' => 'dataTable');
		// $flip_card_results3 = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $flipcards3['metrics'], $flipcards3Params);
		// $this->data['flip_cards3'] = $flip_card_results3['totalsForAllResults'];

		// Total Sessions
		$totalSessions = $flip_card_results['totalsForAllResults']['ga:sessions'];
		$this->data['totalSessions'] = $flip_card_results['totalsForAllResults']['ga:sessions'];

		// Users & New Users
		$visitStatistics = array();
		$visitStatistics['metrics'] = "ga:users, ga:newUsers";
		$visitStatisticsParams = array('output' => 'dataTable');
		$visitor_stats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $visitStatistics['metrics'], $visitStatisticsParams);
		$this->data['visitor_stats'] = $visitor_stats_results['totalsForAllResults'];

		// Visitor Stats
		$geographicStats = array();
		$geographicStats['dimensions'] = "ga:city";
		$geographicStats['metrics'] = "ga:sessions";
		$geographicStats['sort'] = "-ga:sessions";
		$geographicStats['max-results'] = 5;
		$geo_params = array('dimensions' => $geographicStats['dimensions'], 'sort' => $geographicStats['sort'], 'max-results' => $geographicStats['max-results']);
		$geo_stats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $geographicStats['metrics'], $geo_params);
		$this->data['geo_stats'] = $geo_stats_results['rows'];

		// Sessions By Browser Pie Chart
		$browserMetrics = "ga:sessions";
		$browserParams = array('dimensions' => "ga:browser", 'sort' => "-ga:sessions", 'max-results' => 5);
		$browserStats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $browserMetrics, $browserParams);
		$browser_total = 0;
		foreach ($browserStats_results['rows'] as $row) {
			$browser_total = $browser_total + (int)$row[1];
		}
		$this->data['browser_stats'] =  array(
			'browsers' => $browserStats_results['rows'],
			'others' => round((($totalSessions - $browser_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100']
			);

		// New vs Returning Users Pie Chart
		$visitsByVisitorMetrics = "ga:sessions";
		$visitsByVisitorParams = array('dimensions' => "ga:userType", 'sort' => "-ga:sessions", 'max-results' => 5);
		$visitsByVisitorStats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $visitsByVisitorMetrics, $visitsByVisitorParams);
		$visitsByVisitor_total = 0;
		foreach ($visitsByVisitorStats_results['rows'] as $row) {
			$visitsByVisitor_total = $visitsByVisitor_total + (int)$row[1];
		}
		$this->data['visitsByVisitor_stats'] =  array(
			'visits' => $visitsByVisitorStats_results['rows'],
			'others' => round((($totalSessions - $visitsByVisitor_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8']
			);

		// Visits By Traffic Type Pie Chart
		$visitsByTrafficMetrics = "ga:sessions";
		$visitsByTrafficParams = array('dimensions' => "ga:channelGrouping", 'sort' => "-ga:sessions", 'max-results' => 5);
		$visitsByTrafficStats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $visitsByTrafficMetrics, $visitsByTrafficParams);
		$visitsByTraffic_total = 0;
		foreach ($visitsByTrafficStats_results['rows'] as $row) {
			$visitsByTraffic_total = $visitsByTraffic_total + (int)$row[1];
		}
		$this->data['visitsByTraffic_stats'] =  array(
			'visits' => $visitsByTrafficStats_results['rows'],
			'others' => round((($totalSessions - $visitsByTraffic_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100']
			);

		// Traffic Sources Pie Chart
		$trafficSourcesMetrics = "ga:sessions";
		$trafficSourcesParams = array('dimensions' => "ga:source", 'sort' => "-ga:sessions", 'max-results' => 4);
		$trafficSourcesStats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $trafficSourcesMetrics, $trafficSourcesParams);
		$trafficSources_total = 0;
		foreach ($trafficSourcesStats_results['rows'] as $row) {
			$trafficSources_total = $trafficSources_total + (int)$row[1];
		}
		$this->data['trafficSources_stats'] =  array(
			'visits' => $trafficSourcesStats_results['rows'],
			'others' => round((($totalSessions - $trafficSources_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f']
			);

		// Device Categories Pie Chart
		$deviceMetrics = "ga:sessions";
		$deviceParams = array('dimensions' => "ga:deviceCategory", 'sort' => "-ga:sessions", 'max-results' => 4);
		$deviceStats_results = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $deviceMetrics, $deviceParams);
		$device_total = 0;
		foreach ($deviceStats_results['rows'] as $row) {
			$device_total = $device_total + (int)$row[1];
		}
		$this->data['device_stats'] =  array(
			'device' => $deviceStats_results['rows'],
			'others' => round((($totalSessions - $device_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f']
			);

		// Top Pages Table
		$topPages = array();
		$topPages['metrics'] = "ga:sessions, ga:pageviews";
		$topPagesParams = array('dimensions' => "ga:pageTitle");
		$topPagesResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $topPages['metrics'], $topPagesParams);
		$this->data['topPages'] = $topPagesResults['rows'];

		// Visits By Cities Table
		$cityStats = array();
		$cityStats['metrics'] = "ga:sessions";
		$cityParams = array('dimensions' => 'ga:city, ga:region, ga:country', 'sort' => '-ga:sessions');
		$cityStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $cityStats['metrics'], $cityParams);
		$this->data['cityStats'] = $cityStatsResults['rows'];

		// Top Organic Searches Table
		$organicStats = array();
		$organicStats['metrics'] = "ga:organicSearches";
		$organicParams = array('dimensions' => 'ga:keyword', 'sort' => '-ga:organicSearches');
		$organicStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $organicStats['metrics'], $organicParams);
		$this->data['organic'] = $organicStatsResults['rows'];

		// Top Sources Table
		$sourcesStats = array();
		$sourcesStats['metrics'] = "ga:sessions";
		$sourcesParams = array('dimensions' => 'ga:source', 'sort' => '-ga:sessions');
		$sourcesStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $sourcesStats['metrics'], $sourcesParams);
		$this->data['sources'] = $sourcesStatsResults['rows'];

		// Top Referrals Table
		$referralsStats = array();
		$referralsStats['metrics'] = "ga:sessions";
		$referralsParams = array('dimensions' => 'ga:source', 'sort' => '-ga:sessions');
		$referralsStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $referralsStats['metrics'], $referralsParams);
		$this->data['referrals'] = $referralsStatsResults['rows'];

		// Devices Used Table
		$deviceUsageStats = array();
		$deviceUsageStats['metrics'] = "ga:sessions";
		$deviceUsageParams = array('dimensions' => 'ga:mobileDeviceInfo', 'sort' => '-ga:sessions');
		$deviceUsageStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $deviceUsageStats['metrics'], $deviceUsageParams);
		$this->data['deviceUsage'] = $deviceUsageStatsResults['rows'];

		// Organic Searches By Referrer Table
		$organicReferrerStats = array();
		$organicReferrerStats['metrics'] = "ga:organicSearches";
		$organicReferrerParams = array('dimensions' => 'ga:fullReferrer', 'sort' => '-ga:organicSearches');
		$organicReferrerStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id, $startDate, $endDate, $organicReferrerStats['metrics'], $organicReferrerParams);
		$this->data['organicReferrer'] = $organicReferrerStatsResults['rows'];

		//Sessions And Page View Timeline
		$timelineStats = array();
		$timelineEndDate = date('Y-m-d');
	 	$timelineStartDate = date('Y-m-d',strtotime('-1 year',strtotime($timelineEndDate)));
		$timelineStats['metrics'] = "ga:sessions, ga:pageviews";
		$timelineParams = array('dimensions' => 'ga:month', 'sort' => '-ga:month');
		$timelineStatsResults = $this->model_account_analytics->queryAnalytics($analytics_id,  $timelineStartDate, $timelineEndDate, $timelineStats['metrics'], $timelineParams);
		$this->data['timeline'] = $timelineStatsResults['rows'];



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/analytics.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/analytics.tpl';
		} else {
			$this->template = 'default/template/account/analytics.tpl';
		}

		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/navigation',
			'common/header'	
		);

		$this->response->setOutput($this->render());	
	}
}
 ?>