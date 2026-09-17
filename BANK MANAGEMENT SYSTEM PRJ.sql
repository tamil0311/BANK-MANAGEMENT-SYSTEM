CREATE TABLE CUSTOMER (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(100) NOT NULL,
    phone VARCHAR2(15) UNIQUE NOT NULL,
    email VARCHAR2(100) UNIQUE,
    city VARCHAR2(50) DEFAULT 'Chennai'
);

CREATE TABLE BRANCH (
    branch_id NUMBER PRIMARY KEY,
    branch_name VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL
);

CREATE TABLE ACCOUNT (
    ACCOUNT_ID NUMBER PRIMARY KEY,
    CUSTOMER_ID NUMBER(5) NOT NULL,
    BRANCH_ID NUMBER NOT NULL,
    ACCOUNT_TYPE VARCHAR2(20) NOT NULL,
    BALANCE NUMBER(12,2) DEFAULT 0,
    OPENING_DATE DATE DEFAULT SYSDATE,

    CONSTRAINT FK_ACCOUNT_BRANCH
        FOREIGN KEY (BRANCH_ID)
        REFERENCES BRANCH(BRANCH_ID),

    CONSTRAINT CHK_ACCOUNT_BALANCE
        CHECK (BALANCE >= 0),

    CONSTRAINT CHK_ACCOUNT_TYPE
        CHECK (ACCOUNT_TYPE IN ('SAVINGS', 'CURRENT'))
);

CREATE TABLE EMPLOYEE (
    employee_id NUMBER PRIMARY KEY,
    employee_name VARCHAR2(100) NOT NULL,
    branch_id NUMBER NOT NULL,
    designation VARCHAR2(50) NOT NULL,
    salary NUMBER(10,2) CHECK (salary > 0),

    CONSTRAINT fk_employee_branch
        FOREIGN KEY (branch_id)
        REFERENCES BRANCH(branch_id)
);

CREATE TABLE BANK_TRANSACTION (
    transaction_id NUMBER PRIMARY KEY,
    account_id NUMBER NOT NULL,
    transaction_type VARCHAR2(20) NOT NULL,
    amount NUMBER(12,2) CHECK (amount > 0),
    transaction_date DATE DEFAULT SYSDATE,

    CONSTRAINT fk_transaction_account
        FOREIGN KEY (account_id)
        REFERENCES ACCOUNT(account_id),

    CONSTRAINT chk_transaction_type
        CHECK (transaction_type IN ('DEPOSIT', 'WITHDRAWAL'))
);

ALTER TABLE CUSTOMER ADD (date_of_birth DATE);
ALTER TABLE CUSTOMER ADD email VARCHAR2(100);
ALTER TABLE CUSTOMER
ADD phone VARCHAR2(15);

DESC CUSTOMER;

INSERT INTO BRANCH VALUES (101, 'Chennai Main Branch', 'Chennai');
INSERT INTO BRANCH VALUES (102, 'Tambaram Branch', 'Chennai');
INSERT INTO BRANCH VALUES (103, 'Coimbatore Branch', 'Coimbatore');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (1, 'Arun Kumar', '9000000001', 'arun@gmail.com', 'Chennai', DATE '1998-05-12');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (2, 'Priya Devi', '9000000002', 'priya@gmail.com', 'Chennai', DATE '1999-08-20');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (3, 'Karthik Raj', '9000000003', 'karthik@gmail.com', 'Coimbatore', DATE '1997-02-15');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (4, 'Divya Sri', '9000000004', 'divya@gmail.com', 'Madurai', DATE '2000-11-10');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (5, 'Suresh Babu', '9000000005', 'suresh@gmail.com', 'Chennai', DATE '1996-03-25');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (6, 'Meena Lakshmi', '9000000006', 'meena@gmail.com', 'Salem', DATE '1998-07-18');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (7, 'Vijay Anand', '9000000007', 'vijay@gmail.com', 'Coimbatore', DATE '1995-12-05');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (8, 'Nandhini Devi', '9000000008', 'nandhini@gmail.com', 'Chennai', DATE '2001-01-30');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (9, 'Ramesh Kumar', '9000000009', 'ramesh@gmail.com', 'Trichy', DATE '1997-09-14');

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city, date_of_birth)
VALUES (10, 'Anitha Raj', '9000000010', 'anitha@gmail.com', 'Chennai', DATE '1999-06-22');

