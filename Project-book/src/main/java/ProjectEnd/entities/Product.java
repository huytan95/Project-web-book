package ProjectEnd.entities;

import java.util.Date;
import java.util.Set;

import javax.persistence.*;

import ProjectEnd.entities.Categories;
import ProjectEnd.entities.Comment;
import ProjectEnd.entities.OrderDetail;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@Column(name ="product_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer productId;
	
	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "description")
	private String longDescription;
	
	@Column (name ="price_input")
	private Integer priceInput;
	
	@Column(name ="price_output")
	private Integer priceOutput;
	
	@Column(name ="discound")
	private Integer discound;
	
	@Column (name ="quantity")
	private Integer quantityProduct;
	
	@Column(name ="import_date")
	private Date importDate;
	
	@Column(name = "shortDescription")
	private String shortDescription;
	
	@Column (name ="image_name")
	private String imageName;
	
	@ManyToOne 
	@JoinColumn(name = "categories_Id",referencedColumnName = "id")
	private Categories categories;

	@OneToMany(mappedBy = "product")
	private Set<OrderDetail> orderDetails;

	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
	private Set<Comment> comments;

	public Product() {
		super();
	}

	public Product(Integer productId, String productName, String longDescription, Integer priceInput,
				   Integer priceOutput, Integer discound, Integer quantityProduct, Date importDate,
				   String shortDescription, String imageName, Categories categories, Set<OrderDetail> orderDetails,
				   Set<Comment> comments) {
		this.productId = productId;
		this.productName = productName;
		this.longDescription = longDescription;
		this.priceInput = priceInput;
		this.priceOutput = priceOutput;
		this.discound = discound;
		this.quantityProduct = quantityProduct;
		this.importDate = importDate;
		this.shortDescription = shortDescription;
		this.imageName = imageName;
		this.categories = categories;
		this.orderDetails = orderDetails;
		this.comments = comments;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getLongDescription() {
		return longDescription;
	}

	public void setLongDescription(String longDescription) {
		this.longDescription = longDescription;
	}

	public Integer getPriceInput() {
		return priceInput;
	}

	public void setPriceInput(Integer priceInput) {
		this.priceInput = priceInput;
	}

	public Integer getPriceOutput() {
		return priceOutput;
	}

	public void setPriceOutput(Integer priceOutput) {
		this.priceOutput = priceOutput;
	}

	public Integer getDiscound() {
		return discound;
	}

	public void setDiscound(Integer discound) {
		this.discound = discound;
	}

	public Integer getQuantityProduct() {
		return quantityProduct;
	}

	public void setQuantityProduct(Integer quantityProduct) {
		this.quantityProduct = quantityProduct;
	}

	public Date getImportDate() {
		return importDate;
	}

	public void setImportDate(Date importDate) {
		this.importDate = importDate;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
}
