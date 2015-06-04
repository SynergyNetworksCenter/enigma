<?php
// draft version of ModelAccountBing which is copied from ModelCatalogBing
class ModelAccountBing extends Model {

	public function getUploadData($bing_id) {
    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "bing b
    LEFT JOIN " . DB_PREFIX . "upload_data ud ON (b.bing_id = ud.account_id)
		WHERE ud.account_id = '" .(int)$bing_id ."'");

    return $query->row;
  }

	public function getKeywords($bing_id) {
    $query = $this->db->query("SELECT keyword, clicks, impressions FROM " . DB_PREFIX . "upload_data ud
    LEFT JOIN " . DB_PREFIX . "bing b ON (ud.account_id = b.bing_id)
		WHERE ud.account_id = '" . (int)$bing_id . "'");

    return $query->rows;
  }

	public function getTotalClicks($bing_id){
		$query = $this->db->query("SELECT SUM(clicks) as 'clicks' FROM " . DB_PREFIX . "upload_data ud
    LEFT JOIN " . DB_PREFIX . "bing b ON (ud.account_id = b.bing_id)
		WHERE ud.account_id = '" . (int)$bing_id . "'");

		return $query->row['clicks'];
	}

	public function getTotalImpressions($bing_id){
		$query = $this->db->query("SELECT SUM(impressions) as 'impressions' FROM " . DB_PREFIX . "upload_data ud
		LEFT JOIN " . DB_PREFIX . "bing b ON (ud.account_id = b.bing_id)
		WHERE ud.account_id = '" . (int)$bing_id . "'");

		return $query->row['impressions'];
	}


}
?>
