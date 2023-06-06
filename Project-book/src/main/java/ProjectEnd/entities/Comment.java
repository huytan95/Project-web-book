package ProjectEnd.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "comments")
public class Comment {
    @Id
    @Column(name ="Comment_Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int commentId;

    @Column(name = "comment_content")
    private String commentContent;

    @Column(name = "comment_date")
    public Date commentDate;

    @ManyToOne
    @JoinColumn(name = "userId", referencedColumnName = "id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "productId", referencedColumnName = "product_Id")
    private Product product;

    public Comment() {
    }

    public Comment(int commentId, String commentContent, Date commentDate, User user, Product product) {
        this.commentId = commentId;
        this.commentContent = commentContent;
        this.commentDate = commentDate;
        this.user = user;
        this.product = product;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
