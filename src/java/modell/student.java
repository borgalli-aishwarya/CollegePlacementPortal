package modell;

import java.sql.Date;

public class student {
    private int id;
    private String name;
    private String email;
    private String mobile;
    private String prn;
    private String college;
    private String branch;
    private int year;
    private int semester;
    private Date dob;
    private String gender;
    private String password;
    private String resumeUrl;

    public student() {}

    public student(int id, String name, String email, String mobile, String prn,
                   String college, String branch, int year, int semester,
                   Date dob, String gender, String password, String resumeUrl) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.prn = prn;
        this.college = college;
        this.branch = branch;
        this.year = year;
        this.semester = semester;
        this.dob = dob;
        this.gender = gender;
        this.password = password;
        this.resumeUrl = resumeUrl;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPrn() {
        return prn;
    }

    public void setPrn(String prn) {
        this.prn = prn;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }
}
