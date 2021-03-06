<?php 
class ModelSettingSetting extends Model {
	public function getSetting($group, $site_id = 0) {
		$data = array(); 
		
		$query = $this->db->query("SELECT * 
			FROM " . DB_PREFIX . "setting 
			WHERE site_id = '" . (int)$site_id . "' 
			AND `group` = '" . $this->db->escape($group) . "'");
		
		foreach ($query->rows as $result) {
			if (!$result['serialized']) {
				$data[$result['key']] = $result['value'];
			} else {
				$data[$result['key']] = unserialize($result['value']);
			}
		}

		return $data;
	}
}
?>