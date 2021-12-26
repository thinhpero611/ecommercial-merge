package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.UserGeneric;

public class AdminDAO {

	public AdminDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public List<UserGeneric> getStatisticUser() throws SQLException, Exception {
		Connection conn = new DBContext().getConnection();
		List<UserGeneric> listUserG = new ArrayList<UserGeneric>();
		String query = "select derived.user_mail, A.user_name, A.user_age, A.user_address, "
						+ "count(derived.order_id) as NumberOrder, "
						+ "sum(derived.total) as totalPayment "
						+ "from( "
								+ "select user_mail, O.order_id , sum(D.price_product * D.order_quantity) as total "
								+ "from orders as O join orders_detail as D on O.order_id = D.order_id "
								+ "group by D.order_id "
							+ ") as derived "
						+ "join account as A on derived.user_mail = A.user_mail "
						+ "group by user_mail "
						+ "order by totalPayment desc;";
//		System.out.println(query);
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			UserGeneric userG = new UserGeneric();			
			userG.setMail(rs.getString(1));
			userG.setName(rs.getString(2));
			userG.setAge(rs.getInt(3));
			String address = rs.getString(4);
			if (address != null & address.split(",").length > 2) {
				userG.setCity(address.split(",")[address.split(",").length - 2]);
				userG.setCountry(address.split(",")[address.split(",").length - 1]);
			}
			userG.setNumberOfOrder(rs.getInt(5));
			userG.setTotalPayment(rs.getFloat(6));
			listUserG.add(userG);
		}
		return listUserG; 
		
	}
	
	public float getTotalProductSale() throws SQLException, ClassNotFoundException {
		Connection conn = new DBContext().getConnection();
		String query = "select sum(order_quantity) from orders_detail;";
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		if (rs.next()) {
			return rs.getFloat(1);
		}
		return 0;
	}
}
