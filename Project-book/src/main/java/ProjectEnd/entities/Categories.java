package ProjectEnd.entities;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "categories")
public class Categories {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int cateId;
    
    @Column(name = "categories_Name")
    private String cateName;
    
    @OneToMany (mappedBy = "categories")
    private Set<Product> product;
    
    // Constructors
    public Categories() {
        
    }
    
    public Categories(int cateId, String cateName) {
		super();
		this.cateId = cateId;
		this.cateName = cateName;
	}

	// Getters and setters
    public int getcateId() {
        return cateId;
    }
    
    public void setcateId(int cateId) {
        this.cateId = cateId;
    }
    
    public String getCateName() {
        return cateName;
    }
    
    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
    
}

