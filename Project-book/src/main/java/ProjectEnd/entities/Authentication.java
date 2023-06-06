package ProjectEnd.entities;

import javax.persistence.*;

@Entity
@Table(name = "AUTHENTICATION_CODE")
public class Authentication {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "code")
    private String code;

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private User user;

    public Authentication() {
    }

    public Authentication(int id, String code, User user) {
        this.id = id;
        this.code = code;
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
