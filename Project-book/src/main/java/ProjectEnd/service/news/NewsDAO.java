package ProjectEnd.service.news;

import ProjectEnd.entities.News;

import java.util.List;

public interface NewsDAO {
    public List<News> listNews(Integer offset, Integer maxResult);
    public News getNewsById(Integer newsId);
    public boolean insertNews(News news);
    public boolean updateNews(News news);
    public boolean deleteNews(Integer newsId);
    public List<News> getTopNewsByViews();
    public Long getTotalNews();
    public List<News> searchNews(String newsTitle,Integer offset, Integer maxResult);
    public Long getTotalNewsByTitle(String newsTitle);
}
