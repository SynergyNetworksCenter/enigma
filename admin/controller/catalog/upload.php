<?php
class ControllerCatalogUpload extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('catalog/upload');
		$this->load->model('catalog/upload');
		$this->load->model('catalog/bing');
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
		$this->language->load('catalog/upload');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addStyle('view/js/vendor/datepicker/css/bootstrap-datetimepicker.css');

		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->load->model('catalog/upload');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_upload->addUpload($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/upload', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();

	}

	public function update() {
		$this->language->load('catalog/upload');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addStyle('view/js/vendor/chosen/css/chosen.min.css');
		$this->document->addStyle('view/js/vendor/chosen/css/chosen-bootstrap.css');
		$this->document->addStyle('view/js/vendor/datepicker/css/bootstrap-datetimepicker.css');

		$this->document->addScript('view/js/vendor/momentjs/moment-with-langs.min.js');
		$this->document->addScript('view/js/vendor/datepicker/bootstrap-datetimepicker.min.js');
		$this->document->addScript('view/js/vendor/chosen/chosen.jquery.min.js');

		$this->load->model('catalog/upload');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_upload->editUpload($this->request->get['id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/upload', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('catalog/upload');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/upload');

		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $id) {
				$this->model_catalog_upload->deleteUpload($id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('catalog/upload', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->getList();
	} // End of Delete();

	protected function getList() {

		//List
		$this->load->model('catalog/upload');

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
		$this->data['insert'] = $this->url->link('catalog/upload/insert', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['delete'] = $this->url->link('catalog/upload/delete', 'token=' . $this->session->data['token'], 'SSL');

		//Declares array to store the page data for view
		$this->data['upload'] = array();

		// Get Total Number of Uploads
		$upload_total = $this->model_catalog_upload->getTotalUploads();

		// Get all website data to display
		$results = $this->model_catalog_upload->getUploadDescriptions();

		foreach ($results as $result) {
			$action = array();

			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/upload/update', 'token=' . $this->session->data['token'] . '&id=' . $result['id'], 'SSL'),
				'class' => 'btn-edit'
			);

//			$website_name = array();
//			$website_name = $this->model_catalog_website->getWebsite($result['website_id']);

			$this->data['upload'][] = array(
				'id' 			=> $result['id'],
				'upload_id' => $result['upload_id'],
				//'website' 	=> $website_name['site_name'],
				'title'         => $result['title'],
				'status'       => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'date_added'   => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'selected'     => isset($this->request->post['selected']) && in_array($result['id'], $this->request->post['selected']),
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
		$this->data['column_upload_id'] = $this->language->get('column_upload_id');
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_title'] = $this->language->get('column_title');
		$this->data['column_note'] = $this->language->get('column_note');
	//	$this->data['column_website'] = $this->language->get('column_website');
		$this->data['column_date_added'] = $this->language->get('column_date_added');
		$this->data['column_action'] = $this->language->get('column_action');
		$this->data['column_status'] = $this->language->get('column_status');

		//Button Text
		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		// $this->data['button_filter'] = $this->language->get('button_filter');

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
		$this->template = 'catalog/upload_list.tpl';
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

		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_note'] = $this->language->get('entry_note');
		$this->data['entry_upload_file'] = $this->language->get('entry_upload_file');
//		$this->data['entry_status'] = $this->language->get('entry_status');
//		$this->data['entry_assign'] = $this->language->get('entry_assign');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_upload'] = $this->language->get('button_upload');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		// if (isset($this->error['sitename'])) {
		// 	$this->data['error_sitename'] = $this->error['sitename'];
		// } else {
		// 	$this->data['error_sitename'] = '';
		// }

		if (isset($this->error['title'])) {
			$this->data['error_title'] = $this->error['title'];
		} else {
			$this->data['error_title'] = '';
		}

		if (isset($this->error['upload_id'])) {
			$this->data['error_upload_file'] = $this->error['upload_file'];
		} else {
			$this->data['error_upload_file'] = '';
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

		if (!isset($this->request->get['id'])) {
			$this->data['action'] = $this->url->link('catalog/upload/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/upload/update', 'token=' . $this->session->data['token'] . '&id=' . $this->request->get['id'], 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/upload', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$upload_info = $this->model_catalog_upload->getUploadAccountsAccount($this->request->get['id']);
		}

		if (isset($this->request->post['title'])) {
			$this->data['title'] = $this->request->post['title'];
		} elseif (!empty($upload_info)) {
			$this->data['title'] = $upload_info['title'];
		} else {
			$this->data['title'] = '';
		}

		//Websites --- need to change to bing [5-21-2015]
		$this->load->model('catalog/website');

		if (isset($this->request->post['website_id'])) {
			$this->data['website_id'] = $this->request->post['website_id'];
		} elseif (!empty($upload_info)) {
			$this->data['website_id'] = $upload_info['website_id'];
		} else {
			$this->data['website_id'] = 0;
		}

		if (isset($this->request->post['website'])) {
			$this->data['website'] = $this->request->post['website'];
		} elseif (!empty($upload_info)) {
			$website_info = $this->model_catalog_website->getWebsite($upload_info['website_id']);

			if ($website_info) {
				$this->data['website'] = $website_info['site_name'];
			} else {
				$this->data['website'] = '';
			}
		} else {
			$this->data['website'] = '';
		}

		if (isset($this->request->post['upload_id'])) {
			$this->data['upload_id'] = $this->request->post['upload_id'];
		} elseif (!empty($upload_info)) {
			$this->data['upload_id'] = $upload_info['upload_id'];
		} else {
			$this->data['upload_id'] = '';
		}

		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($upload_info)) {
			$this->data['status'] = $upload_info['status'];
		} else {
			$this->data['status'] = 0;
		}

		$this->data['token'] = $this->session->data['token'];
		$this->template = 'catalog/upload_form.tpl';
		$this->children = array(
			'common/header',
			'common/navigation',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
		if (!$this->user->hasPermission('modify', 'catalog/upload')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}


		if(!(utf8_strlen($this->request->post['upload_id']) <= 0)) {

			if ((utf8_strlen($this->request->post['upload_id']) < 7) || (utf8_strlen($this->request->post['upload_id']) > 10)) {
				$this->error['upload_id'] = $this->language->get('error_upload_id');
			}
		} else {
			$this->error['upload_id'] = $this->language->get('error_upload_empty');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}

	}


	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/upload')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	} // End of Validate Delete()


}
?>
