package ProjectEnd.dao.Product;

import java.util.List;

import ProjectEnd.entities.Product;

public interface ProductDAO {
	public List<Product> getProduct();
	public Product getProductById(int productId);
	public boolean insertProduct(Product product);
	public boolean updateProduct(Product product);
	public boolean deleteProduct(int productId);
	public List<Product> getProductByName(String productName, Integer offset, Integer maxResult);
	public List<Product> getProductPaging(Integer offset, Integer maxResult);
	public Long getTotalProduct();
	public List<Product> getProductByCateId(int cateId, Integer offset, Integer maxResult);
	public Long getTotalProductByCateId(int cateId);
	public List<Product> getTopNewProduct();
	public List<Product> getTopDiscountProduct();
	public Long getTotalProductByName(String productName);
	public List<Product> getProductByCateId(int cateId);
	
}
