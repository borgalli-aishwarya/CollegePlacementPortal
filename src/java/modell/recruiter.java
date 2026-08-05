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
}
