
-- TASK 1
SELECT 
    c.first_name || ' ' || c.last_name AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_spend
FROM customers c
JOIN orders o 
    ON c.id = o.customer_id
JOIN order_items oi 
    ON o.id = oi.order_id
GROUP BY c.id
ORDER BY total_spend DESC
LIMIT 5;

-- TASK 2
SELECT 
    p.category AS category,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
JOIN order_items oi 
    ON p.id = oi.product_id 
JOIN orders o
    ON oi.order_id = o.id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- TASK 3
SELECT
    e.first_name,
    e.last_name,
    d.name AS department_name,
    e.salary AS employee_salary,
    ROUND(AVG(e2.salary), 2) AS department_avg
FROM employees e
JOIN departments d
    ON e.department_id = d.id
JOIN employees e2
    ON e.department_id = e2.department_id
GROUP BY e.id
HAVING e.salary > AVG(e2.salary)
ORDER BY department_name, employee_salary DESC;