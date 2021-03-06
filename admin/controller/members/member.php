<?php    
class ControllerMembersMember extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('members/member');

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

		$this->load->model('members/member');

		$this->getList();
	}

	public function insert() {
		$this->language->load('members/member');

		$this->document->setTitle($this->language->get('heading_title'));
		$this->document->addStyle('view/css/vendor/bootstrap-checkbox.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->load->model('members/member');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_members_member->addMember($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('members/member', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('members/member');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('view/css/vendor/bootstrap-checkbox.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->load->model('members/member');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_members_member->editMember($this->request->get['member_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('members/member', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('members/member');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('members/member');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $member_id) {
				$this->model_members_member->deleteMember($member_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('members/member', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	}

	public function approve() {
		$this->language->load('members/member');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('members/member');

		if (!$this->user->hasPermission('modify', 'members/member')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} elseif (isset($this->request->post['selected'])) {
			$approved = 0;

			foreach ($this->request->post['selected'] as $member_id) {
				$member_info = $this->model_members_member->getMember($member_id);

				if ($member_info && !$member_info['approved']) {
					$this->model_members_member->approve($member_id);

					$approved++;
				}
			} 

			$this->session->data['success'] = sprintf($this->language->get('text_approved'), $approved);	

			$this->redirect($this->url->link('members/member', 'token=' . $this->session->data['token'], 'SSL'));			
		}

		$this->getList();
	} 

	protected function getList() {

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'class'     => 'bread-start'
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'class'      => 'parent'
			// 'separator' => ' / '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => 'Client List',
			'class'     => 'active'
		);

		$this->data['approve'] = $this->url->link('members/member/approve', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['insert'] = $this->url->link('members/member/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('members/member/delete', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['members'] = array();

		$member_total = $this->model_members_member->getTotalMembers();

		$results = $this->model_members_member->getMembers();

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('members/member/update', 'token=' . $this->session->data['token'] . '&member_id=' . $result['member_id'], 'SSL'),
				'class' => 'btn-edit'
			);

			$this->data['members'][] = array(
				'member_id'    => $result['member_id'],
				'name'           => $result['name'],
				'email'          => $result['email'],
				'telephone'    => $result['telephone'],
				'member_group' => $result['member_group'],
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'approved'       => ($result['approved'] ? $this->language->get('text_yes') : $this->language->get('text_no')),
				'ip'             => $result['ip'],
				'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'       => isset($this->request->post['selected']) && in_array($result['member_id'], $this->request->post['selected']),
				'action'         => $action
			);
		}	

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['page_title'] = $this->language->get('page_title');
		$this->data['section_title'] = $this->language->get('section_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_active'] = $this->language->get('text_active');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');	
		$this->data['text_select'] = $this->language->get('text_select');	
		$this->data['text_default'] = $this->language->get('text_default');		
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_phone'] = $this->language->get('column_phone');
		$this->data['column_email'] = $this->language->get('column_email');
		$this->data['column_member_group'] = $this->language->get('column_member_group');
		$this->data['column_status'] = $this->language->get('column_status');
		$this->data['column_approved'] = $this->language->get('column_approved');
		$this->data['column_ip'] = $this->language->get('column_ip');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_login'] = $this->language->get('column_login');
		$this->data['column_action'] = $this->language->get('column_action');		

		$this->data['button_approve'] = $this->language->get('button_approve');
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

		$this->load->model('members/member_group');

		$this->data['member_groups'] = $this->model_members_member_group->getMemberGroups();

		$this->load->model('setting/site');

		$this->data['sites'] = $this->model_setting_site->getSites();

		$this->template = 'members/member_list.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['page_title'] = $this->language->get('page_title');
		$this->data['section_title'] = $this->language->get('section_title');
		$this->data['section_title2'] = $this->language->get('section_title2');


		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_active'] = $this->language->get('text_active');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_add_ban_ip'] = $this->language->get('text_add_ban_ip');
		$this->data['text_remove_ban_ip'] = $this->language->get('text_remove_ban_ip');

		$this->data['column_ip'] = $this->language->get('column_ip');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['entry_firstname'] = $this->language->get('entry_firstname');
		$this->data['entry_lastname'] = $this->language->get('entry_lastname');
		$this->data['entry_email'] = $this->language->get('entry_email');
		$this->data['entry_telephone'] = $this->language->get('entry_telephone');
		$this->data['entry_fax'] = $this->language->get('entry_fax');
		$this->data['entry_password'] = $this->language->get('entry_password');
		$this->data['entry_confirm'] = $this->language->get('entry_confirm');
		$this->data['entry_newsletter'] = $this->language->get('entry_newsletter');
		$this->data['entry_member_group'] = $this->language->get('entry_member_group');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_address_1'] = $this->language->get('entry_address_1');
		$this->data['entry_address_2'] = $this->language->get('entry_address_2');
		$this->data['entry_city'] = $this->language->get('entry_city');
		$this->data['entry_zipcode'] = $this->language->get('entry_zipcode');
		$this->data['entry_zone'] = $this->language->get('entry_zone');
		$this->data['entry_country'] = $this->language->get('entry_country');
		$this->data['entry_default'] = $this->language->get('entry_default');
		$this->data['entry_comment'] = $this->language->get('entry_comment');
		$this->data['entry_description'] = $this->language->get('entry_description');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_address'] = $this->language->get('button_add_address');
		$this->data['button_remove'] = $this->language->get('button_remove');

		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_address'] = $this->language->get('tab_address');
		$this->data['tab_ip'] = $this->language->get('tab_ip');

		$this->data['token'] = $this->session->data['token'];

		if (isset($this->request->get['member_id'])) {
			$this->data['member_id'] = $this->request->get['member_id'];
		} else {
			$this->data['member_id'] = 0;
		}

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['firstname'])) {
			$this->data['error_firstname'] = $this->error['firstname'];
		} else {
			$this->data['error_firstname'] = '';
		}

		if (isset($this->error['lastname'])) {
			$this->data['error_lastname'] = $this->error['lastname'];
		} else {
			$this->data['error_lastname'] = '';
		}

		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}

		if (isset($this->error['telephone'])) {
			$this->data['error_telephone'] = $this->error['telephone'];
		} else {
			$this->data['error_telephone'] = '';
		}

		if (isset($this->error['password'])) {
			$this->data['error_password'] = $this->error['password'];
		} else {
			$this->data['error_password'] = '';
		}

		if (isset($this->error['confirm'])) {
			$this->data['error_confirm'] = $this->error['confirm'];
		} else {
			$this->data['error_confirm'] = '';
		}

		if (isset($this->error['address_firstname'])) {
			$this->data['error_address_firstname'] = $this->error['address_firstname'];
		} else {
			$this->data['error_address_firstname'] = '';
		}

		if (isset($this->error['address_lastname'])) {
			$this->data['error_address_lastname'] = $this->error['address_lastname'];
		} else {
			$this->data['error_address_lastname'] = '';
		}

		if (isset($this->error['address_address_1'])) {
			$this->data['error_address_address_1'] = $this->error['address_address_1'];
		} else {
			$this->data['error_address_address_1'] = '';
		}

		if (isset($this->error['address_city'])) {
			$this->data['error_address_city'] = $this->error['address_city'];
		} else {
			$this->data['error_address_city'] = '';
		}

		if (isset($this->error['address_zipcode'])) {
			$this->data['error_address_zipcode'] = $this->error['address_zipcode'];
		} else {
			$this->data['error_address_zipcode'] = '';
		}

		if (isset($this->error['address_country'])) {
			$this->data['error_address_country'] = $this->error['address_country'];
		} else {
			$this->data['error_address_country'] = '';
		}

		if (isset($this->error['address_zone'])) {
			$this->data['error_address_zone'] = $this->error['address_zone'];
		} else {
			$this->data['error_address_zone'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'class'     => 'bread-start'
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'class'      => 'parent'
			// 'separator' => ' / '
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => 'New Client',
			'class'     => 'active'
		);

		if (!isset($this->request->get['member_id'])) {
			$this->data['action'] = $this->url->link('members/member/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('members/member/update', 'token=' . $this->session->data['token'] . '&member_id=' . $this->request->get['member_id'], 'SSL');
		}

		$this->data['cancel'] = $this->url->link('members/member', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['member_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$member_info = $this->model_members_member->getMember($this->request->get['member_id']);
		}

		if (isset($this->request->post['firstname'])) {
			$this->data['firstname'] = $this->request->post['firstname'];
		} elseif (!empty($member_info)) { 
			$this->data['firstname'] = $member_info['firstname'];
		} else {
			$this->data['firstname'] = '';
		}

		if (isset($this->request->post['lastname'])) {
			$this->data['lastname'] = $this->request->post['lastname'];
		} elseif (!empty($member_info)) {
			$this->data['lastname'] = $member_info['lastname'];
		} else {
			$this->data['lastname'] = '';
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} elseif (!empty($member_info)) {
			$this->data['email'] = $member_info['email'];
		} else {
			$this->data['email'] = '';
		}

		if (isset($this->request->post['telephone'])) {
			$this->data['telephone'] = $this->request->post['telephone'];
		} elseif (!empty($member_info)) {
			$this->data['telephone'] = $member_info['telephone'];
		} else {
			$this->data['telephone'] = '';
		}

		if (isset($this->request->post['fax'])) {
			$this->data['fax'] = $this->request->post['fax'];
		} elseif (!empty($member_info)) {
			$this->data['fax'] = $member_info['fax'];
		} else {
			$this->data['fax'] = '';
		}

		if (isset($this->request->post['newsletter'])) {
			$this->data['newsletter'] = $this->request->post['newsletter'];
		} elseif (!empty($member_info)) {
			$this->data['newsletter'] = $member_info['newsletter'];
		} else {
			$this->data['newsletter'] = '';
		}

		$this->load->model('members/member_group');

		$this->data['member_groups'] = $this->model_members_member_group->getMemberGroups();

		if (isset($this->request->post['member_group_id'])) {
			$this->data['member_group_id'] = $this->request->post['member_group_id'];
		} elseif (!empty($member_info)) {
			$this->data['member_group_id'] = $member_info['member_group_id'];
		} else {
			$this->data['member_group_id'] = $this->config->get('config_member_group_id');
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($member_info)) {
			$this->data['status'] = $member_info['status'];
		} else {
			$this->data['status'] = 1;
		}

		if (isset($this->request->post['password'])) {
			$this->data['password'] = $this->request->post['password'];
		} else {
			$this->data['password'] = '';
		}

		if (isset($this->request->post['confirm'])) { 
			$this->data['confirm'] = $this->request->post['confirm'];
		} else {
			$this->data['confirm'] = '';
		}

		$this->load->model('localisation/country');

		$this->data['countries'] = $this->model_localisation_country->getCountries();

		if (isset($this->request->post['address'])) { 
			$this->data['addresses'] = $this->request->post['address'];
		} elseif (isset($this->request->get['member_id'])) {
			$this->data['addresses'] = $this->model_members_member->getAddresses($this->request->get['member_id']);
		} else {
			$this->data['addresses'] = array();
		}

		if (isset($this->request->post['address_id'])) {
			$this->data['address_id'] = $this->request->post['address_id'];
		} elseif (!empty($member_info)) {
			$this->data['address_id'] = $member_info['address_id'];
		} else {
			$this->data['address_id'] = '';
		}

		$this->data['ips'] = array();

		if (!empty($member_info)) {
			$results = $this->model_members_member->getIpsByMemberId($this->request->get['member_id']);

			foreach ($results as $result) {
				$ban_ip_total = $this->model_members_member->getTotalBanIpsByIp($result['ip']);

				$this->data['ips'][] = array(
					'ip'         => $result['ip'],
					'total'      => $this->model_members_member->getTotalMembersByIp($result['ip']),
					'date_added' => date('m/d/y', strtotime($result['date_added'])),
					'filter_ip'  => $this->url->link('members/member', 'token=' . $this->session->data['token'] . '&filter_ip=' . $result['ip'], 'SSL'),
					'ban_ip'     => $ban_ip_total
				);
			}
		}		

		$this->template = 'members/member_form.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'members/member')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->error['firstname'] = $this->language->get('error_firstname');
		}

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		$member_info = $this->model_members_member->getMemberByEmail($this->request->post['email']);

		if (!isset($this->request->get['member_id'])) {
			if ($member_info) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		} else {
			if ($member_info && ($this->request->get['member_id'] != $member_info['member_id'])) {
				$this->error['warning'] = $this->language->get('error_exists');
			}
		}

		if ($this->request->post['password'] || (!isset($this->request->get['member_id']))) {
			if ((utf8_strlen($this->request->post['password']) < 4) || (utf8_strlen($this->request->post['password']) > 20)) {
				$this->error['password'] = $this->language->get('error_password');
			}

			if ($this->request->post['password'] != $this->request->post['confirm']) {
				$this->error['confirm'] = $this->language->get('error_confirm');
			}
		}

		if (isset($this->request->post['address'])) {
			foreach ($this->request->post['address'] as $key => $value) {
				if ((utf8_strlen($value['firstname']) < 1) || (utf8_strlen($value['firstname']) > 32)) {
					$this->error['address_firstname'][$key] = $this->language->get('error_firstname');
				}

				if ((utf8_strlen($value['lastname']) < 1) || (utf8_strlen($value['lastname']) > 32)) {
					$this->error['address_lastname'][$key] = $this->language->get('error_lastname');
				}	

				if ((utf8_strlen($value['address_1']) < 3) || (utf8_strlen($value['address_1']) > 128)) {
					$this->error['address_address_1'][$key] = $this->language->get('error_address_1');
				}

				if ((utf8_strlen($value['city']) < 2) || (utf8_strlen($value['city']) > 128)) {
					$this->error['address_city'][$key] = $this->language->get('error_city');
				} 

				$this->load->model('localisation/country');

				$country_info = $this->model_localisation_country->getCountry($value['country_id']);

				if ($country_info) {
					if ($country_info['zipcode_required'] && (utf8_strlen($value['zipcode']) < 2) || (utf8_strlen($value['zipcode']) > 10)) {
						$this->error['address_zipcode'][$key] = $this->language->get('error_zipcode');
					}

				}

				if ($value['country_id'] == '') {
					$this->error['address_country'][$key] = $this->language->get('error_country');
				}

				if (!isset($value['zone_id']) || $value['zone_id'] == '') {
					$this->error['address_zone'][$key] = $this->language->get('error_zone');
				}	
			}
		}

		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'members/member')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}  
	}

	public function login() {
		$json = array();

		if (isset($this->request->get['member_id'])) {
			$member_id = $this->request->get['member_id'];
		} else {
			$member_id = 0;
		}

		$this->load->model('members/member');

		$member_info = $this->model_members_member->getMember($member_id);

		if ($member_info) {
			$token = md5(mt_rand());

			$this->model_members_member->editToken($member_id, $token);

			if (isset($this->request->get['site_id'])) {
				$site_id = $this->request->get['site_id'];
			} else {
				$site_id = 0;
			}

			$this->load->model('setting/site');

			$site_info = $this->model_setting_site->getSite($site_id);

			if ($site_info) {
				$this->redirect($site_info['url'] . 'index.php?route=account/login&token=' . $token);
			} else { 
				$this->redirect(HTTP_CATALOG . 'index.php?route=account/login&token=' . $token);
			}
		} else {
			$this->language->load('error/not_found');

			$this->document->setTitle($this->language->get('heading_title'));

			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_not_found'] = $this->language->get('text_not_found');

			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => false
			);

			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('error/not_found', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' / '
			);

			$this->template = 'error/not_found.tpl';
			$this->children = array(
				'common/header',
				'common/navigation',
				'common/footer'
			);

			$this->response->setOutput($this->render());
		}
	}

	// public function history() {
	// 	$this->language->load('members/member');

	// 	$this->load->model('members/member');

	// 	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->user->hasPermission('modify', 'members/member')) { 
	// 		$this->model_members_member->addHistory($this->request->get['member_id'], $this->request->post['comment']);

	// 		$this->data['success'] = $this->language->get('text_success');
	// 	} else {
	// 		$this->data['success'] = '';
	// 	}

	// 	if (($this->request->server['REQUEST_METHOD'] == 'POST') && !$this->user->hasPermission('modify', 'members/member')) {
	// 		$this->data['error_warning'] = $this->language->get('error_permission');
	// 	} else {
	// 		$this->data['error_warning'] = '';
	// 	}		

	// 	$this->data['text_no_results'] = $this->language->get('text_no_results');

	// 	$this->data['column_date_added'] = $this->language->get('column_date_added');
	// 	$this->data['column_comment'] = $this->language->get('column_comment');

	// 	if (isset($this->request->get['page'])) {
	// 		$page = $this->request->get['page'];
	// 	} else {
	// 		$page = 1;
	// 	}  

	// 	$this->data['histories'] = array();

	// 	$results = $this->model_members_member->getHistories($this->request->get['member_id'], ($page - 1) * 10, 10);

	// 	foreach ($results as $result) {
	// 		$this->data['histories'][] = array(
	// 			'comment'     => $result['comment'],
	// 			'date_added'  => date($this->language->get('date_format_short'), strtotime($result['date_added']))
	// 		);
	// 	}

	// 	$transaction_total = $this->model_members_member->getTotalHistories($this->request->get['member_id']);

	// 	$pagination = new Pagination();
	// 	$pagination->total = $transaction_total;
	// 	$pagination->page = $page;
	// 	$pagination->limit = 10; 
	// 	$pagination->text = $this->language->get('text_pagination');
	// 	$pagination->url = $this->url->link('members/member/history', 'token=' . $this->session->data['token'] . '&member_id=' . $this->request->get['member_id'] . '&page={page}', 'SSL');

	// 	$this->data['pagination'] = $pagination->render();

	// 	$this->template = 'members/member_history.tpl';		

	// 	$this->response->setOutput($this->render());
	// }

	

	public function addBanIP() {
		$this->language->load('members/member');

		$json = array();

		if (isset($this->request->post['ip'])) { 
			if (!$this->user->hasPermission('modify', 'members/member')) {
				$json['error'] = $this->language->get('error_permission');
			} else {
				$this->load->model('members/member');

				$this->model_members_member->addBanIP($this->request->post['ip']);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function removeBanIP() {
		$this->language->load('members/member');

		$json = array();

		if (isset($this->request->post['ip'])) { 
			if (!$this->user->hasPermission('modify', 'members/member')) {
				$json['error'] = $this->language->get('error_permission');
			} else {
				$this->load->model('members/member');

				$this->model_members_member->removeBanIP($this->request->post['ip']);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('members/member');

			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);

			$results = $this->model_members_member->getMembers($data);

			foreach ($results as $result) {
				$json[] = array(
					'member_id'       => $result['member_id'], 
					'member_group_id' => $result['member_group_id'],
					'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'member_group'    => $result['member_group'],
					'firstname'         => $result['firstname'],
					'lastname'          => $result['lastname'],
					'email'             => $result['email'],
					'telephone'         => $result['telephone'],
					'fax'               => $result['fax'],
					'address'           => $this->model_members_member->getAddresses($result['member_id'])
				);					
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	}		

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'zipcode_required' => $country_info['zipcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}

		$this->response->setOutput(json_encode($json));
	}

	public function address() {
		$json = array();

		if (!empty($this->request->get['address_id'])) {
			$this->load->model('members/member');

			$json = $this->model_members_member->getAddress($this->request->get['address_id']);
		}

		$this->response->setOutput(json_encode($json));		
	}
}
?>