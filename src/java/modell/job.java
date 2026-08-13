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

    public job() {
    }

    public job(int id, int recruiterId, String title, String company,
               String roleType, String requirements,
               String technicalSkills, int durationMonths,
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRecruiterId() {
        return recruiterId;
    }

    public void setRecruiterId(int recruiterId) {
        this.recruiterId = recruiterId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getRoleType() {
        return roleType;
    }

    public void setRoleType(String roleType) {
        this.roleType = roleType;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getTechnicalSkills() {
        return technicalSkills;
    }

    public void setTechnicalSkills(String technicalSkills) {
        this.technicalSkills = technicalSkills;
    }

    public int getDurationMonths() {
        return durationMonths;
    }

    public void setDurationMonths(int durationMonths) {
        this.durationMonths = durationMonths;
    }

    public String getStipendSalary() {
        return stipendSalary;
    }

    public void setStipendSalary(String stipendSalary) {
        this.stipendSalary = stipendSalary;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}