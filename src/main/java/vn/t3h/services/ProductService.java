package vn.t3h.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.t3h.dao.ProductDao;
import vn.t3h.model.Product;
import vn.t3h.pagination.Ipage;

@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDao;
	
	public Ipage<Product> getAllProduct(int page) {
		return productDao.listProducts(page);
	}
}
