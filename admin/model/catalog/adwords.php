<?php 
class ModelCatalogAdwords extends Model {

	public function getTotalAdwords() {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "adwords";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function deleteAdwords($id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "adwords` WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "adwords_to_site` WHERE adwords_account = '" . (int)$id . "'");
	}

	public function getAdwordsAccount($id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "adwords` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getAdwordAccounts($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "adwords`";

		$sort_data = array (
			'title',
			'adwords_id',
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY title";	
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

	public function getAdwordsByTitle($title) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "adwords` WHERE title = '" . $this->db->escape($title) . "'");

		return $query->row;
	}

	public function addAdwords($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "adwords` 
			SET adwords_id = '" . $this->db->escape($data['adwords_id']) . "', 
			title = '" . $this->db->escape($data['title']) . "', 
			website_id = '" . $this->db->escape($data['website_id']) . "', 
			status = '" . (int)$data['status'] . "', 
			date_added = NOW()");
	}

	public function editAdwords($id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "adwords` 
			SET adwords_id = '" . $this->db->escape($data['adwords_id']) . "', 
			title = '" . $this->db->escape($data['title']) . "',  
			website_id = '" . $this->db->escape($data['website_id']) . "', 
			status = '" . (int)$data['status'] . "' 
			WHERE id = '" . (int)$id . "'");
	}


}
?>