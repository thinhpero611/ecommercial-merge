package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Cart;
import model.Orders;
import model.ProductOrders;

public class OrdersDAO {

	public OrdersDAO() {
		// TODO Auto-generated constructor stub
	}
	
	// insert information of Order to data source, that including list of 
	// products in cart (c) and information of buyer in Order o
	public void insertOrder(Orders order, Cart cart) throws SQLException, Exception {
		// get connection
		Connection conn = new DBContext().getConnection();
		String query1 = "insert into orders (order_id, user_mail, order_status, order_date, order_discount_code, order_address)"
					 +  "values (?, ?, ?, ?, ?, ?);";
		PreparedStatement stmt = conn.prepareStatement(query1);
		System.out.println(order.getOrderId());
		stmt.setString(1, order.getOrderId().substring(0, 8));
		stmt.setString(2, order.getUserEmail());
		stmt.setInt(3, order.getStatus());
		stmt.setString(4, String.valueOf(order.getOrderDate()));
		stmt.setString(5, order.getDiscount());
		stmt.setString(6, order.getAddress());
		
		stmt.executeUpdate();
	}
	
	public void insertOrderDetail(Orders order) throws SQLException, Exception {
		Connection conn = new DBContext().getConnection();
		String query = "";
		String orderId = order.getOrderId().substring(0, 8);
		for (ProductOrders item : order.getLp()) {
			query = "insert into orders_detail (product_id, order_quantity, price_product, order_id) values ("
					+ item.getProductId() + ","
					+ item.getQuantityProduct() +","
					+ item.getPriceProduct()+ ",'"
					+ orderId  + "' );";
//			System.out.println(query);
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.executeUpdate();
		}
		
	}
	
	// get all orders by email
	public List<Orders> getOrdersByEmail(String mail) throws SQLException, Exception {
		Connection conn = new DBContext().getConnection();
		List<Orders> listOrders = new ArrayList<Orders>();
		String query = "select O.order_id, O.order_status, O.order_date, O.order_discount_code, O.order_address, "
					  + "sum(D.price_product) "
				      + "from orders as O join orders_detail as D on O.order_id = D.order_id "
				      + "where user_mail = ?"
				      + "group by order_id;";
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setString(1, mail);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Orders orders = new Orders();
			List<ProductOrders> lp = new ArrayList<ProductOrders>();
			
			orders.setOrderId(rs.getString(1));
			orders.setStatus(rs.getInt(2));
			orders.setOrderDate(rs.getDate(3));
			orders.setDiscount(rs.getString(4));
			orders.setAddress(rs.getString(5));
			orders.setPrice(rs.getFloat(6));
			
			String query1 = "select D.order_id, P.product_id, D.price_product, D.order_quantity "
					+ "from orders_detail as D join products as P on D.product_id = P.product_id "
					+ "where D.order_id = '" + rs.getString(1) + "'";
//			System.out.println(query1);
			PreparedStatement stmt1 = conn.prepareStatement(query1);
			ResultSet rs1 = stmt1.executeQuery();
			while (rs1.next()) {
				ProductOrders productOrder = new ProductOrders();
				productOrder.setOrderId(rs1.getString(1));
				productOrder.setProductId(rs1.getInt(2));
				productOrder.setPriceProduct(rs1.getFloat(3));
				productOrder.setQuantityProduct(rs1.getInt(4));
				lp.add(productOrder);
			}
			orders.setLp(lp);
			listOrders.add(orders);
		}
		return listOrders;
	}
}
