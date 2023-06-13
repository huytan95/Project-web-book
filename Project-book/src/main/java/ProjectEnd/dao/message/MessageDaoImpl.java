package ProjectEnd.dao.message;

import ProjectEnd.entities.Message;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MessageDaoImpl implements MessageDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean insertMessage(Message message) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(message);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return false;
    }

    @Override
    public List<Message> getMessage(Integer offset, Integer maxResult) {
        Session session = sessionFactory.openSession();
        try{
            List<Message> list = session.createQuery("FROM Message m ORDER BY m.messageDate DESC")
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
    public Long totalMessage() {
        Session session = sessionFactory.openSession();
        try {
            Query query = session.createQuery("SELECT COUNT(*) FROM Message");
            List list = query.list();
            return (Long) list.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean deleteMessage(Long messId) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.delete(getMessageById(messId));
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
    public Message getMessageById(Long messId) {
        Session session = sessionFactory.openSession();
        try{
            Message message = session.get(Message.class, messId);
            return message;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
    @Override
    public boolean updateMessage(Message message) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(message);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        }finally {
            session.close();
        }
        return false;
    }

}
