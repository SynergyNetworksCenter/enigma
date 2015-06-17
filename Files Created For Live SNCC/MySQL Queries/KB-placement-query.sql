SELECT month, account_name, placement, clicks, impressions FROM sn_adwords a
LEFT JOIN sn_upload_test_manual utm
ON a.adwords_id = utm.customer_id
WHERE utm.customer_id = '788-200-4140';