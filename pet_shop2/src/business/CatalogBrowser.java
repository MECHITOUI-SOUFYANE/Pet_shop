package business;

import java.util.ArrayList;
import java.util.List;

import dao.ProductDAO;

public class CatalogBrowser {

	private int productCount = ProductDAO.getProductCount();
	private List<Product> listProduct = new ArrayList<Product>();

	public CatalogBrowser() {
		this.listProduct = ProductDAO.getProducts();
	}

	public int getProductCount() {
		return productCount;
	}

	public void setProductCount(int productCount) {
		this.productCount = productCount;
	}

	public List<Product> getListProduct() {
		return listProduct;
	}

	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}

}
