package model;

public class ProductOrders {
	private int orderId;
	private int productId;
	private int quantityProduct;
	private String nameProduct;

	public ProductOrders() {
		// TODO Auto-generated constructor stub
	}

	public ProductOrders(int orderId, int productId, int quantityProduct, String nameProduct) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.quantityProduct = quantityProduct;
		this.nameProduct = nameProduct;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getQuantityProduct() {
		return quantityProduct;
	}

	public void setQuantityProduct(int quantityProduct) {
		this.quantityProduct = quantityProduct;
	}

	public String getNameProduct() {
		return nameProduct;
	}

	public void setNameProduct(String nameProduct) {
		this.nameProduct = nameProduct;
	}

}
