/* Snippets for W3Schools SQL Database Demo */

/* Join account id & bing id */
SELECT Uploads.account_id, Bing.bing_id
FROM Uploads
INNER JOIN Bing
ON Uploads.account_id=Bing.bing_id
ORDER BY Uploads.account_id;
