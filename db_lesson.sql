
--q1
CREATE TABLE departments (
    department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

--q2
ALTER TABLE people
ADD COLUMN department_id INT UNSIGNED NULL AFTER email;

--q3
INSERT INTO departments (name) VALUES
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム');

INSERT INTO people (name, email, department_id, age, gender) VALUES
('鈴木たかし', 'suzuki_sales1@example.com', 1, 30, 1),
('田中ゆうこ', 'tanaka_sales2@example.com', 1, 28, 2),
('佐藤けん', 'sato_sales3@example.com', 1, 26, 1),
('高橋さくら', 'takahashi_dev1@example.com', 2, 25, 2),
('中村ひろし', 'nakamura_dev2@example.com', 2, 32, 1),
('山本みどり', 'yamamoto_dev3@example.com', 2, 29, 2),
('井上まこと', 'inoue_dev4@example.com', 2, 35, 1),
('小林なお', 'kobayashi_account@example.com', 3, 33, 2),
('斎藤まい', 'saito_hr@example.com', 4, 27, 2),
('森田しん', 'morita_sys@example.com', 5, 31, 1);

INSERT INTO reports (person_id, content) VALUES
(1, '2025-12-01: 商品整理を行いました'),
(2, '2025-12-01: 会議に参加しました'),
(3, '2025-12-01: 資料作成をしました'),
(4, '2025-12-01: コードレビューをしました'),
(5, '2025-12-01: バグ修正をしました'),
(6, '2025-12-01: テストを実施しました'),
(7, '2025-12-01: 部署ミーティングに参加しました'),
(8, '2025-12-01: 経理処理を行いました'),
(9, '2025-12-01: 面談を行いました'),
(10, '2025-12-01: サーバー点検を行いました');

--q4
UPDATE people
SET department_id = 1
WHERE department_id IS NULL;

--q5
SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

--q6
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

--q7
SELECT name
FROM people
WHERE (gender = 2 AND age BETWEEN 20 AND 29)
  OR (gender = 1 AND age BETWEEN 40 AND 49);

--q8
SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;

--q9
SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2
  AND gender = 2;

--q10
SELECT
    people.name,
    departments.name AS department_name,
    reports.content
FROM people
JOIN departments
    ON people.department_id = departments.department_id
JOIN reports
    ON people.person_id = reports.person_id;

--q11
SELECT people.name
FROM people
LEFT JOIN reports
    ON people.person_id = reports.person_id
WHERE reports.person_id IS NULL;
