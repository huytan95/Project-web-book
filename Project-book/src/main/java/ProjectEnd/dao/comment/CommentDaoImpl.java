package ProjectEnd.dao.comment;

import ProjectEnd.entities.Comment;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CommentDaoImpl implements CommentDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean insertComment(Comment comment) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(comment);
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
    public List<Comment> getListComment(Integer offset, Integer maxResult) {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("FROM Comment c ORDER BY c.commentDate DESC")
                    .setFirstResult(offset)
                    .setMaxResults(maxResult)
                    .list();
            return  list;
        } catch (Exception e){
            e.printStackTrace();
        }finally {
            session.close();
        }
        return null;
    }

    @Override
    public Comment getCommentById(int commentId) {
        Session session = sessionFactory.openSession();
        try {
            Comment comment = session.get(Comment.class, commentId);
            return  comment;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean deleteComment(int commentId) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.delete(getCommentById(commentId));
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
    public List<Comment> getListCommentByProductId(int productId) {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("FROM Comment c WHERE c.product.productId = :productId ORDER BY commentDate DESC")
                    .setParameter("productId", productId)
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
    public Long totalComment() {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("SELECT COUNT(*) FROM Comment").list();
            return (Long) list.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            session.close();
        }
        return 0L;
    }
}
