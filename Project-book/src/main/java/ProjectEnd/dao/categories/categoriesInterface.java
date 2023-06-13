package ProjectEnd.dao.categories;

import java.util.List;

import ProjectEnd.entities.Categories;

public interface categoriesInterface {
	public List<Categories> getCategories();
	public Categories getCategoryById(int cateId);
	public boolean insertCategory(Categories categories);
	public boolean updateCategory(Categories categories);
	public boolean deteleCategory(int cateId);
	
}
