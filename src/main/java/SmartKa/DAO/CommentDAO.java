package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import SmartKa.Constants.Constant;
import SmartKa.Model.CmtModel;
import SmartKa.Service.JDBCConnection;
import SmartKa.Validators.Validators;

public class CommentDAO {
	
	public static Connection connection1 = new JDBCConnection().conn;
	
	// product
	public static ArrayList<CmtModel> getAllCmtProduct(String id) {
		ArrayList<CmtModel> list = new ArrayList<CmtModel>();
		
		try {
			String sql = Constant.GET_CMT_PRODUCT;
			PreparedStatement ps = CommentDAO.connection1.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CmtModel cmt = new CmtModel(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(cmt);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void addCmtProduct(String content, String date, String username, int id) {
		
		try {
			
			String sql = Constant.ADD_CMT_PRODUCT;
			PreparedStatement ps = CommentDAO.connection1.prepareStatement(sql);
			ps.setString(1, content);
			ps.setString(2, date);
			ps.setString(3, username);
			ps.setInt(4, id);
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	// blog
	public static ArrayList<CmtModel> getAllCmtBlog(String id) {
		ArrayList<CmtModel> list = new ArrayList<CmtModel>();
		
		try {
			String sql = Constant.GET_CMT_BLOG;
			PreparedStatement ps = CommentDAO.connection1.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				CmtModel cmt = new CmtModel(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(cmt);
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static void addCmtBlog(String content, String date, String username, int id) {
		
		try {
			
			String sql = Constant.ADD_CMT_BLOG;
			PreparedStatement ps = CommentDAO.connection1.prepareStatement(sql);
			ps.setString(1, content);
			ps.setString(2, date);
			ps.setString(3, username);
			ps.setInt(4, id);
			ps.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	

	public static void main(String[] args) {
//		System.out.println(getAllCmtProduct("1").toString()); 
//		addCmtProduct("abcd", "2022-01-16 08:54:41", "chin", 1);
	}
}
