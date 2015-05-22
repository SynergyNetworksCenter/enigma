<?php
class ControllerInformationTestimonial extends Controller {
	private $error = array();

	public function index() {
		$this->language->load('information/testimonial');
		// $this->document->setTitle($this->language->get('heading_title'));
		$this->document->setTitle('Testimonials');
		$this->document->setDescription("Leave a testimonial and see what our customers has to say about our services.");
		$this->document->setKeywords("");

		$this->load->model('catalog/review');

		$this->data['heading_title'] = 'Testimonials';
		$this->data['text_wait'] = $this->language->get('text_wait');
		$this->data['text_note'] = $this->language->get('text_note');
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_review'] = $this->language->get('entry_review');
		$this->data['entry_rating'] = $this->language->get('entry_rating');
		$this->data['entry_good'] = $this->language->get('entry_good');
		$this->data['entry_bad'] = $this->language->get('entry_bad');
		// $this->data['action'] = $this->url->link('information/testimonial');

		$this->data['reviews'] = array();

		$results = $this->model_catalog_review->getReviews();

		foreach ($results as $result) {
			$this->data['reviews'][] = array(
				'author'     => $result['author'],
				'text'       => $result['text'],
				'rating'     => (int)$result['rating'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added']))
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/testimonial.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/testimonial.tpl';
		} else {
			$this->template = 'default/template/information/testimonial.tpl';
		}

		$this->children = array(
				'common/column_left',
				'common/column_right',
				'common/content_top',
				'common/content_bottom',
				'common/footer',
				'common/header'
			);

		$this->response->setOutput($this->render());
	}

	public function write() {
		$this->language->load('information/testimonial');

		$this->load->model('catalog/review');

		$json = array();

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 25)) {
				$json['error'] = $this->language->get('error_name');
			}

			if ((utf8_strlen($this->request->post['text']) < 25) || (utf8_strlen($this->request->post['text']) > 1000)) {
				$json['error'] = $this->language->get('error_text');
			}

			if (empty($this->request->post['rating'])) {
				$json['error'] = $this->language->get('error_rating');
			}

			if (!isset($json['error'])) {
				$this->model_catalog_review->addTestimonial($this->request->post);

				$json['success'] = $this->language->get('text_success');
			}
		}

		$this->response->setOutput(json_encode($json));
	}
}
?>