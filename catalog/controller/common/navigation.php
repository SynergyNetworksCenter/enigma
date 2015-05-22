<?php 
class ControllerCommonNavigation extends Controller {
	protected function index() {

		//$this->language->load('common/navigation');

		$this->data['member_name'] = $this->member->getFirstName() . ' ' . $this->member->getLastName();
		$this->data['portal'] = $this->language->get('portal');
		$this->data['home'] = $this->url->link('account/account');
		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['analytics'] = $this->url->link('account/analytics', '', 'SSL');
		$this->data['marketing'] = $this->url->link('account/marketing', '', 'SSL');
		$this->data['adwords'] = $this->url->link('account/adwords', '', 'SSL');
		$this->data['bing'] = $this->url->link('account/bing', '', 'SSL');
		$this->data['logout'] = $this->url->link('account/logout', '', 'SSL');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/navigation.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/navigation.tpl';
		} else {
			$this->template = 'default/template/common/navigation.tpl';
		}

		$this->render();
	}
}
 ?>