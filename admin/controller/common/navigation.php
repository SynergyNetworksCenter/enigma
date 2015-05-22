<?php
class ControllerCommonNavigation extends Controller {
	protected function index() {
		$this->language->load('common/navigation');

		//Top Menu
		$this->data['site_name'] = $this->config->get('config_name');
		$this->data['text_front'] = $this->language->get('text_front');
		$this->data['text_logout'] = $this->language->get('text_logout');
		//Dashboard
		$this->data['text_dashboard'] = $this->language->get('text_dashboard');
		//E-Mail Clients
		$this->data['text_contact'] = $this->language->get('text_contact');
		//Administrators
		$this->data['text_user'] = $this->language->get('text_user');
		$this->data['text_user_group'] = $this->language->get('text_user_group');
		$this->data['text_users'] = $this->language->get('text_users');
		//Clients
		$this->data['text_member'] = $this->language->get('text_member');
		$this->data['text_member_group'] = $this->language->get('text_member_group');
		$this->data['text_member_ban_ip'] = $this->language->get('text_member_ban_ip');
		$this->data['text_report_member_online'] = $this->language->get('text_report_member_online');
		//Extensions
		$this->data['text_extension'] = $this->language->get('text_extension');
		$this->data['text_manager'] = $this->language->get('text_manager');
		//Downloads
		$this->data['text_download'] = $this->language->get('text_download');
		//Layouts
		$this->data['text_banner'] = $this->language->get('text_banner');
		$this->data['text_design'] = $this->language->get('text_design');
		$this->data['text_layout'] = $this->language->get('text_layout');
		//Logs
		$this->data['text_error_log'] = $this->language->get('text_error_log');
		$this->data['text_reports'] = $this->language->get('text_reports');
		$this->data['text_report_post_viewed'] = $this->language->get('text_report_post_viewed');
		//System Menu
		$this->data['text_backup'] = $this->language->get('text_backup');
		$this->data['text_setting'] = $this->language->get('text_setting');
		$this->data['text_system'] = $this->language->get('text_system');
		//Others
		$this->data['text_confirm'] = $this->language->get('text_confirm');

		if (!$this->user->isLogged() || !isset($this->request->get['token']) || !isset($this->session->data['token']) || ($this->request->get['token'] != $this->session->data['token'])) {
			$this->data['logged'] = '';
			$this->data['home'] = $this->url->link('common/login', '', 'SSL');
		} else {
			$this->data['logged'] = sprintf($this->language->get('text_logged'), $this->user->getUserName());
			$this->data['current_user'] = $this->user->getUserName();
			//Top Links
			$this->data['home'] = $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['logout'] = $this->url->link('common/logout', 'token=' . $this->session->data['token'], 'SSL');
			//Administrator Links
			$this->data['user'] = $this->url->link('user/user', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['user_group'] = $this->url->link('user/user_permission', 'token=' . $this->session->data['token'], 'SSL');
			//Clients Links
			$this->data['member'] = $this->url->link('members/member', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['member_group'] = $this->url->link('members/member_group', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['member_ban_ip'] = $this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['report_member_online'] = $this->url->link('report/member_online', 'token=' . $this->session->data['token'], 'SSL');
			// Website Links
			$this->data['website'] = $this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL');
			// Seo & Marketing Links
			$this->data['g_analytics'] = $this->url->link('catalog/analytics', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['g_adwords'] = $this->url->link('catalog/adwords', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['b_marketing'] = $this->url->link('catalog/bing', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['m_upload'] = $this->url->link('catalog/upload', 'token=' . $this->session->data['token'], 'SSL');
			//Email clients Links
			$this->data['contact'] = $this->url->link('members/contact', 'token=' . $this->session->data['token'], 'SSL');
			//Extension Links
			$this->data['manager'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
			//Download Link
			$this->data['download'] = $this->url->link('catalog/download', 'token=' . $this->session->data['token'], 'SSL');
			//Layout Links
			$this->data['layout'] = $this->url->link('design/layout', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['banner'] = $this->url->link('design/banner', 'token=' . $this->session->data['token'], 'SSL');
			//Log Links
			$this->data['error_log'] = $this->url->link('tool/error_log', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['report_post_viewed'] = $this->url->link('report/post_viewed', 'token=' . $this->session->data['token'], 'SSL');
			//System Links
			$this->data['setting'] = $this->url->link('setting/site', 'token=' . $this->session->data['token'], 'SSL');
			$this->data['site'] = HTTP_CATALOG;
			$this->data['backup'] = $this->url->link('tool/backup', 'token=' . $this->session->data['token'], 'SSL');

			//Gets lists of sites
			//$this->data['sites'] = array();
			//$this->load->model('setting/site');
			//$results = $this->model_setting_site->getSites();

			//foreach ($results as $result) {
				//$this->data['sites'][] = array(
				//	'name' => $result['name'],
				//	'href' => $result['url']
				//);
			//}
		}

		$this->data['warning'] = array();

		// Check install directory exists
		if (is_dir(dirname(DIR_APPLICATION) . '/install')) {
			$this->data['error_install'] = $this->language->get('error_install');
			$this->data['warning'][] = $this->language->get('error_install_folder');
		} else {
			$this->data['error_install'] = '';
		}

		// Check image directory is writable
		$file = DIR_IMAGE . 'test';

		$handle = fopen($file, 'a+');

		fwrite($handle, '');

		fclose($handle);

		if (!file_exists($file)) {
			$this->data['error_image'] = sprintf($this->language->get('error_image'), DIR_IMAGE);
			$this->data['warning'][] = sprintf($this->language->get('error_image'), DIR_IMAGE);
		} else {
			$this->data['error_image'] = '';

			unlink($file);
		}

		// Check image cache directory is writable
		$file = DIR_IMAGE . 'cache/test';

		$handle = fopen($file, 'a+');

		fwrite($handle, '');

		fclose($handle);

		if (!file_exists($file)) {
			$this->data['error_image_cache'] = sprintf($this->language->get('error_image_cache'), DIR_IMAGE . 'cache/');
			$this->data['warning'][] = sprintf($this->language->get('error_image_cache'), DIR_IMAGE . 'cache/');
		} else {
			$this->data['error_image_cache'] = '';

			unlink($file);
		}

		// Check cache directory is writable
		$file = DIR_CACHE . 'test';

		$handle = fopen($file, 'a+');

		fwrite($handle, '');

		fclose($handle);

		if (!file_exists($file)) {
			$this->data['error_cache'] = sprintf($this->language->get('error_image_cache'), DIR_CACHE);
			$this->data['warning'][] = sprintf($this->language->get('error_image_cache'), DIR_CACHE);
		} else {
			$this->data['error_cache'] = '';

			unlink($file);
		}

		// Check download directory is writable
		$file = DIR_DOWNLOAD . 'test';

		$handle = fopen($file, 'a+');

		fwrite($handle, '');

		fclose($handle);

		if (!file_exists($file)) {
			$this->data['error_download'] = sprintf($this->language->get('error_download'), DIR_DOWNLOAD);
			$this->data['warning'][] = sprintf($this->language->get('error_download'), DIR_DOWNLOAD);
		} else {
			$this->data['error_download'] = '';

			unlink($file);
		}

		// Check logs directory is writable
		$file = DIR_LOGS . 'test';

		$handle = fopen($file, 'a+');

		fwrite($handle, '');

		fclose($handle);

		if (!file_exists($file)) {
			$this->data['error_logs'] = sprintf($this->language->get('error_logs'), DIR_LOGS);
			$this->data['warning'][] = sprintf($this->language->get('error_logs'), DIR_LOGS);
		} else {
			$this->data['error_logs'] = '';

			unlink($file);
		}

		$this->template = 'common/navigation.tpl';
		$this->render();
	}
}
?>