INSERT INTO ACCOUNT VALUES (1001, 1, 101, 'SAVINGS', 25000, DATE '2025-01-10');
INSERT INTO ACCOUNT VALUES (1002, 2, 101, 'CURRENT', 75000, DATE '2025-01-15');
INSERT INTO ACCOUNT VALUES (1003, 3, 103, 'SAVINGS', 45000, DATE '2025-02-05');
INSERT INTO ACCOUNT VALUES (1004, 4, 102, 'SAVINGS', 18000, DATE '2025-02-20');
INSERT INTO ACCOUNT VALUES (1005, 5, 101, 'CURRENT', 120000, DATE '2025-03-01');
INSERT INTO ACCOUNT VALUES (1006, 6, 102, 'SAVINGS', 32000, DATE '2025-03-15');
INSERT INTO ACCOUNT VALUES (1007, 7, 103, 'CURRENT', 95000, DATE '2025-04-01');
INSERT INTO ACCOUNT VALUES (1008, 8, 101, 'SAVINGS', 15000, DATE '2025-04-18');
INSERT INTO ACCOUNT VALUES (1009, 9, 102, 'SAVINGS', 55000, DATE '2025-05-05');
INSERT INTO ACCOUNT VALUES (1010, 10, 101, 'CURRENT', 85000, DATE '2025-05-20');

INSERT INTO EMPLOYEE VALUES (201, 'Ravi Kumar', 101, 'Manager', 65000);
INSERT INTO EMPLOYEE VALUES (202, 'Lakshmi Devi', 101, 'Cashier', 32000);
INSERT INTO EMPLOYEE VALUES (203, 'Sathish Raj', 101, 'Clerk', 28000);
INSERT INTO EMPLOYEE VALUES (204, 'Mohan Das', 102, 'Manager', 62000);
INSERT INTO EMPLOYEE VALUES (205, 'Geetha Sri', 102, 'Cashier', 31000);
INSERT INTO EMPLOYEE VALUES (206, 'Prakash Anand', 103, 'Manager', 60000);
INSERT INTO EMPLOYEE VALUES (207, 'Kavitha Devi', 103, 'Clerk', 29000);
INSERT INTO EMPLOYEE VALUES (208, 'Hari Babu', 102, 'Clerk', 27000);

