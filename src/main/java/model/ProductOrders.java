package model;

public class ProductOrders {
	private String orderId;
	private int productId;
	private int quantityProduct;
	private float priceProduct;

	public ProductOrders() {
		// TODO Auto-generated constructor stub
	}

	public ProductOrders(String orderId, int productId, int quantityProduct, float priceProduct) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.quantityProduct = quantityProduct;
		this.priceProduct = priceProduct;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId2) {
		this.orderId = orderId2;
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

	public float getPriceProduct() {
		return priceProduct;
	}

	public void setPriceProduct(float priceProduct) {
		this.priceProduct = priceProduct;
	}

}
