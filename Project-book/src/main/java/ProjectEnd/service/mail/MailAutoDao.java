package ProjectEnd.service.mail;


import ProjectEnd.entities.MailAuto;

import java.util.List;

public interface MailAutoDao {
    public boolean updateMailAuto(MailAuto mailAuto);
    public List<MailAuto> getMailAuto();
    public MailAuto getMailById(int id);
}
