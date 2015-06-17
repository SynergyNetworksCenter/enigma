SELECT *
FROM sn_websites w
LEFT JOIN sn_bing b
ON w.website_id = b.website_id;