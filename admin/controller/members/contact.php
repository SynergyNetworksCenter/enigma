<?php 
class ControllerMembersContact extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('members/contact');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addStyle('view/css/vendor/bootstrap-checkbox.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addStyle('view/js/vendor/datatables/css/dataTables.bootstrap.css');
		$this->document->addStyle('view/js/vendor/datatables/css/ColVis.css');
		$this->document->addStyle('view/js/vendor/datatables/css/TableTools.css');
		$this->document->addStyle('view/js/vendor/datepicker/css/bootstrap-datetimepicker.css');

		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/datatables/jquery.dataTables.min.js');
		$this->document->addScript('view/js/vendor/datatables/ColReorderWithResize.js');
		$this->document->addScript('view/js/vendor/datatables/colvis/dataTables.colVis.min.js');
		$this->document->addScript('view/js/vendor/datatables/tabletools/ZeroClipboard.js');
		$this->document->addScript('view/js/vendor/datatables/tabletools/dataTables.tableTools.min.js');
		$this->document->addScript('view/js/vendor/datatables/dataTables.bootstrap.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		$this->data['text_member_all'] = $this->language->get('text_member_all');	
		$this->data['text_member'] = $this->language->get('text_member');	
		$this->data['text_member_group'] = $this->language->get('text_member_group');	

		$this->data['entry_site'] = $this->language->get('entry_site');
		$this->data['entry_to'] = $this->language->get('entry_to');
		$this->data['entry_member_group'] = $this->language->get('entry_member_group');
		$this->data['entry_member'] = $this->language->get('entry_member');

		$this->data['entry_subject'] = $this->language->get('entry_subject');
		$this->data['entry_message'] = $this->language->get('entry_message');

		$this->data['button_send'] = $this->language->get('button_send');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['token'] = $this->session->data['token'];

		//Declares array for Breadcrumbs
		$this->data['breadcrumbs'] = array();

		//Starting Breadcrumb
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'class'     => 'bread-start'
			// 'separator' => false
		);

		//Second Breadcrumb - Parent of current location
		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'class'      => 'parent'
			// 'separator' => ' / '
		);


		$this->data['cancel'] = $this->url->link('members/contact', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('setting/site');

		$this->data['sites'] = $this->model_setting_site->getSites();

		$this->load->model('members/member_group');

		$this->data['member_groups'] = $this->model_members_member_group->getMemberGroups(0);

		$this->template = 'members/contact.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	public function send() {
		$this->language->load('members/contact');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if (!$this->user->hasPermission('modify', 'members/contact')) {
				$json['error']['warning'] = $this->language->get('error_permission');
			}

			if (!$this->request->post['subject']) {
				$json['error']['subject'] = $this->language->get('error_subject');
			}

			if (!$this->request->post['message']) {
				$json['error']['message'] = $this->language->get('error_message');
			}

			if (!$json) {
				$this->load->model('setting/site');

				$site_info = $this->model_setting_site->getSite($this->request->post['site_id']);			

				if ($site_info) {
					$site_name = $site_info['name'];
				} else {
					$site_name = $this->config->get('config_name');
				}

				$this->load->model('members/member');

				$this->load->model('members/member_group');


				if (isset($this->request->get['page'])) {
					$page = $this->request->get['page'];
				} else {
					$page = 1;
				}

				$email_total = 0;

				$emails = array();

				switch ($this->request->post['to']) {
					case 'newsletter':
						$member_data = array(
							'filter_newsletter' => 1,
							'start'             => ($page - 1) * 10,
							'limit'             => 10
						);

						$email_total = $this->model_members_member->getTotalMembers($member_data);

						$results = $this->model_members_member->getMembers($member_data);

						foreach ($results as $result) {
							$emails[] = $result['email'];
						}
						break;
					case 'member_all':
						$member_data = array(
							'start'  => ($page - 1) * 10,
							'limit'  => 10
						);

						$email_total = $this->model_members_member->getTotalMembers($member_data);

						$results = $this->model_members_member->getMembers($member_data);

						foreach ($results as $result) {
							$emails[] = $result['email'];
						}						
						break;
					case 'member_group':
						$member_data = array(
							'filter_member_group_id' => $this->request->post['member_group_id'],
							'start'                    => ($page - 1) * 10,
							'limit'                    => 10
						);

						$email_total = $this->model_members_member->getTotalMembers($member_data);

						$results = $this->model_members_member->getMembers($member_data);

						foreach ($results as $result) {
							$emails[$result['member_id']] = $result['email'];
						}						
						break;
					case 'member':
						if (!empty($this->request->post['member'])) {					
							foreach ($this->request->post['member'] as $member_id) {
								$member_info = $this->model_members_member->getMember($member_id);

								if ($member_info) {
									$emails[] = $member_info['email'];
								}
							}
						}
						break;												
				}

				if ($emails) {
					$start = ($page - 1) * 10;
					$end = $start + 10;

					if ($end < $email_total) {
						$json['success'] = sprintf($this->language->get('text_sent'), $start, $email_total);
					} else { 
						$json['success'] = $this->language->get('text_success');
					}				

					if ($end < $email_total) {
						$json['next'] = str_replace('&amp;', '&', $this->url->link('members/contact/send', 'token=' . $this->session->data['token'] . '&page=' . ($page + 1), 'SSL'));
					} else {
						$json['next'] = '';
					}

					$message  = '<html dir="ltr" lang="en">' . "\n";
					$message .= '  <head>' . "\n";
					$message .= '    <title>' . $this->request->post['subject'] . '</title>' . "\n";
					$message .= '    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">' . "\n";
					$message .= '  </head>' . "\n";
					$message .= '  <body>' . html_entity_decode($this->request->post['message'], ENT_QUOTES, 'UTF-8') . '</body>' . "\n";
					$message .= '</html>' . "\n";

					foreach ($emails as $email) {
						$mail = new Mail();	
						$mail->protocol = $this->config->get('config_mail_protocol');
						$mail->parameter = $this->config->get('config_mail_parameter');
						$mail->hostname = $this->config->get('config_smtp_host');
						$mail->username = $this->config->get('config_smtp_username');
						$mail->password = $this->config->get('config_smtp_password');
						$mail->port = $this->config->get('config_smtp_port');
						$mail->timeout = $this->config->get('config_smtp_timeout');				
						$mail->setTo($email);
						$mail->setFrom($this->config->get('config_email'));
						$mail->setSender($site_name);
						$mail->setSubject(html_entity_decode($this->request->post['subject'], ENT_QUOTES, 'UTF-8'));					
						$mail->setHtml($message);
						$mail->send();
					}
				}
			}
		}

		$this->response->setOutput(json_encode($json));	
	}
}
?>