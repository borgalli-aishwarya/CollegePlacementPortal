package modell;

public class recruiter {
    private int id;
    private String companyName;
    private String hrContactPerson;
    private String email;
    private String phone;
    private String jobTitle;
    private String websiteUrl;
    private String industry;
    private String location;
    private String logoUrl;
    private String password;
    private String status;

    public recruiter() {}

    public recruiter(int id, String companyName, String hrContactPerson, String email,
                     String phone, String jobTitle, String websiteUrl, String industry,
                     String location, String logoUrl, String password, String status) {
        this.id = id;
        this.companyName = companyName;
        this.hrContactPerson = hrContactPerson;
        this.email = email;
        this.phone = phone;
        this.jobTitle = jobTitle;
        this.websiteUrl = websiteUrl;
        this.industry = industry;
        this.location = location;
        this.logoUrl = logoUrl;
        this.password = password;
        this.status = status;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getHrContactPerson() {
        return hrContactPerson;
    }

    public void setHrContactPerson(String hrContactPerson) {
        this.hrContactPerson = hrContactPerson;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getWebsiteUrl() {
        return websiteUrl;
    }

    public void setWebsiteUrl(String websiteUrl) {
        this.websiteUrl = websiteUrl;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
