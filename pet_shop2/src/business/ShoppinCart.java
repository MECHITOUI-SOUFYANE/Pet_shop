package business;

import java.io.Serializable;

public class ShoppinCart implements Serializable {
	
	private static final long serialVersionUID = -2310094902541416783L;
	private Product product ;
	private int quantity;
	private int prix;
	
	
	public ShoppinCart(Product product , int quntity,int prix) {
		setProduct(product);
		setQuantity(quntity);
		setPrix(prix);
	}
	
	public Product getProduct() {
		return product;
	}
	
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getPrix() {
		return prix;
	}
	
	public void setPrix(int prix) {
		this.prix = prix;
	}
	
	public void incrementQuantity() {
		this.quantity++;
	}
	
	public void incrementPrice() {
		this.prix = this.prix+100;
	}


}
