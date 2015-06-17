SELECT month, account_name, clicks, impressions FROM sn_bing b
LEFT JOIN sn_upload_data ud
ON b.bing_id = ud.account_id
WHERE ud.account_id = '3118939';