INSERT INTO BANK_TRANSACTION VALUES (3001, 1001, 'DEPOSIT', 10000, DATE '2025-06-01');
INSERT INTO BANK_TRANSACTION VALUES (3002, 1001, 'WITHDRAWAL', 3000, DATE '2025-06-05');
INSERT INTO BANK_TRANSACTION VALUES (3003, 1002, 'DEPOSIT', 20000, DATE '2025-06-02');
INSERT INTO BANK_TRANSACTION VALUES (3004, 1002, 'WITHDRAWAL', 5000, DATE '2025-06-07');
INSERT INTO BANK_TRANSACTION VALUES (3005, 1003, 'DEPOSIT', 15000, DATE '2025-06-03');
INSERT INTO BANK_TRANSACTION VALUES (3006, 1003, 'WITHDRAWAL', 4000, DATE '2025-06-08');
INSERT INTO BANK_TRANSACTION VALUES (3007, 1004, 'DEPOSIT', 8000, DATE '2025-06-04');
INSERT INTO BANK_TRANSACTION VALUES (3008, 1004, 'WITHDRAWAL', 2000, DATE '2025-06-09');
INSERT INTO BANK_TRANSACTION VALUES (3009, 1005, 'DEPOSIT', 30000, DATE '2025-06-05');
INSERT INTO BANK_TRANSACTION VALUES (3010, 1005, 'WITHDRAWAL', 10000, DATE '2025-06-10');
INSERT INTO BANK_TRANSACTION VALUES (3011, 1006, 'DEPOSIT', 12000, DATE '2025-06-06');
INSERT INTO BANK_TRANSACTION VALUES (3012, 1006, 'WITHDRAWAL', 3000, DATE '2025-06-11');
INSERT INTO BANK_TRANSACTION VALUES (3013, 1007, 'DEPOSIT', 25000, DATE '2025-06-07');
INSERT INTO BANK_TRANSACTION VALUES (3014, 1007, 'WITHDRAWAL', 7000, DATE '2025-06-12');
INSERT INTO BANK_TRANSACTION VALUES (3015, 1008, 'DEPOSIT', 5000, DATE '2025-06-08');
INSERT INTO BANK_TRANSACTION VALUES (3016, 1008, 'WITHDRAWAL', 1000, DATE '2025-06-13');
INSERT INTO BANK_TRANSACTION VALUES (3017, 1009, 'DEPOSIT', 18000, DATE '2025-06-09');
INSERT INTO BANK_TRANSACTION VALUES (3018, 1009, 'WITHDRAWAL', 5000, DATE '2025-06-14');
INSERT INTO BANK_TRANSACTION VALUES (3019, 1010, 'DEPOSIT', 22000, DATE '2025-06-10');
INSERT INTO BANK_TRANSACTION VALUES (3020, 1010, 'WITHDRAWAL', 6000, DATE '2025-06-15');
INSERT INTO BANK_TRANSACTION VALUES (3021, 1001, 'DEPOSIT', 4000, DATE '2025-06-16');
INSERT INTO BANK_TRANSACTION VALUES (3022, 1003, 'DEPOSIT', 7000, DATE '2025-06-17');
INSERT INTO BANK_TRANSACTION VALUES (3023, 1005, 'WITHDRAWAL', 8000, DATE '2025-06-18');
INSERT INTO BANK_TRANSACTION VALUES (3024, 1007, 'DEPOSIT', 9000, DATE '2025-06-19');
INSERT INTO BANK_TRANSACTION VALUES (3025, 1009, 'DEPOSIT', 6000, DATE '2025-06-20');

COMMIT;

UPDATE CUSTOMER
SET city = 'Chennai'
WHERE customer_id = 4;

SAVEPOINT before_test_update;

UPDATE ACCOUNT
SET balance = balance + 1000
WHERE account_id = 1001;

ROLLBACK TO before_test_update;

INSERT INTO CUSTOMER (customer_id, customer_name, phone, email, city)
VALUES (99, 'Temporary Customer', '9000000099', 'temporary@gmail.com', 'Chennai');

DELETE FROM CUSTOMER
WHERE customer_id = 99;

COMMIT;

SELECT * FROM CUSTOMER;

SELECT customer_id, customer_name, city
FROM CUSTOMER;

SELECT *
FROM CUSTOMER
WHERE city = 'Chennai';

SELECT *
FROM ACCOUNT
WHERE balance > 50000;

SELECT *
FROM ACCOUNT
WHERE balance BETWEEN 20000 AND 80000;

SELECT *
FROM ACCOUNT
WHERE account_type = 'SAVINGS';

-- 7. Filter transactions by transaction type
SELECT *
FROM BANK_TRANSACTION
WHERE transaction_type = 'DEPOSIT';

-- 8. AND
SELECT *
FROM ACCOUNT
WHERE account_type = 'SAVINGS'
AND balance > 30000;

-- OR
SELECT *
FROM CUSTOMER
WHERE city = 'Chennai'
OR city = 'Coimbatore';

-- NOT
SELECT *
FROM ACCOUNT
WHERE NOT account_type = 'CURRENT';

-- 9. Comparison operators
SELECT * FROM ACCOUNT WHERE balance = 25000;
SELECT * FROM ACCOUNT WHERE balance <> 25000;
SELECT * FROM ACCOUNT WHERE balance > 50000;
SELECT * FROM ACCOUNT WHERE balance < 50000;
SELECT * FROM ACCOUNT WHERE balance >= 50000;
SELECT * FROM ACCOUNT WHERE balance <= 50000;

