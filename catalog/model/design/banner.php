<?php
class ModelDesignBanner extends Model {	
	public function getBanner($banner_id) {
		$query = $this->db->query("SELECT bi.*, bid.*, b.name 
			FROM " . DB_PREFIX . "banner_image bi 
			LEFT JOIN " . DB_PREFIX . "banner_image_description bid ON (bi.banner_image_id  = bid.banner_image_id)
			LEFT JOIN " . DB_PREFIX . "banner b on (bi.banner_id = b.banner_id) 
			WHERE bi.banner_id = '" . (int)$banner_id . "' 
			AND bid.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->rows;
	}

	public function getBannerName($banner_id) {
		$query = $this->db->query("SELECT name FROM " . DB_PREFIX . "banner WHERE banner_id = $banner_id");

		return $query->row['name'];
	}
}
?>