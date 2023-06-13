package ProjectEnd.dao.mail;

import ProjectEnd.entities.MailAuto;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public class MailAutoDaoImpl implements MailAutoDao{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public boolean updateMailAuto(MailAuto mailAuto) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(mailAuto);
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
    public List<MailAuto> getMailAuto() {
        Session session = sessionFactory.openSession();
        try {
            List list = session.createQuery("from MailAuto").list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            // TODO: handle exception
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public MailAuto getMailById(int id) {
        Session session = sessionFactory.openSession();
        try {
            MailAuto mailAuto = session.get(MailAuto.class,id);
            return  mailAuto;
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }
}