-- 10. IN
SELECT *
FROM CUSTOMER
WHERE city IN ('Chennai', 'Coimbatore');

-- BETWEEN
SELECT *
FROM ACCOUNT
WHERE balance BETWEEN 30000 AND 90000;

-- LIKE
SELECT *
FROM CUSTOMER
WHERE customer_name LIKE 'A%';

-- 11. ORDER BY ascending
SELECT *
FROM ACCOUNT
ORDER BY balance ASC;

-- ORDER BY descending
SELECT *
FROM ACCOUNT
ORDER BY balance DESC;

-- UPPER
SELECT customer_name, UPPER(customer_name) AS upper_name
FROM CUSTOMER;

-- LOWER
SELECT customer_name, LOWER(customer_name) AS lower_name
FROM CUSTOMER;

-- LENGTH
SELECT customer_name, LENGTH(customer_name) AS name_length
FROM CUSTOMER;

-- SUBSTR
SELECT customer_name, SUBSTR(customer_name, 1, 5) AS short_name
FROM CUSTOMER;

-- ROUND
SELECT account_id, balance, ROUND(balance / 3, 2) AS rounded_value
FROM ACCOUNT;

-- MOD
SELECT account_id, balance, MOD(balance, 2) AS remainder
FROM ACCOUNT;

-- Date arithmetic
SELECT account_id, opening_date, opening_date + 30 AS after_30_days
FROM ACCOUNT;

-- Date function
SELECT SYSDATE AS current_date
FROM DUAL;

-- TO_CHAR
SELECT account_id,
       TO_CHAR(opening_date, 'DD-MON-YYYY') AS formatted_date
FROM ACCOUNT;

-- NVL
SELECT customer_id,
       customer_name,
       NVL(email, 'Email Not Available') AS email
FROM CUSTOMER;

-- CASE
SELECT account_id,
       balance,
       CASE
           WHEN balance >= 100000 THEN 'HIGH BALANCE'
           WHEN balance >= 50000 THEN 'MEDIUM BALANCE'
           ELSE 'LOW BALANCE'
       END AS balance_category
FROM ACCOUNT;

-- PART 5: AGGREGATE FUNCTIONS, GROUP BY & HAVING
-- ============================================================

-- 1. Total customers and total accounts
SELECT
    (SELECT COUNT(*) FROM CUSTOMER) AS total_customers,
    (SELECT COUNT(*) FROM ACCOUNT) AS total_accounts
FROM DUAL;

-- 2. Total, average, highest and lowest account balance
SELECT
    SUM(balance) AS total_balance,
    AVG(balance) AS average_balance,
    MAX(balance) AS highest_balance,
    MIN(balance) AS lowest_balance
FROM ACCOUNT;

-- 3. Number of customers in each city
SELECT city, COUNT(*) AS customer_count
FROM CUSTOMER
GROUP BY city;

-- 4. Number of accounts for each account type
SELECT account_type, COUNT(*) AS account_count
FROM ACCOUNT
GROUP BY account_type;

-- 5. Total balance for each account type
SELECT account_type, SUM(balance) AS total_balance
FROM ACCOUNT
GROUP BY account_type;

-- 6. Average employee salary for each branch
SELECT branch_id, AVG(salary) AS average_salary
FROM EMPLOYEE
GROUP BY branch_id;

-- 7. HAVING
SELECT branch_id, AVG(salary) AS average_salary
FROM EMPLOYEE
GROUP BY branch_id
HAVING AVG(salary) > 40000;

-- PART 6: JOINS
-- ============================================================

-- 1. Customer name with account number and balance
SELECT
    c.customer_name,
    a.account_id,
    a.balance
FROM CUSTOMER c
INNER JOIN ACCOUNT a
    ON c.customer_id = a.customer_id;

-- 2. Customer name, account type and branch name
SELECT
    c.customer_name,
    a.account_type,
    b.branch_name
