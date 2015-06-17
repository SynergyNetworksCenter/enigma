<?php
class ModelCatalogProfile extends Model {

	public function getTotalProfiles() {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "websites";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function deleteWebsite($website_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "websites` WHERE website_id = '" . (int)$website_id . "'");

		$this->db->query("DELETE FROM `" . DB_PREFIX . "member_to_website` WHERE website_id = '" . (int)$website_id . "'");

		$has_analytics = $this->db->query("SELECT * FROM sn_analytics WHERE website_id  = (int)$website_id");
		if(count($has_analytics) > 0) {
			$this->db->query("UPDATE sn_analytics SET website_id = ' ' WHERE website_id = '" . (int)$website_id . "'");
		}

		$has_adwords = $this->db->query("SELECT * FROM sn_adwords WHERE website_id  = (int)$website_id");
		if(count($has_adwords) > 0) {
			$this->db->query("UPDATE sn_adwords SET website_id = ' ' WHERE website_id = '" . (int)$website_id . "'");
		}

		$has_bing = $this->db->query("SELECT * FROM sn_bing WHERE website_id  = (int)$website_id");
		if(count($has_bing) > 0) {
			$this->db->query("UPDATE sn_bing SET website_id = ' ' WHERE website_id = '" . (int)$website_id . "'");
		}

	}

	public function getWebsite($website_id) {
		$query = $this->db->query("SELECT *
			FROM `" . DB_PREFIX . "websites`
			WHERE website_id = '" . (int)$website_id . "'");

		return $query->row;
	}

	public function getWebsites($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "websites`";

		// Added for Autocomplete Feature
		if (!empty($data['filter_name'])) {
			$sql .= " WHERE site_name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sort_data = array (
			'site_name',
			'url',
			'status',
			'date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY site_name";
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

	public function getWebsiteBySitename($site_name) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "websites` WHERE site_name = '" . $this->db->escape($site_name) . "'");

		return $query->row;
	}

	public function addWebsite($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "websites`
			SET site_name = '" . $this->db->escape($data['sitename']) . "',
			url = '" . $this->db->escape($data['url']) . "',
			status = '" . (int)$data['status'] . "',
			date_added = NOW()");
	}

	public function editWebsite($website_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "websites`
			SET site_name = '" . $this->db->escape($data['sitename']) . "',
			url = '" . $this->db->escape($data['url']) . "',
			status = '" . (int)$data['status'] . "'
			WHERE website_id = '" . (int)$website_id . "'");
	}

	public function getWebsiteClients($website_id) {
		$query = $this->db->query("SELECT member_id
			FROM sn_member_to_website
			WHERE website_id = '" . (int)$website_id . "'");

		return $query->rows;
	}

	public function editWebsitePermissions($website_id, $data) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "member_to_website
			WHERE website_id = '" . (int)$website_id . "'");

		if (isset($data['client'])) {
			foreach ($data['client'] as $member_id) {
				$this->db->query("INSERT INTO " . DB_PREFIX . "member_to_website
					SET member_id = '" . (int)$member_id . "',
					website_id = '" . (int)$website_id . "'");
			}
		}
	}


}
?>
