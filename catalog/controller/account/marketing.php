<?php
class ControllerAccountMarketing extends Controller {
	private $error = array();

	public function index() {
		if (!$this->member->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/marketing', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/marketing');

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
		$this->document->addStyle('catalog/view/theme/default/css/marketing.css');
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
		$this->document->addScript('catalog/view/theme/default/js/vendor/webcomponentsjs/webcomponents-lite.min.js');
		$this->document->addLink('catalog/view/theme/default/js/vendor/components/google-analytics/google-analytics.html','import');
		$this->document->addLink('catalog/view/theme/default/js/vendor/components/google-signin/google-signin.html','import');


		$this->load->model('account/marketing');
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
			'text'      => $this->language->get('text_marketing'),
			'href'      => $this->url->link('account/marketing', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['bing'] = $this->url->link('account/bing', '', 'SSL');

		$member_id = $this->member->getId();
		$this->data['websites'] = $websites = $this->member->getWebsites();
		$member_info = $this->model_account_member->getMember($member_id);

		if (isset($this->request->post['analytics_id'])) {
			$analytics_id = 'ga:' . $this->request->post['analytics_id'];
			$adwords_id = $this->request->get['adwords_id'];
			$this->data['analytics_id'] = $analytics_string = $this->request->post['analytics_id'];
		} elseif ($member_info['analytics_id']) {
			$adwords_id = $member_info['adwords_id'];
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

		$this->data['action_date_select'] = $this->url->link('account/marketing', '&adwords_id=' . $adwords_id, 'SSL');
		$this->data['action_site_select'] = $this->url->link('account/marketing', '&adwords_id=' . $adwords_id, 'SSL');

		$this->data['intro'] = sprintf($this->language->get('intro'), $member_info['site_name']);
		$this->data['tagline'] = $this->language->get('tagline');

		foreach($websites as $site) {
			if($site['analytics_id'] == $analytics_string) {
				$this->data['intro'] = sprintf($this->language->get('intro'), $site['site_name']);
			}
		}

		$marketing = $this->model_account_marketing->getService();

		// Data segment return options:
		// 	profile_info => $card_query_results->getProfileInfo();
		// 	profile_name => $card_query_results->getProfileInfo()->getProfileName();
		// 	rows => $card_query_results->getRows();
		//	columnHeaders => $card_query_results->getColumnHeaders();
		//	Totals For Multiple metrics = > $card_query_results['totalsForAllResults'];

		$this->data['timeline_endDate'] = $timeline_EndDate = $endDate;
		$this->data['timeline_startDate'] = $timeline_StartDate = date('Y-m-d',strtotime('-1 year',strtotime($endDate)));

		// clicks Timeline
		$clicks_timeline = array();
		$clicks_timeline['metrics'] = "ga:adclicks";
		$clicks_timeline['params'] = array('dimensions' => 'ga:month, ga:sourceMedium', 'filters' => 'ga:sourceMedium==google / cpc', 'sort' => 'ga:month', 'samplingLevel' => 'FASTER');
		$clicks_timeline_query_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $timeline_StartDate, $timeline_EndDate, $clicks_timeline);
		$this->data['clicks_line'] = $clicks_timeline_query_results->getRows();
		$this->data['result'] = $clicks_timeline_query_results;


		// impressions Timeline
		$impresions_timeline = array();
		$impresions_timeline['metrics'] = "ga:impressions";
		$impresions_timeline['params'] = array('dimensions' => 'ga:month, ga:sourceMedium', 'filters' => 'ga:sourceMedium==google / cpc', 'sort' => 'ga:month', 'samplingLevel' => 'FASTER');
		$impresions_timeline_query_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $timeline_StartDate, $timeline_EndDate, $impresions_timeline);
		$this->data['impressions_line'] = $impresions_timeline_query_results->getRows();

		// Impresssions
		$flipcards = array();
		$flipcards['metrics'] = "ga:impressions";
		$flipcards['params'] = array('dimensions' => "ga:sourceMedium",'filters' => 'ga:sourceMedium==google / cpc', 'samplingLevel' => 'FASTER');
		$flip_card_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $flipcards);
		$this->data['impressions'] = $flip_card_results['totalsForAllResults'];

