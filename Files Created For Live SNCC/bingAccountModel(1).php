<?php
// draft version of ModelAccountBing which is copied from ModelCatalogBing
class ModelAccountBing extends Model {

	// don't know if will need this
	public function getTotalUploadData() {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "upload_data";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}


	/* 	// Similar to getUploadData function which i just created
	public function getBingAccountData($id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "bing` WHERE id = '" . (int)$id . "'");

		return $query->row;
	}	*/

	public function getUploadData($bing_id) {
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "bing b
    LEFT JOIN " . DB_PREFIX . "upload_data ud ON (b.bing_id = ud.account_id)");

    return $query->row;
  }

	public function getKeywords($keyword) {
    $query = $this->db->query("SELECT keyword, clicks, impressions FROM " . DB_PREFIX . "upload_data ud
    LEFT JOIN " . DB_PREFIX . "bing b ON (ud.account_id = b.bing_id)
		WHERE ud.account_id=b.bing_id");

    return $query->row;
  }

	// not sure what to do about this one yet
	public function getBingAccountsData($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "upload_data`";

		$sort_data = array (
			'id',
			'month',
			'account_id',
			'account_name',
			'keyword',
			'clicks',
			'impressions',
			'avg_position',
			'average_cpc',
			'spend',
			'ctr'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY month";
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

	// public function totalClicks ($bing_id) {
	// 	while bb.account_id == b.bing_id {
	// 		$totalClicks = bb.clicks++;
	// 	}
	// 	return $totalClicks;
	// }
	//
	// public function totalImpressions ($bing_id) {
	// 	while bb.account_id == b.bing_id {
	// 		$totalImpressions = bb.impressions++;
	// 	}
	// 	return $totalImpressions;
	// }


	/* // dont know about this one
	public function getUploadDataByAccountId($account_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "bing` WHERE title = '" . $this->db->escape($account_id) . "'");

		return $query->row;
	}
	*/

	/*	// don't need this
	public function addBing($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "bing`
			SET bing_id = '" . $this->db->escape($data['bing_id']) . "',
			title = '" . $this->db->escape($data['title']) . "',
			website_id = '" . $this->db->escape($data['website_id']) . "',
			status = '" . (int)$data['status'] . "',
			date_added = NOW()");
	}
	*/

	/* // dont need this
	public function editBing($id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "bing`
			SET bing_id = '" . $this->db->escape($data['bing_id']) . "',
			title = '" . $this->db->escape($data['title']) . "',
			website_id = '" . $this->db->escape($data['website_id']) . "',
			status = '" . (int)$data['status'] . "'
			WHERE id = '" . (int)$id . "'");
	}
	*/


}
?>
