package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import context.DBContext;
import model.Product;

public class ListProductDAO {
	
	// fetch all electronic product store in data base
	public List<Product> search(String characters, int start, int total) throws SQLException, ClassNotFoundException {
		List<Product> ls = new ArrayList<Product>();
		
		// get connection 
		Connection conn = new DBContext().getConnection();
		String query = "select * from products limit " + (start -1) + "," +  total;
		PreparedStatement stmt;
		if (!characters.equals("")) {
			query = "select * from products where product_name like '%" + characters + "%' limit " + (start -1) + "," +  total;
		}
		stmt = conn.prepareStatement(query);
		ResultSet rs = stmt.executeQuery();
		
		while (rs.next()) {
			Product newProduct = new Product();
			newProduct.setId(rs.getInt(1));
			newProduct.setName(rs.getString(2));
			newProduct.setDescription(rs.getString(3));
			newProduct.setPrice(rs.getFloat(4));
			newProduct.setSrc(rs.getString(5));
			newProduct.setType(rs.getString(6));
			newProduct.setBrand(rs.getString(7));
			
			//add to array list
			ls.add(newProduct);
		}
		return ls;
		
	}
	
	public Product getProduct(String chracters) throws SQLException, ClassNotFoundException {
		// get connection 
		Connection conn = new DBContext().getConnection();
		String query = "select * from products where product_id = ?";
		PreparedStatement stmt = conn.prepareStatement(query);
		
		stmt.setString(1, chracters);
		ResultSet rs = stmt.executeQuery();
		
		Product product = new Product();
		while (rs.next()) {
			product.setId(rs.getInt(1));
			product.setName(rs.getString(2));
			product.setDescription(rs.getString(3));
			product.setPrice(rs.getFloat(4));
			product.setSrc(rs.getString(5));
			product.setType(rs.getString(6));
			product.setBrand(rs.getString(7));
		}
		return product;
	}
}
