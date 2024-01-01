SELECT VI.author_id AS id
FROM Views VI
WHERE VI.author_id = VI.viewer_id
GROUP BY VI.author_id 