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
		// $this->document->addStyle('catalog/view/theme/default/css/clientStyles.css');
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
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$member_id = $this->member->getId();
		$this->data['websites'] = $websites = $this->member->getWebsites();
		$member_info = $this->model_account_member->getMember($member_id);

		if (isset($this->request->post['analytics_id'])) {
			$analytics_id = 'ga:' . $this->request->post['analytics_id'];
			$this->data['analytics_id'] = $analytics_string = $this->request->post['analytics_id'];
		} elseif ($member_info['analytics_id']) {
			$analytics_id = 'ga:' . $member_info['analytics_id'];
			$this->data['analytics_id'] = $analytics_string = $member_info['analytics_id'];
		} else {
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}

		if (isset($this->request->post['endDate'])) {
			$this->data['endDate'] = $endDate = date('Y-m-d', strtotime($this->request->post['endDate']));
		} else {
			$this->data['endDate'] = $endDate = date('Y-m-d');
		}

		if (isset($this->request->post['startDate'])) {
			$this->data['startDate'] = $startDate = date('Y-m-d', strtotime($this->request->post['startDate']));
		} else {
			$this->data['startDate'] = $startDate = date('Y-m-d',strtotime('-1 month',strtotime($endDate)));
		}


		$this->data['action_date_select'] = $this->url->link('account/analytics', '', 'SSL');
		$this->data['action_site_select'] = $this->url->link('account/analytics', '', 'SSL');

		$this->data['intro'] = sprintf($this->language->get('intro'), $member_info['site_name']);
		$this->data['tagline'] = $this->language->get('tagline');

		foreach($websites as $site) {
			if($site['analytics_id'] == $analytics_string) {
				$this->data['intro'] = sprintf($this->language->get('intro'), $site['site_name']);
			}
		}

		$analytics = $this->model_account_analytics->getService();

		// Data segment return options:
		// 	profile_info => $card_query_results->getProfileInfo();
		// 	profile_name => $card_query_results->getProfileInfo()->getProfileName();
		// 	rows => $card_query_results->getRows();
		//	columnHeaders => $card_query_results->getColumnHeaders();
		//	Totals For Multiple metrics = > $card_query_results['totalsForAllResults'];

		$this->data['timeline_endDate'] = $timeline_EndDate = $endDate;
		$this->data['timeline_startDate'] = $timeline_StartDate = date('Y-m-d',strtotime('-1 year',strtotime($endDate)));

		// Sessions Timeline
		$sessions_timeline = array();
		$sessions_timeline['metrics'] = "ga:sessions";
		$sessions_timeline['params'] = array('dimensions' => 'ga:month', 'sort' => '-ga:month');
		$sessions_timeline_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $timeline_StartDate, $timeline_EndDate, $sessions_timeline);
		$this->data['sessions_line'] = $sessions_timeline_query_results->getRows();

		// Pageviews Timeline
		$pageviews_timeline = array();
		$pageviews_timeline['metrics'] = "ga:pageviews";
		$pageviews_timeline['params'] = array('dimensions' => 'ga:month', 'sort' => '-ga:month');
		$pageviews_timeline_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $timeline_StartDate, $timeline_EndDate, $pageviews_timeline);
		$this->data['pageviews_line'] = $pageviews_timeline_query_results->getRows();



		// Card Row 1
		$flipcard_query_data = array();
		$flipcard_query_data['metrics'] = "ga:sessions, ga:sessionsPerUser, ga:pageviews, ga:avgTimeOnPage, ga:uniquePageviews, ga:organicSearches";
		$flipcard_query_data['params'] = array();
		$flipcard_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $flipcard_query_data);
		$this->data['flip_cards'] = $flipcard_query_results['totalsForAllResults'];

		// Users & New Users
		$visitStatistics = array();
		$visitStatistics['metrics'] = "ga:users, ga:newUsers";
		$visitStatistics['params'] = array();
		$visitor_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $visitStatistics);
		$this->data['visitor_stats'] = $visitor_query_results['totalsForAllResults'];

		// Visitor Stats
		$geographicStats = array();
		$geographicStats['metrics'] = "ga:sessions";
		$geographicStats['params']= array('dimensions' => "ga:city", 'sort' => "-ga:sessions", 'max-results' => 5);
		$geo_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $geographicStats);
		$this->data['geo_stats'] = $geo_query_results->getRows();

		// Total Sessions
		$totalSessions = $flipcard_query_results['totalsForAllResults']['ga:sessions'];
		$this->data['totalSessions'] = $flipcard_query_results['totalsForAllResults']['ga:sessions'];

		// Sessions By Browser Pie Chart
		$browserStats = array();
		$browserStats['metrics'] = "ga:sessions";
		$browserStats['params'] = array('dimensions' => "ga:browser", 'sort' => "-ga:sessions", 'max-results' => 5);
		$browserStats_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $browserStats);
		$browser_total = 0;
		foreach ($browserStats_query_results->getRows() as $row) {
			$browser_total = $browser_total + (int)$row[1];
		}
		$this->data['browser_stats'] =  array(
			'browsers' => $browserStats_query_results->getRows(),
			'others' => round((($totalSessions - $browser_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100']
		);

		// New vs Returning Users Pie Chart
		$visitsByVisitor = array();
		$visitsByVisitor['metrics'] = "ga:sessions";
		$visitsByVisitor['params'] = array('dimensions' => "ga:userType", 'sort' => "-ga:sessions", 'max-results' => 5);
		$visitsByVisitor_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $visitsByVisitor);
		$visitsByVisitor_total = 0;
		foreach ($visitsByVisitor_query_results->getRows() as $row) {
		 	$visitsByVisitor_total = $visitsByVisitor_total + (int)$row[1];
		}
		$this->data['visitsByVisitor_stats'] =  array(
			'visits' => $visitsByVisitor_query_results->getRows(),
			'others' => round((($totalSessions - $visitsByVisitor_total)/ $totalSessions)*100),
			'colors' => ['#00a3d8', '#2fbbe8']
		);

		// Visits By Traffic Type Pie Chart
		$visitsByTraffic = array();
		$visitsByTraffic['metrics'] = "ga:sessions";
		$visitsByTraffic['params'] = array('dimensions' => "ga:channelGrouping", 'sort' => "-ga:sessions", 'max-results' => 5);
		$visitsByTraffic_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $visitsByTraffic);
		$visitsByTraffic_total = 0;
		foreach ($visitsByTraffic_query_results->getRows() as $row) {
			$visitsByTraffic_total = $visitsByTraffic_total + (int)$row[1];
		}
		$this->data['visitsByTraffic_stats'] =  array(
			'visits' => $visitsByTraffic_query_results->getRows(),
		 	'others' => round((($totalSessions - $visitsByTraffic_total)/ $totalSessions)*100),
		 	'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100']
		);

		// Traffic Sources / visits by channel Pie Chart
		$trafficSources = array();
		$trafficSources['metrics'] = "ga:sessions";
		$trafficSources['params'] = array('dimensions' => "ga:source", 'sort' => "-ga:sessions", 'max-results' => 4);
		$trafficSources_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $trafficSources);
		$trafficSources_total = 0;
		foreach ($trafficSources_query_results->getRows() as $row) {
		 	$trafficSources_total = $trafficSources_total + (int)$row[1];
		}
		$this->data['trafficSources_stats'] =  array(
		 	'visits' => $trafficSources_query_results->getRows(),
		 	'others' => round((($totalSessions - $trafficSources_total)/ $totalSessions)*100),
		 	'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f']
		);

		// Device Categories Pie Chart
		$deviceCat = array();
		$deviceCat['metrics'] = "ga:sessions";
		$deviceCat['params'] = array('dimensions' => "ga:deviceCategory", 'sort' => "-ga:sessions", 'max-results' => 4);
		$deviceCat_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $deviceCat);
		$deviceCat_total = 0;
		foreach ($deviceCat_query_results->getRows() as $row) {
		 	$deviceCat_total = $deviceCat_total + (int)$row[1];
		}
		$this->data['device_stats'] =  array(
		 	'device' => $deviceCat_query_results->getRows(),
		 	'others' => round((($totalSessions - $deviceCat_total)/ $totalSessions)*100),
		 	'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f']
		);

		// Top Pages Table
		$topPages = array();
		$topPages['metrics'] = "ga:sessions, ga:pageviews";
		$topPages['params'] = array('dimensions' => "ga:pageTitle");
		$topPages_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $topPages);
		$this->data['topPages'] = array();
		$this->data['topPages']['rows'] = $topPages_query_results->getRows();
		$this->data['topPages']['headers'] = $topPages_query_results->getColumnHeaders();
		$this->data['topPages']['name'] = ' Top Pages';
		$this->data['topPages']['id'] = 'top-pages';

		// Visits By Cities Table
		$cityVisits = array();
		$cityVisits['metrics'] = "ga:sessions";
		$cityVisits['params'] = array('dimensions' => 'ga:city, ga:region, ga:country', 'sort' => '-ga:sessions');
		$cityVisits_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $cityVisits);
		$this->data['cityVisits'] = array();
		$this->data['cityVisits']['rows'] = $cityVisits_query_results->getRows();
		$this->data['cityVisits']['headers'] = $cityVisits_query_results->getColumnHeaders();
		$this->data['cityVisits']['name'] = ' Visits By City';
		$this->data['cityVisits']['id'] = 'city-visits';

		// Top Organic Searches Table
		$organicSearch = array();
		$organicSearch['metrics'] = "ga:organicSearches";
		$organicSearch['params'] = array('dimensions' => 'ga:keyword', 'sort' => '-ga:organicSearches');
		$organicSearch_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $organicSearch);
		$this->data['organicSearch'] = array();
		$this->data['organicSearch']['rows'] = $organicSearch_query_results->getRows();
		$this->data['organicSearch']['headers'] = $organicSearch_query_results->getColumnHeaders();
		$this->data['organicSearch']['name'] = ' Top Organic Searches';
		$this->data['organicSearch']['id'] = 'organic-search';

		// Top Sources Table
		$topSources = array();
		$topSources['metrics'] = "ga:sessions";
		$topSources['params'] = array('dimensions' => 'ga:source', 'sort' => '-ga:sessions');
		$topSources_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $topSources);
		$this->data['topSources'] = array();
		$this->data['topSources']['rows'] = $topSources_query_results->getRows();
		$this->data['topSources']['headers'] = $topSources_query_results->getColumnHeaders();
		$this->data['topSources']['name'] = ' Top Sources';
		$this->data['topSources']['id'] = 'sources';

		// Top Referrals Table
		$topReferrals = array();
		$topReferrals['metrics'] = "ga:sessions";
		$topReferrals['params'] = array('dimensions' => 'ga:source', 'sort' => '-ga:sessions');
		$topReferrals_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $topReferrals);
		$this->data['topReferrals'] = array();
		$this->data['topReferrals']['rows'] = $topReferrals_query_results->getRows();
		$this->data['topReferrals']['headers'] = $topReferrals_query_results->getColumnHeaders();
		$this->data['topReferrals']['name'] = ' Top Referrals';
		$this->data['topReferrals']['id'] = 'referrals';

		// Devices Used Table
		$deviceUsage = array();
		$deviceUsage['metrics'] = "ga:sessions";
		$deviceUsage['params'] = array('dimensions' => 'ga:mobileDeviceInfo', 'sort' => '-ga:sessions');
		$deviceUsage_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $deviceUsage);
		$this->data['deviceUsage'] = array();
		$this->data['deviceUsage']['rows'] = $deviceUsage_query_results->getRows();
		$this->data['deviceUsage']['headers'] = $deviceUsage_query_results->getColumnHeaders();
		$this->data['deviceUsage']['name'] = ' Mobile Devices Used';
		$this->data['deviceUsage']['id'] = 'devices-used';

		// Organic Searches By Referrer Table
		$organicReferrer = array();
		$organicReferrer['metrics'] = "ga:organicSearches";
		$organicReferrer['params'] = array('dimensions' => 'ga:fullReferrer', 'sort' => '-ga:organicSearches');
		$organicReferrer_query_results = $this->model_account_analytics->getResults($analytics, $analytics_id, $startDate, $endDate, $organicReferrer);
		$this->data['organicReferrer'] = array();
		$this->data['organicReferrer']['rows'] = $organicReferrer_query_results->getRows();
		$this->data['organicReferrer']['headers'] = $organicReferrer_query_results->getColumnHeaders();
		$this->data['organicReferrer']['name'] = ' Organic Searches By Referrer';
		$this->data['organicReferrer']['id'] = 'organic-referrer';






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