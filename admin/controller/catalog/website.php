<?php 
class ControllerCatalogWebsite extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('catalog/website');
		$this->load->model('catalog/website');
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
		$this->getList();
	}

	public function insert() {
		$this->language->load('catalog/website');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('view/css/vendor/bootstrap-checkbox.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->load->model('catalog/website');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_website->addWebsite($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();

	}

	public function update() {
		$this->language->load('catalog/website');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('view/css/vendor/bootstrap-checkbox.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->load->model('catalog/website');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_website->editWebsite($this->request->get['website_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');


			$this->redirect($this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function permissions() {
		$this->language->load('catalog/website');
		$this->document->setTitle($this->language->get('heading_title'));
		$this->load->model('catalog/website');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validatePermissionsForm()) {
			$this->model_catalog_website->editWebsitePermissions($this->request->get['website_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getPermissionForm();
	}

	protected function getPermissionForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['page_title'] = $this->language->get('page_title');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->request->get['website_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$website_info = $this->model_catalog_website->getWebsite($this->request->get['website_id']);
		}

		$this->data['form_title'] = $website_info['site_name'] . ' Permissions';

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

		//Third Breadcrumb - Website name
		$this->data['breadcrumbs'][] = array(
			'text'     => $website_info['site_name'],
			'class'    => 'parent'
			// 'separator' => ' / '
		);

		//Forth Breadcrumb - Current Location
		$this->data['breadcrumbs'][] = array(
			'text'     => 'Permissions',
			'class'    => 'active'
			// 'separator' => ' / '
		);

		$this->data['token'] = $this->session->data['token'];

		//Clients
		$this->load->model('members/member');

		if (isset($this->request->post['client'])) {
			$clients = $this->request->post['client'];
		} elseif (isset($this->request->get['website_id'])) {		
			$clients = $this->model_catalog_website->getWebsiteClients($this->request->get['website_id']);
		} else {
			$clients = array();
		}

		$this->data['clients'] = array();

		// $this->data['test'] = $clients;

		foreach ($clients as $client_id) {
			$client_info = $this->model_members_member->getMember($client_id['member_id']);

			if ($client_info) {
				$this->data['clients'][] = array(
					'member_id' => $client_info['member_id'],
					'name'        => $client_info['firstname'] . ' ' . $client_info['lastname']
				);
			}
		}


		$this->data['action'] = $this->url->link('catalog/website/permissions', 'token=' . $this->session->data['token']. '&website_id=' . $this->request->get['website_id'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL');

		$this->template = 'catalog/website_permission_form.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}



	public function delete() {
		$this->language->load('catalog/website');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/website');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $website_id) {
				$this->model_catalog_website->deleteWebsite($website_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');


			$this->redirect($this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	} // End of Delete();

	protected function getList() {

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

		//Third Breadcrumb - Current Location
		$this->data['breadcrumbs'][] = array(
			'text'     => $this->language->get('section_title'),
			'class'    => 'active'
			// 'separator' => ' / '
		);


		//Set Url for Buttons
		$this->data['insert'] = $this->url->link('catalog/website/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('catalog/website/delete', 'token=' . $this->session->data['token'], 'SSL');

		//Declares array to store the page data for view
		$this->data['websites'] = array();

		// Get Total Number of Websites 
		$website_total = $this->model_catalog_website->getTotalWebsites();

		// Get all website data to display
		$results = $this->model_catalog_website->getWebsites();

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/website/update', 'token=' . $this->session->data['token'] . '&website_id=' . $result['website_id'], 'SSL'),
				'class' => 'action-link'
			);

			$action[] = array(
				'text' => $this->language->get('text_permissions'),
				'href' => $this->url->link('catalog/website/permissions', 'token=' . $this->session->data['token'] . '&website_id=' . $result['website_id'], 'SSL'),
				'class' => 'btn-permissions'
			);

			$this->data['websites'][] = array(
				'website_id'   => $result['website_id'],
				'name'         => $result['site_name'],
				'url'          => $result['url'],
				'status'       => ($result['status'] ? $this->language->get('text_active') : $this->language->get('text_disabled')),
				'date_added'   => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'     => isset($this->request->post['selected']) && in_array($result['website_id'], $this->request->post['selected']),
				'action'       => $action
			);
		}

		// Assign Heading Text
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['page_title'] = $this->language->get('page_title');
		$this->data['section_title'] = $this->language->get('section_title');

		// Assign Text 
		$this->data['text_no_results'] = $this->language->get('text_no_results');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_select'] = $this->language->get('text_select');	
		$this->data['text_default'] = $this->language->get('text_default');		

		//Column Names for table
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_url'] = $this->language->get('column_url');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['column_status'] = $this->language->get('column_status');

		//Button Text
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		$this->data['button_filter'] = $this->language->get('button_filter');

		// Authentication Token added to Urls
		$this->data['token'] = $this->session->data['token'];

		// Sets warning messages
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		// Sets success message
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		// Assign Template, Header, Navigation, and Footer for View
		$this->template = 'catalog/website_list.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		// Load View
		$this->response->setOutput($this->render());

	} //end of getList()

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['page_title'] = $this->language->get('page_title');
		$this->data['section_title'] = $this->language->get('section_title');
		$this->data['section_title2'] = $this->language->get('section_title2');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_active'] = $this->language->get('text_active');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_url'] = $this->language->get('entry_url');
		$this->data['entry_status'] = $this->language->get('entry_status');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['sitename'])) {
			$this->data['error_sitename'] = $this->error['sitename'];
		} else {
			$this->data['error_sitename'] = '';
		}

		if (isset($this->error['url'])) {
			$this->data['error_url'] = $this->error['url'];
		} else {
			$this->data['error_url'] = '';
		}

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

		//Third Breadcrumb - Current Location
		$this->data['breadcrumbs'][] = array(
			'text'     => $this->language->get('section_title2'),
			'class'    => 'active'
			// 'separator' => ' / '
		);

		if (!isset($this->request->get['website_id'])) {
			$this->data['action'] = $this->url->link('catalog/website/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/website/update', 'token=' . $this->session->data['token'] . '&website_id=' . $this->request->get['website_id'], 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/website', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['website_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$website_info = $this->model_catalog_website->getWebsite($this->request->get['website_id']);
		}

		if (isset($this->request->post['sitename'])) {
			$this->data['sitename'] = $this->request->post['sitename'];
		} elseif (!empty($website_info)) {
			$this->data['sitename'] = $website_info['site_name'];
		} else {
			$this->data['sitename'] = '';
		}

		if (isset($this->request->post['url'])) {
			$this->data['url'] = $this->request->post['url'];
		} elseif (!empty($website_info)) {
			$this->data['url'] = $website_info['url'];
		} else {
			$this->data['url'] = '';
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($website_info)) {
			$this->data['status'] = $website_info['status'];
		} else {
			$this->data['status'] = 0;
		}

		$this->template = 'catalog/website_form.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/website')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['sitename']) < 3) || (utf8_strlen($this->request->post['sitename']) > 100)) {
			$this->error['sitename'] = $this->language->get('error_sitename');
		}

		$website_info = $this->model_catalog_website->getWebsiteBySitename($this->request->post['sitename']);

		if (!isset($this->request->get['website_id'])) {
			if ($website_info) {
				$this->error['sitename'] = $this->language->get('error_exists');
			}
		} else {
			if ($website_info && ($this->request->get['website_id'] != $website_info['website_id'])) {
				$this->error['sitename'] = $this->language->get('error_exists');
			}
		}

		if(!(utf8_strlen($this->request->post['url']) <= 0)) {

			if ((utf8_strlen($this->request->post['url']) < 11) || (utf8_strlen($this->request->post['url']) > 100)) {
				$this->error['url'] = $this->language->get('error_url');
			}
		} else {
			$this->error['url'] = $this->language->get('error_url_empty');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}

	}

	protected function validatePermissionsForm() {
		if (!$this->user->hasPermission('modify', 'catalog/website')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$website_info = $this->model_catalog_website->getWebsite($this->request->post['website_id']);

		if (!isset($this->request->get['website_id'])) {
			if ($website_info) {
				$this->error['sitename'] = $this->language->get('error_exists');
			}
		} else {
			if ($website_info && ($this->request->get['website_id'] != $website_info['website_id'])) {
				$this->error['sitename'] = $this->language->get('error_exists');
			}
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}

	}


	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/website')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	} // End of Validate Delete()

	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/website');

			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);

			$results = $this->model_catalog_website->getWebsites($data);

			foreach ($results as $result) {
				$json[] = array(
					'website_id' => $result['website_id'], 
					'name'            => strip_tags(html_entity_decode($result['site_name'], ENT_QUOTES, 'UTF-8'))
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
}
?>