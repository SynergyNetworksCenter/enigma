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
			'href'      => $this->url->link('account/bing', '', 'SSL'),
			'separator' => $this->language->get('text_separator')
		);

		$this->data['heading_title'] = $this->language->get('heading_title');

		$member_info = $this->model_account_member->getMember($this->member->getId());

		$this->data['action'] = $this->url->link('account/bing', '', 'SSL');
		$this->data['marketing'] = $this->url->link('account/marketing', '', 'SSL');

		$this->data['intro'] = sprintf($this->language->get('intro'), $member_info['site_name']);
		$this->data['tagline'] = $this->language->get('tagline');

		$this->data['member_info'] = $member_info;

		if ($member_info['bing_id']) {
			$bing_id = $member_info['bing_id'];
		} else {
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}

		// if (isset($this->request->post['endDate'])) {
		// 	$endDate = date('Y-m-d', strtotime($this->request->post['endDate']));
		// } else {
		// 	$endDate = date('Y-m-d');
		// }
		//
		// if (isset($this->request->post['startDate'])) {
		// 	$startDate = date('Y-m-d', strtotime($this->request->post['startDate']));
		// } else {
		// 	$startDate = date('Y-m-d',strtotime('-1 month',strtotime($endDate)));
		// }

		// Clicks
	  $this->data['clicks'] = $clicks = (int)$this->model_account_bing->getTotalClicks($bing_id);

		// impressions
		$this->data['impressions'] = $impressions = (int)$this->model_account_bing->getTotalImpressions($bing_id);

		// CTR
		 $this->data['ctr'] = ($clicks / $impressions) * 100;


		// Keywords
		$this->data['keywords'] = $this->model_account_bing->getKeywords($bing_id);



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
