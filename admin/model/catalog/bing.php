<?php 
class ModelCatalogBing extends Model {

	public function getTotalBing() {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "bing";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function deleteBing($id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "bing` WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "bing_to_site` WHERE bing_account = '" . (int)$id . "'");
	}

	public function getBingAccount($id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "bing` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getBingAccounts($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "bing`";

		$sort_data = array (
			'title',
			'bing_id',
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

	public function getBingByTitle($title) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "bing` WHERE title = '" . $this->db->escape($title) . "'");

		return $query->row;
	}

	public function addBing($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "bing` 
			SET bing_id = '" . $this->db->escape($data['bing_id']) . "', 
			title = '" . $this->db->escape($data['title']) . "', 
			website_id = '" . $this->db->escape($data['website_id']) . "', 
			status = '" . (int)$data['status'] . "', 
			date_added = NOW()");
	}

	public function editBing($id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "bing` 
			SET bing_id = '" . $this->db->escape($data['bing_id']) . "', 
			title = '" . $this->db->escape($data['title']) . "',  
			website_id = '" . $this->db->escape($data['website_id']) . "', 
			status = '" . (int)$data['status'] . "' 
			WHERE id = '" . (int)$id . "'");
	}


}
?>