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
		String query1 = "insert into orders (user_mail, order_status, order_date, order_discount_code, order_address)"
					 +  "values (?, ?, ?, ?, ?);";
		PreparedStatement stmt = conn.prepareStatement(query1);
		
		stmt.setString(1, order.getUserEmail());
		stmt.setString(2, String.valueOf(order.getStatus()));
		stmt.setString(3, String.valueOf(order.getOrderDate()));
		stmt.setString(4, order.getDiscount());
		stmt.setString(5, order.getAddress());
		
		stmt.executeUpdate();
	}
	
	public void insertOrderDetail(Orders order) throws SQLException, Exception {
		Connection conn = new DBContext().getConnection();
		String query = "";
		for (ProductOrders item : order.getLp()) {
			query = "insert into orders_detail (product_id, order_quantity, price_product) values ("
					+ item.getProductId() + ","
					+ item.getQuantityProduct() +","
					+ item.getPriceProduct() + " );";
			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.executeUpdate();
		}
		System.out.println(query);
		
	}
	
	// get all orders by email
	public List<Orders> getOrdersByEmail(String mail) throws SQLException, Exception {
		Connection conn = new DBContext().getConnection();
		List<Orders> listOrders = new ArrayList<Orders>();
		String query = "select order_id, order_status, order_date, order_discount_code, order_address "
				      + "from orders where user_mail = ?;";
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.setString(1, mail);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Orders orders = new Orders();
			orders.setOrderId(rs.getInt(1));
			orders.setStatus(rs.getInt(2));
			orders.setOrderDate(rs.getDate(3));
			orders.setDiscount(rs.getString(4));
			orders.setAddress(rs.getString(5));
			listOrders.add(orders);
		}
		return listOrders;
	}
}
