<?php
class ControllerAccountBing extends Controller {
	private $error = array();

	public function index() {
		if (!$this->member->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/bing', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/bing');

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



		$this->load->model('account/bing');
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

		$this->data['heading_title'] = $this->language->get('heading_title');

		$member_info = $this->model_account_member->getMember($this->member->getId());

		$this->data['action'] = $this->url->link('account/marketing', '', 'SSL');

		$this->data['intro'] = sprintf($this->language->get('intro'), $member_info['site_name']);
		$this->data['tagline'] = $this->language->get('tagline');

		$this->data['member_info'] = $member_info;

		if ($member_info['bing_id']) {
			$bing_id = $member_info['bing_id'];
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

		// Clicks
		$flipcards = array();
		$flipcards['metrics'] = "clicks";
		$flip_card_results = $this->model_account_bing->getBingAccountsData($bing_id, $startDate, $endDate, $flipcards['metrics'], $flipcardsParams);
		$this->data['clicks'] = $flip_card_results['totalsForAllResults'];

		// Impresssions
		$flipcards = array();
		$flipcards['metrics'] = "impressions";
		$flip_card_results = $this->model_account_marketing->getBingAccountsData($analytics_id, $startDate, $endDate, $flipcards['metrics'], $flipcardsParams);
		$this->data['impressions'] = $flip_card_results['totalsForAllResults'];

		// CTR
		$flipcards = array();
		$flipcards['metrics'] = "ctr";
		$flip_card_results = $this->model_account_marketing->getBingAccountsData($analytics_id, $startDate, $endDate, $flipcards['metrics'], $flipcardsParams);
		$this->data['ctr'] = $flip_card_results['totalsForAllResults'];

		// Avg. Position
		$flipcards = array();
		$flipcards['metrics'] = "avg_position";
		$flip_card_results = $this->model_account_marketing->getBingAccountsData($analytics_id, $startDate, $endDate, $flipcards['metrics'], $flipcardsParams);
		$this->data['avg_position'] = $flip_card_results['totalsForAllResults'];

		// // Conversions
		// $flipcards = array();
		// $flipcards['metrics'] = "ga:goalCompletionsAll";
		// $flipcardsParams = array('dimensions' => "ga:sourceMedium",'filters' => 'ga:sourceMedium==google / cpc');
		// $flip_card_results = $this->model_account_marketing->queryMarketing($analytics_id, $startDate, $endDate, $flipcards['metrics'], $flipcardsParams);
		// $this->data['conversions'] = $flip_card_results['totalsForAllResults'];

		// Keywords
		$topPages = array();
		$topPages['metrics'] = "clicks, impressions, avg_position";
		$topPagesResults = $this->model_account_marketing->getBingAccountsData($analytics_id, $startDate, $endDate, $topPages['metrics'], $topPagesParams);
		$this->data['keywords'] = $topPagesResults['rows'];

		// Destination URLs
		$topPages = array();
		$topPages['metrics'] = "destination, clicks";
		$topPagesResults = $this->model_account_marketing->getBingAccountsData($analytics_id, $startDate, $endDate, $topPages['metrics'], $topPagesParams);
		$this->data['destinations'] = $topPagesResults['rows'];

		// // Best Keywords
		// $topPages = array();
		// $topPages['metrics'] = "ga:goalCompletionsAll";
		// $topPagesResults = $this->model_account_marketing->getBingAccountsData($analytics_id, $startDate, $endDate, $topPages['metrics'], $topPagesParams);
		// $this->data['best_keywords'] = $topPagesResults['rows'];

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


		// //Sessions And Page View Timeline
		// $timelineStats = array();
		// $timelineEndDate = date('Y-m-d');
		// 	$timelineStartDate = date('Y-m-d',strtotime('-1 year',strtotime($timelineEndDate)));
		// $timelineStats['metrics'] = "ga:sessions, ga:pageviews";
		// $timelineParams = array('dimensions' => 'ga:month', 'sort' => '-ga:month');
		// $timelineStatsResults = $this->model_account_marketing->queryMarketing($analytics_id,  $timelineStartDate, $timelineEndDate, $timelineStats['metrics'], $timelineParams);
		// $this->data['timeline'] = $timelineStatsResults['rows'];



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/bing.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/bing.tpl';
		} else {
			$this->template = 'default/template/account/bing.tpl';
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
