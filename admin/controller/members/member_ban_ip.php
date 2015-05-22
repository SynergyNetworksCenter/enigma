<?php    
class ControllerMembersMemberBanIp extends Controller { 
	private $error = array();

	public function index() {
		$this->language->load('members/member_ban_ip');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('members/member_ban_ip');

		$this->getList();
	}

	public function insert() {
		$this->language->load('members/member_ban_ip');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('members/member_ban_ip');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_members_member_ban_ip->addMemberBanIp($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('members/member_ban_ip');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('members/member_ban_ip');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_members_member_ban_ip->editMemberBanIp($this->request->get['member_ban_ip_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('members/member_ban_ip');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('members/member_ban_ip');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $member_ban_ip_id) {
				$this->model_members_member_ban_ip->deleteMemberBanIp($member_ban_ip_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->redirect($this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'ip'; 
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' / '
		);

		$this->data['insert'] = $this->url->link('members/member_ban_ip/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('members/member_ban_ip/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['member_ban_ips'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);

		$member_ban_ip_total = $this->model_members_member_ban_ip->getTotalMemberBanIps($data);

		$results = $this->model_members_member_ban_ip->getMemberBanIps($data);

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('members/member_ban_ip/update', 'token=' . $this->session->data['token'] . '&member_ban_ip_id=' . $result['member_ban_ip_id'] . $url, 'SSL')
			);

			$this->data['member_ban_ips'][] = array(
				'member_ban_ip_id' => $result['member_ban_ip_id'],
				'ip'                 => $result['ip'],
				'total'              => $result['total'],
				'member'           => $this->url->link('members/member', 'token=' . $this->session->data['token'] . '&filter_ip=' . $result['ip'], 'SSL'),
				'selected'           => isset($this->request->post['selected']) && in_array($result['member_ban_ip_id'], $this->request->post['selected']),
				'action'             => $action
			);
		}	

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_ip'] = $this->language->get('column_ip');
		$this->data['column_member'] = $this->language->get('column_member');
		$this->data['column_action'] = $this->language->get('column_action');		

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');

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

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['sort_ip'] = $this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . '&sort=ip' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $member_ban_ip_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;

		$this->template = 'members/member_ban_ip_list.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['entry_ip'] = $this->language->get('entry_ip');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['ip'])) {
			$this->data['error_ip'] = $this->error['ip'];
		} else {
			$this->data['error_ip'] = '';
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url, 'SSL'),
			'separator' => ' / '
		);

		if (!isset($this->request->get['member_ban_ip_id'])) {
			$this->data['action'] = $this->url->link('members/member_ban_ip/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('members/member_ban_ip/update', 'token=' . $this->session->data['token'] . '&member_ban_ip_id=' . $this->request->get['member_ban_ip_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('members/member_ban_ip', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['member_ban_ip_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$member_ban_ip_info = $this->model_members_member_ban_ip->getMemberBanIp($this->request->get['member_ban_ip_id']);
		}

		if (isset($this->request->post['ip'])) {
			$this->data['ip'] = $this->request->post['ip'];
		} elseif (!empty($member_ban_ip_info)) { 
			$this->data['ip'] = $member_ban_ip_info['ip'];
		} else {
			$this->data['ip'] = '';
		}

		$this->template = 'members/member_ban_ip_form.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'members/member_ban_ip')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['ip']) < 1) || (utf8_strlen($this->request->post['ip']) > 40)) {
			$this->error['ip'] = $this->language->get('error_ip');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}

	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'members/member_ban_ip')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}  
	}
}
?>