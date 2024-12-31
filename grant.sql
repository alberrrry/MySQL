CREATE USER 'albi'@'localhost' IDENTIFIED BY 'albipassword';
GRANT ALL PRIVILEGES ON medical_appointments TO 'albi'@'localhost';
FLUSH PRIVILEGES;


