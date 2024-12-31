-- UNION
SELECT patientID, ticketID from billing WHERE status='pending'
UNION
SELECT patientID, ticketID from appointment WHERE doctorID='450';


-- INNER JOIN
SELECT DISTINCT b.patientID, b.ticketID
FROM billing b
INNER JOIN appointment a 
    ON b.patientID = a.patientID 
    AND b.ticketID = a.ticketID
WHERE b.status='pending' 
    AND a.doctorID='450';
    
-- LEFT JOIN
SELECT DISTINCT b.patientID, b.ticketID
FROM billing b
LEFT JOIN appointment a 
    ON b.patientID = a.patientID 
    AND b.ticketID = a.ticketID
WHERE b.status='pending' 
    AND a.patientID IS NULL;    