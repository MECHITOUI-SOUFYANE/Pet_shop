package business;

import java.io.Serializable;

public class Product implements Serializable {

	private static final long serialVersionUID = -8390866740687523598L;
	private int idProduct;
	private String name;
	private String type;

	public String getAdvices() {
		return advices;
	}

	public void setAdvices(String advices) {
		this.advices = advices;
	}

	public String getCategory() {
		return category;
	}

	public void setCategorie(String categorie) {
		this.category = categorie;
	}

	private String picture;
	private String description;
	private String details;
	private String advices;
	private String category;
	private int price;

	public Product(int idProduct, String name, String type, String picture, String description, String details,
			String advices, int price, String categorie) {
		this.idProduct = idProduct;
		this.name = name;
		this.type = type;
		this.picture = picture;
		this.description = description;
		this.details = details;
		this.advices = advices;
		this.category = categorie;
		this.price = price;
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int id) {
		this.idProduct = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int prix) {
		this.price = prix;
	}

}
