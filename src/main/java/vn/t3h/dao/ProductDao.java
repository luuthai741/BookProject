package vn.t3h.dao;

import java.util.List;
import vn.t3h.model.Product;
import vn.t3h.model.ProductJionImage;
import vn.t3h.pagination.Ipage;

public interface ProductDao {
	public Product create(Product ct);
	public Product update(Product ct);
	public Product findById(int id);
	public void delete(Product ct);
	public Ipage<Product> listProducts(int currentPage);
	public List<ProductJionImage> productJionImage();
}