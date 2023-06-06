package ProjectEnd.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "message")
public class Message {
    @Id
    @Column(name = "messId")
    @GeneratedValue (strategy = GenerationType.IDENTITY)
    private long messId;
    @Column(name = "fullname")
    private String fullName;
    @Column(name="email")
    private String email;
    @Column(name = "telephone")
    private String phoneNumber;
    @Column(name = "message")
    private String message;
    @Column(name = "status")
    private boolean status;
    @Column(name = "message_date")
    private Date messageDate;
    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private User user;

    public Message() {
    }

    public Message(long messId, String fullName, String email, String phoneNumber, String message, boolean status, Date messageDate, User user) {
        this.messId = messId;
        this.fullName = fullName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.message = message;
        this.status = status;
        this.messageDate = messageDate;
        this.user = user;
    }

    public long getMessId() {
        return messId;
    }

    public void setMessId(long messId) {
        this.messId = messId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getMessageDate() {
        return messageDate;
    }

    public void setMessageDate(Date messageDate) {
        this.messageDate = messageDate;
    }
}
