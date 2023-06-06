package ProjectEnd.entities;

import javax.persistence.*;

@Entity
@Table(name = "mail")
public class MailAuto {
    @Id
    @Column(name ="id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer mailId;

    @Column(name = "mail_type")
    private String mailType;

    @Column(name = "mail_content")
    private String mailContent;

    public MailAuto() {  }

    public MailAuto(Integer mailId, String mailType, String mailContent) {
        this.mailId = mailId;
        this.mailType = mailType;
        this.mailContent = mailContent;
    }

    public Integer getMailId() {
        return mailId;
    }

    public void setMailId(Integer mailId) {
        this.mailId = mailId;
    }

    public String getMailType() {
        return mailType;
    }

    public void setMailType(String mailType) {
        this.mailType = mailType;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }
}