FROM CUSTOMER c
INNER JOIN ACCOUNT a
    ON c.customer_id = a.customer_id
INNER JOIN BRANCH b
    ON a.branch_id = b.branch_id;

-- 3. Employee name, designation and branch name
SELECT
    e.employee_name,
    e.designation,
    b.branch_name
FROM EMPLOYEE e
INNER JOIN BRANCH b
    ON e.branch_id = b.branch_id;

-- 4. Transaction details with related account
SELECT
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    a.account_id,
    a.balance
FROM BANK_TRANSACTION t
INNER JOIN ACCOUNT a
    ON t.account_id = a.account_id;

-- 5. All customers including those without an account
SELECT
    c.customer_id,
    c.customer_name,
    a.account_id,
    a.balance
FROM CUSTOMER c
LEFT OUTER JOIN ACCOUNT a
    ON c.customer_id = a.customer_id;

-- 6. Branches and employees using OUTER JOIN
SELECT
    b.branch_name,
    e.employee_name,
    e.designation
FROM BRANCH b
LEFT OUTER JOIN EMPLOYEE e
    ON b.branch_id = e.branch_id;
-- PART 7: WINDOW FUNCTIONS
-- ============================================================

-- 1. Rank accounts by balance
SELECT
    account_id,
    balance,
    RANK() OVER (ORDER BY balance DESC) AS balance_rank
FROM ACCOUNT;

-- 2. Row numbers for accounts
SELECT
    account_id,
    balance,
    ROW_NUMBER() OVER (ORDER BY balance DESC) AS row_num
FROM ACCOUNT;

-- 3. Rank employees by salary within each branch
SELECT
    employee_id,
    employee_name,
    branch_id,
    salary,
    RANK() OVER (
        PARTITION BY branch_id
        ORDER BY salary DESC
    ) AS salary_rank
FROM EMPLOYEE;

-- 4. Running total of transaction amounts
SELECT
    transaction_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        ORDER BY transaction_date, transaction_id
    ) AS running_total
FROM BANK_TRANSACTION;

-- 5. LAG to compare with previous transaction
SELECT
    transaction_id,
    account_id,
    amount,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date, transaction_id
    ) AS previous_amount
FROM BANK_TRANSACTION;

-- ============================================================
-- PART 8: CTE (WITH CLAUSE)
-- ============================================================

-- 1. Total balance by account type
WITH account_summary AS (
    SELECT account_type, SUM(balance) AS total_balance
    FROM ACCOUNT
    GROUP BY account_type
)
SELECT *
FROM account_summary;

-- 2. Total transaction amount for each account
WITH transaction_summary AS (
    SELECT account_id, SUM(amount) AS total_transaction_amount
    FROM BANK_TRANSACTION
    GROUP BY account_id
)
SELECT
    a.account_id,
    a.account_type,
    a.balance,
    t.total_transaction_amount
FROM ACCOUNT a
JOIN transaction_summary t
    ON a.account_id = t.account_id;

-- 3. Average salary by branch
WITH salary_summary AS (
    SELECT branch_id, AVG(salary) AS average_salary
    FROM EMPLOYEE
    GROUP BY branch_id
)
SELECT
    b.branch_name,
    s.average_salary
FROM BRANCH b
JOIN salary_summary s
    ON b.branch_id = s.branch_id;

-- 4. CTE-based customer, account and transaction report
WITH transaction_summary AS (
    SELECT
        account_id,
        COUNT(*) AS transaction_count,
        SUM(amount) AS total_transaction_amount
    FROM BANK_TRANSACTION
    GROUP BY account_id
)
SELECT
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance,
    NVL(t.transaction_count, 0) AS transaction_count,
    NVL(t.total_transaction_amount, 0) AS total_transaction_amount
FROM CUSTOMER c
JOIN ACCOUNT a
    ON c.customer_id = a.customer_id
LEFT JOIN transaction_summary t
    ON a.account_id = t.account_id
ORDER BY c.customer_name;


COMMIT;