		// Clicks
		$flipcards = array();
		$flipcards['metrics'] = "ga:adclicks";
		$flipcards['params'] = array('dimensions' => "ga:sourceMedium",'filters' => 'ga:sourceMedium==google / cpc', 'samplingLevel' => 'FASTER');
		$flip_card_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $flipcards);
		$this->data['clicks'] = $flip_card_results['totalsForAllResults'];

		// CTR
		$flipcards = array();
		$flipcards['metrics'] = "ga:CTR";
		$flipcards['params'] = array('dimensions' => "ga:sourceMedium",'filters' => 'ga:sourceMedium==google / cpc');
		$flip_card_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $flipcards);
		$this->data['ctr'] = $flip_card_results['totalsForAllResults'];

		// Visits
		$flipcards = array();
		$flipcards['metrics'] = "ga:sessions";
		$flipcards['params'] = array('dimensions' => "ga:sourceMedium",'filters' => 'ga:sourceMedium==google / cpc', 'samplingLevel' => 'FASTER');
		$flip_card_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $flipcards);
		$this->data['visits'] = $flip_card_results['totalsForAllResults'];

		// Conversions
		$flipcards = array();
		$flipcards['metrics'] = "ga:goalCompletionsAll";
		$flipcards['params'] = array('dimensions' => "ga:sourceMedium",'filters' => 'ga:sourceMedium==google / cpc');
		$flip_card_results = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $flipcards);
		$this->data['conversions'] = $flip_card_results['totalsForAllResults'];

		// Keywords
		$topPages = array();
		$topPages['metrics'] = "ga:adClicks, ga:impressions";
		$topPages['params'] = array('dimensions' => "ga:sourceMedium, ga:keyword", 'filters' => 'ga:sourceMedium==google / cpc;ga:keyword!=(not set);ga:keyword!=(content targeting);ga:keyword!=(remarketing/content targeting)', 'sort' => '-ga:adClicks', 'samplingLevel' => 'FASTER');
		$topPagesResults = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $topPages);
		$this->data['keywords'] = $topPagesResults->getRows();

		// Destination URLs
		$topPages = array();
		$topPages['metrics'] = "ga:pageviews, ga:bounceRate";
		$topPages['params'] = array('dimensions' => "ga:sourceMedium, ga:addestinationUrl", 'filters' => 'ga:sourceMedium==google / cpc', 'sort' => '-ga:pageviews', 'samplingLevel' => 'FASTER');
		$topPagesResults = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $topPages);
		$this->data['destinations'] = $topPagesResults->getRows();

		// Best Keywords
		$topPages = array();
		$topPages['metrics'] = "ga:goalCompletionsAll";
		$topPages['params'] = array('dimensions' => "ga:sourceMedium, ga:keyword", 'filters' => 'ga:sourceMedium==google / cpc;ga:keyword!=(not set);ga:keyword!=(content targeting);ga:keyword!=(remarketing/content targeting)', 'sort' => '-ga:goalCompletionsAll', 'samplingLevel' => 'FASTER');
		$topPagesResults = $this->model_account_marketing->getResults($marketing, $analytics_id, $startDate, $endDate, $topPages);
		$this->data['best_keywords'] = $topPagesResults->getRows();

		// Total Sessions
		// $totalSessions = $flip_card_results['totalsForAllResults']['ga:impressions'];
		// $this->data['totalSessions'] = $flip_card_results['totalsForAllResults']['ga:impressions'];

		// Sessions By Browser Pie Chart
		// $browserMetrics = "ga:sessions";
		// $browserParams = array('dimensions' => "ga:browser", 'sort' => "-ga:sessions", 'max-results' => 5);
		// $browserStats_results = $this->model_account_marketing->queryMarketing($analytics_id, $startDate, $endDate, $browserMetrics, $browserParams);
		// $browser_total = 0;
		// foreach ($browserStats_results['rows'] as $row) {
		// 	$browser_total = $browser_total + (int)$row[1];
		// }
		// $this->data['browser_stats'] =  array(
		// 	'browsers' => $browserStats_results['rows'],
		// 	'others' => round((($totalSessions - $browser_total)/ $totalSessions)*100),
		// 	'colors' => ['#00a3d8', '#2fbbe8', '#72cae7', '#d9544f', '#ffc100']
		// 	);

		// // Keywords
		// $topPages = array();
		// $topPages['metrics'] = "ga:sessions, ga:pageviews";
		// $topPagesParams = array('dimensions' => "ga:pageTitle");
		// $topPagesResults = $this->model_account_marketing->queryMarketing($analytics_id, $startDate, $endDate, $topPages['metrics'], $topPagesParams);
		// $this->data['topPages'] = $topPagesResults['rows'];



		// Manual Placements
		$this->data['placements'] = $this->model_account_marketing->getPlacements($adwords_id, $startDate);

		// Automatic Placements
		$this->data['domains'] = $this->model_account_marketing->getDomains($adwords_id, $startDate);




		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/marketing.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/marketing.tpl';
		} else {
			$this->template = 'default/template/account/marketing.tpl';
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
