<?php
class ModelCatalogUpload extends Model {
	public function addUpload($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "upload
			SET entry_upload_file = '" . $this->db->escape($data['entry_upload_file']) . "',
			mask = '" . $this->db->escape($data['mask']) . "',
			remaining = '" . (int)$data['remaining'] . "',
			date_added = NOW()");

		$upload_id = $this->db->getLastId();

		foreach ($data['upload_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "upload_description
				SET upload_id = '" . (int)$upload_id . "',
				language_id = '" . (int)$language_id . "',
				name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function editUpload($upload_id, $data) {
		// if (!empty($data['update'])) {
		// 	$upload_info = $this->getUpload($upload_id);

		// 	if ($upload_info) {
		// 		$this->db->query("UPDATE " . DB_PREFIX . "order_upload
		// 			SET `entry_upload_id` = '" . $this->db->escape($data['entry_upload_id']) . "',
		// 			mask = '" . $this->db->escape($data['mask']) . "',
		// 			remaining = '" . (int)$data['remaining'] . "'
		// 			WHERE `entry_upload_id` = '" . $this->db->escape($upload_info['entry_upload_id']) . "'");
		// 	}
		// }

		$this->db->query("UPDATE " . DB_PREFIX . "upload
			SET entry_upload_id = '" . $this->db->escape($data['entry_upload_id']) . "',
			mask = '" . $this->db->escape($data['mask']) . "',
			remaining = '" . (int)$data['remaining'] . "'
			WHERE upload_id = '" . (int)$upload_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "upload_description WHERE upload_id = '" . (int)$upload_id . "'");

		foreach ($data['upload_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "upload_description
				SET upload_id = '" . (int)$upload_id . "',
				language_id = '" . (int)$language_id . "',
				name = '" . $this->db->escape($value['name']) . "'");
		}
	}

	public function deleteUpload($upload_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "upload WHERE upload_id = '" . (int)$upload_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "upload_description WHERE upload_id = '" . (int)$upload_id . "'");
	}

	public function getUpload($upload_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "upload d
			LEFT JOIN " . DB_PREFIX . "upload_description dd ON (d.upload_id = dd.upload_id)
			WHERE d.upload_id = '" . (int)$upload_id . "'
			AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getUploads($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "upload d
		LEFT JOIN " . DB_PREFIX . "upload_description dd ON (d.upload_id = dd.upload_id)
		WHERE dd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND dd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array(
			'dd.name',
			'd.remaining'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY dd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getUploadDescriptions($upload_id) {
		$upload_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "upload_description
			WHERE upload_id = '" . (int)$upload_id . "'");

		foreach ($query->rows as $result) {
			$upload_description_data[$result['language_id']] = array('name' => $result['name']);
		}

		return $upload_description_data;
	}

	public function getTotalUploads() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "upload");

		return $query->row['total'];
	}
}
?>
