package ProjectEnd.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "image_infor")
public class imageInfor {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;
	
	@Column(name = "image_type")
	String imageType;
	
	@Column(name = "image_name")
	String imageName;
	

	public imageInfor() {
		super();
	}

	public imageInfor(int id, String imageType, String imageName) {
		super();
		this.id = id;
		this.imageType = imageType;
		this.imageName = imageName;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

}
