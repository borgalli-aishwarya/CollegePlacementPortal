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
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getInterviewDate() {
        return interviewDate;
    }

    public void setInterviewDate(Date interviewDate) {
        this.interviewDate = interviewDate;
    }

    public String getOfferDetails() {
        return offerDetails;
    }

    public void setOfferDetails(String offerDetails) {
        this.offerDetails = offerDetails;
    }

    public Timestamp getAppliedOn() {
        return appliedOn;
    }

    public void setAppliedOn(Timestamp appliedOn) {
        this.appliedOn = appliedOn;
    }
}
