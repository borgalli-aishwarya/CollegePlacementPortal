package modell;

import java.sql.Date;

public class job {
    private int id;
    private int recruiterId;
    private String title;
    private String company;
    private String roleType;
    private String requirements;
    private String technicalSkills;
    private int durationMonths;
    private String stipendSalary;
    private Date deadline;

    public job() {}

    public job(int id, int recruiterId, String title, String company, String roleType,
               String requirements, String technicalSkills, int durationMonths,
               String stipendSalary, Date deadline) {
        this.id = id;
        this.recruiterId = recruiterId;
        this.title = title;
        this.company = company;
        this.roleType = roleType;
        this.requirements = requirements;
        this.technicalSkills = technicalSkills;
        this.durationMonths = durationMonths;
        this.stipendSalary = stipendSalary;
        this.deadline = deadline;
    }

    // Getters and Setters
}
