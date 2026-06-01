use new_schema;
SELECT 
    d.doctor_id,
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    COUNT(*) AS total_appointments
FROM
    appointments a
        JOIN
    doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.doctor_id , doctor_name
ORDER BY total_appointments DESC;

SELECT 
    d.specialization, COUNT(*) AS total_appointments
FROM
    appointments a
        JOIN
    doctors d ON a.doctor_id = d.doctor_id
GROUP BY d.specialization
ORDER BY total_appointments DESC;

SELECT 
    status, COUNT(*) AS total_appointments
FROM
    appointments
GROUP BY status
ORDER BY total_appointments DESC;

SELECT 
    treatment_type, SUM(cost) AS total_revenue
FROM
    treatments
GROUP BY treatment_type
ORDER BY total_revenue DESC;

SELECT 
    YEAR(bill_date) AS year,
    MONTH(bill_date) AS month,
    SUM(amount) AS revenue
FROM
    billing
GROUP BY YEAR(bill_date) , MONTH(bill_date)
ORDER BY year , month;

SELECT 
    CONCAT(d.first_name, ' ', d.last_name) AS doctor_name,
    SUM(t.cost) AS revenue
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_id = a.doctor_id
        JOIN
    treatments t ON a.appointment_id = t.appointment_id
GROUP BY doctor_name
ORDER BY revenue DESC;

SELECT 
    d.hospital_branch, SUM(t.cost) AS revenue
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_id = a.doctor_id
        JOIN
    treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.hospital_branch
ORDER BY revenue DESC;

SELECT 
    insurance_provider, COUNT(*) AS total_patients
FROM
    patients
GROUP BY insurance_provider
ORDER BY total_patients DESC;

SELECT 
    d.specialization,
    ROUND(AVG(t.cost), 2) AS avg_treatment_cost
FROM
    doctors d
        JOIN
    appointments a ON d.doctor_id = a.doctor_id
        JOIN
    treatments t ON a.appointment_id = t.appointment_id
GROUP BY d.specialization
ORDER BY avg_treatment_cost DESC;