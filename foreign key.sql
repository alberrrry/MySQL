ALTER TABLE appointment
    ADD CONSTRAINT FK_patientID
    FOREIGN KEY (patientID)
    REFERENCES patient(patientID);

ALTER TABLE appointment
    ADD CONSTRAINT FK_doctorID
    FOREIGN KEY (doctorID)
    REFERENCES doctor(doctorID);

ALTER TABLE appointment
    ADD CONSTRAINT FK_ticketID
    FOREIGN KEY (ticketID)
    REFERENCES appointment(ticketID);
 
 ALTER TABLE billing
    ADD FOREIGN KEY(patientID) REFERENCES patient(patientID);
