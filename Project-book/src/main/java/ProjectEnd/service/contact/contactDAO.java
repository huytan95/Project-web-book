package ProjectEnd.service.contact;

import java.util.List;

import ProjectEnd.entities.contact;
public interface contactDAO {
	public List<contact> getContact();
	public contact getInforByEmail(String email);
	public boolean updateInfor(contact infor);
	public contact getInforById(int id);
}
