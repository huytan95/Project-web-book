package ProjectEnd.dao.contact;

import java.util.List;

import ProjectEnd.entities.imageInfor;

public interface imageInforDAO {
	public List<imageInfor> getImageInfor();
	public imageInfor getImageInforById(int id);
	public boolean updateImageInfor(imageInfor imageInfor);
}
