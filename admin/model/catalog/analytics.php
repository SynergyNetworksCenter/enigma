<?php 
class ModelCatalogAnalytics extends Model {

	public function getTotalAnalytics() {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "analytics";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function deleteAnalytics($id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "analytics` WHERE id = '" . (int)$id . "'");
		$this->db->query("DELETE FROM `" . DB_PREFIX . "analytics_to_site` WHERE analytics_account = '" . (int)$id . "'");
	}

	public function getAnalyticsAccount($id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "analytics` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}

	public function getAnalyticAccounts($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "analytics`";

		$sort_data = array (
			'title',
			'analytics_id',
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

	public function getAnalyticsByTitle($title) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "analytics` WHERE title = '" . $this->db->escape($title) . "'");

		return $query->row;
	}

	public function addAnalytics($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "analytics` 
			SET analytics_id = '" . $this->db->escape($data['analytics_id']) . "', 
			title = '" . $this->db->escape($data['title']) . "', 
			website_id = '" . $this->db->escape($data['website_id']) . "', 
			status = '" . (int)$data['status'] . "', 
			date_added = NOW()");
	}

	public function editAnalytics($id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "analytics` 
			SET analytics_id = '" . $this->db->escape($data['analytics_id']) . "', 
			title = '" . $this->db->escape($data['title']) . "', 
			website_id = '" . $this->db->escape($data['website_id']) . "',  
			status = '" . (int)$data['status'] . "' 
			WHERE id = '" . (int)$id . "'");
	}


}
?>