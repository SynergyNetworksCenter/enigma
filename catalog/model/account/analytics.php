<?php 
class ModelAccountAnalytics extends Model {

	public function getService() {
		require_once 'google-api-php-client/src/Google/autoload.php';
		$service_account_email = '435077490050-cn4q93nb83ea759pdhkdll7iiga5cots@developer.gserviceaccount.com';
		$key_file_location = 'API Project-a6d818c725ec.p12';

		$client = new Google_Client();
		$client->setApplicationName("Analytics PHP Test");
		$analytics = new Google_Service_Analytics($client);

		$key = file_get_contents($key_file_location);
		$cred = new Google_Auth_AssertionCredentials(
			$service_account_email,
			array(Google_Service_Analytics::ANALYTICS_READONLY),
			$key
		);

		$client->setAssertionCredentials($cred);
		if($client->getAuth()->isAccessTokenExpired()) {
			$client->getAuth()->refreshTokenWithAssertion($cred);
		}

		return $analytics;
	}

	public function getResults(&$analytics, $analytics_id, $startDate, $endDate, $query_data = array()) {
		try {
			$result = $analytics->data_ga->get($analytics_id, $startDate, $endDate, $query_data['metrics'], $query_data['params']);
			return $result;
		} catch(Exception $e) {
			$error = $e->getMessage();
			return $error;
		}
	}

	private function testConnection() {
		set_include_path(get_include_path() . PATH_SEPARATOR . 'google/src');
		require_once 'google/src/Google/Client.php';
		require_once 'google/src/Google/Service/Analytics.php';

		$keyfile = 'API Project-a6d818c725ec.p12';
		$client = new Google_Client();
		$client->setApplicationName('Analytics PHP Test');
		$client->setAssertionCredentials(new Google_Auth_AssertionCredentials('435077490050-cn4q93nb83ea759pdhkdll7iiga5cots@developer.gserviceaccount.com', array('https://www.googleapis.com/auth/analytics.readonly'), file_get_contents($keyfile)));
		$client->setAccessType('offline_access');
				
		return new Google_Service_Analytics($client);
	}


	public function queryAnalytics($analytics_id, $startDate, $endDate, $metrics, $params = array()) {
		// Initialise the Google Client object
		$analytics = $this->testConnection();				
		$analytics_results = array();
		try {
  			$result = $analytics->data_ga->get($analytics_id, $startDate, $endDate, $metrics, $params);
  			$analytics_results = $result;
		} catch (Exception $e) {
   			echo 'There was an error : - ' . $e->getMessage();
		}
				
		return $analytics_results;
	}

	public function queryAnalytics2($analytics_id, $startDate, $endDate, $metrics, $params = array()) {
		// Initialise the Google Client object
		$analytics = $this->testConnection();				
		$analytics_results = array();
		try {
  			$result = $analytics->data_ga->get($analytics_id, $startDate, $endDate, $metrics, $params);
  			$analytics_results = $result['rows'];
		} catch (Exception $e) {
   			echo 'There was an error : - ' . $e->getMessage();
		}
				
		return $analytics_results;
	}
}
 ?>