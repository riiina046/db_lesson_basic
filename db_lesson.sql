-- 課題：SQL文の説明

SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

-- 説明：
-- このSQLは、people テーブルの中から、
-- department_id カラムが 1 のレコードだけを検索し、
-- そのレコードの name・email・age の3つのカラムを取得し、
-- created_at カラムの値を基準に並べ替えて表示する処理です。
