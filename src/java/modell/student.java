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
    // (generate using IDE for all fields)
}
