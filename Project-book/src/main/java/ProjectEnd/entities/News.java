package ProjectEnd.entities;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "news")
public class News {
    @Id
    @Column(name ="news_Id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer newsId;
    @Column(name = "News_Content")
    private String newsContent;
    @Column(name = "News_Date")
    private Date newsDate;
    @Column(name = "News_Title")
    private String newsTitle;
    @Column(name = "News_Image")
    private String newsImage;
    @Column(name = "News_Description")
    private String newsDescription;
    @Column(name = "news_views")
    private Integer newsViews;

    public News() {
    }

    public News(Integer newsId, String newsContent, Date newsDate, String newsTitle, String newsImage, String newsDescription, Integer newsViews) {
        this.newsId = newsId;
        this.newsContent = newsContent;
        this.newsDate = newsDate;
        this.newsTitle = newsTitle;
        this.newsImage = newsImage;
        this.newsDescription = newsDescription;
        this.newsViews = newsViews;
    }

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    public Date getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(Date newsDate) {
        this.newsDate = newsDate;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsImage() {
        return newsImage;
    }

    public void setNewsImage(String newsImage) {
        this.newsImage = newsImage;
    }

    public String getNewsDescription() {
        return newsDescription;
    }

    public void setNewsDescription(String newsDescription) {
        this.newsDescription = newsDescription;
    }

    public Integer getNewsViews() {
        return newsViews;
    }

    public void setNewsViews(Integer newsViews) {
        this.newsViews = newsViews;
    }
}
