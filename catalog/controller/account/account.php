<?php
class ControllerAccountAccount extends Controller {
	public function index() {

		if (!$this->member->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/account', '', 'SSL');

			$this->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->language->load('account/account');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('catalog/view/theme/default/css/clientStyles.css');
		$this->document->addStyle('catalog/view/theme/default/css/minimal-update.css');

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

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['welcome'] = sprintf($this->language->get('welcome'), $this->member->getFirstName(), $this->member->getLastName(), '!');

		$this->data['text_my_account'] = $this->language->get('text_my_account');
		$this->data['text_my_newsletter'] = $this->language->get('text_my_newsletter');
		$this->data['text_edit'] = $this->language->get('text_edit');
		$this->data['text_password'] = $this->language->get('text_password');
		$this->data['text_address'] = $this->language->get('text_address');
		$this->data['text_download'] = $this->language->get('text_download');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');

		$this->data['edit'] = $this->url->link('account/edit', '', 'SSL');
		$this->data['password'] = $this->url->link('account/password', '', 'SSL');
		$this->data['address'] = $this->url->link('account/address', '', 'SSL');
		$this->data['download'] = $this->url->link('account/download', '', 'SSL');
		$this->data['analytics'] = $this->url->link('account/analytics', '', 'SSL');
		$this->data['marketing'] = $this->url->link('account/marketing', '', 'SSL');
		$this->data['bing'] = $this->url->link('account/bing', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/account.tpl';
		} else {
			$this->template = 'default/template/account/account.tpl';
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
