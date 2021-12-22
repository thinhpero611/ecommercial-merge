package model;

public class ProductOrders {
	private int orderId;
	private int productId;
	private int quantityProduct;
	private float priceProduct;

	public ProductOrders() {
		// TODO Auto-generated constructor stub
	}

	public ProductOrders(int orderId, int productId, int quantityProduct, float priceProduct) {
		super();
		this.orderId = orderId;
		this.productId = productId;
		this.quantityProduct = quantityProduct;
		this.priceProduct = priceProduct;
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

	public float getPriceProduct() {
		return priceProduct;
	}

	public void setPriceProduct(float priceProduct) {
		this.priceProduct = priceProduct;
	}

}
