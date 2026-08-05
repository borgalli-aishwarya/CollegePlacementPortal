package modell;

import java.sql.Date;
import java.sql.Timestamp;

public class application {
    private int id;
    private int studentId;
    private int jobId;
    private String status;
    private Date interviewDate;
    private String offerDetails;
    private Timestamp appliedOn;

    public application() {}

    public application(int id, int studentId, int jobId, String status,
                       Date interviewDate, String offerDetails, Timestamp appliedOn) {
        this.id = id;
        this.studentId = studentId;
        this.jobId = jobId;
        this.status = status;
        this.interviewDate = interviewDate;
        this.offerDetails = offerDetails;
        this.appliedOn = appliedOn;
    }

    // Getters and Setters
}
