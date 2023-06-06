package ProjectEnd.service.news;

import ProjectEnd.entities.News;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class NewsDaoImpl implements NewsDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<News> listNews(Integer offset, Integer maxResult) {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("from News")
                    .setFirstResult(offset)
                    .setMaxResults(maxResult)
                    .list();
            return list;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public News getNewsById(Integer newsId) {
        Session session = sessionFactory.openSession();
        try {
            News news = session.get(News.class, newsId);
            return  news;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean insertNews(News news) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(news);
            session.getTransaction().commit();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean updateNews(News news) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(news);
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean deleteNews(Integer newsId) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.delete(getNewsById(newsId));
            session.getTransaction().commit();
            return true;
        } catch (Exception e){
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return false;
    }

    @Override
    public List<News> getTopNewsByViews() {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("FROM News n ORDER BY n.newsViews DESC ").list();
            return list;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Long getTotalNews() {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("SELECT COUNT(*) FROM News").list();
            return (Long) list.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<News> searchNews(String newsTitle,Integer offset, Integer maxResult) {
        Session session = sessionFactory.openSession();
        try {
            if(newsTitle==null || newsTitle.length()==0)
                newsTitle = "%";
            else
                newsTitle = "%"+newsTitle + "%";

            List list = session.createQuery("from News where LOWER(newsTitle) like LOWER(:newsTitle) order by newsTitle desc")
                    .setFirstResult(offset)
                    .setMaxResults(maxResult)
                    .setParameter("newsTitle", newsTitle)
                    .list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public Long getTotalNewsByTitle(String newsTitle) {
        Session session = sessionFactory.openSession();
        try {
            if(newsTitle==null || newsTitle.length()==0)
                newsTitle = "%";
            else
                newsTitle = "%"+newsTitle + "%";

            List list = session.createQuery("from News where LOWER(newsTitle) like LOWER(:newsTitle) order by newsTitle desc")
                    .setParameter("newsTitle", newsTitle)
                    .list();
            int temp=0;
            for(Object obj : list){
                temp++;
            }
            return (long)temp;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
}
