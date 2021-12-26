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
		String query = "select A.user_mail, A.user_name, A.user_age, A.user_address, "
				+ "count(O.order_id) as NumberOrder, "
				+ "sum(D.price_product * D.order_quantity) as totalPayment "
				+ "from account as A join orders as O on A.user_mail = O.user_mail join orders_detail as D on O.order_id = D.order_id "
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
}
