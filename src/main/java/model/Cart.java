package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<Product> items;// list of item in cart
	
	public Cart() {
		// TODO Auto-generated constructor stub
		items = new  ArrayList<Product>();
	}
	
	// add a new product to cart
	public void add(Product newProduct) {
		for (Product x : items) {
			if (newProduct.getId() == x.getId()) {
				x.setNumber(x.getNumber() + 1);
				return;
			}
		}
		items.add(newProduct);
	}
	
	// remove a product from cart
	public void remove(int id) {
		for (Product x : items ) {
			if (x.getId() == id) {
				items.remove(x);
				return;
			}
		}
	}
	
	// return total amount cart
	public double getAmount() {
		double s = 0;
		for (Product x : items) {
			s += x.getPrice() * x.getNumber();
		}
		return Math.round(s * 100.0) / 100.0;
	}
	
	// return list of products in cart
	public List<Product> getItems() {
		return items;
	}
	
	// return the total number of item in cart
	public int getSize() {
		return items.size();
	}
	
	// clear all item in cart
	public void clear() {
		items.clear();
	}
	
	// check one product is stored in this cart
	public boolean contain(Product product) {
		for (Product x : items) {
			if (product.getId() == x.getId()) {
				return true;
			}
		}
		return false;
	}
	
	// get item in cart with a specified id
	public Product getItem(int id) {
		for (Product x : items) {
			if (x.getId() == id) {
				return x;
			}
		}
		return null;
	}
}
