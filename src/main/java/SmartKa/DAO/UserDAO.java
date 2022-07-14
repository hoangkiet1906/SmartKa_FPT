package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import SmartKa.Model.User;
import SmartKa.Service.JDBCConnection;

public class UserDAO {
	public ArrayList<User> getUser(){
		ArrayList<User> list = new ArrayList<User>();
		try {	
			String sql = "Select * from user";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	User bean = new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(bean);
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public static void main(String[] args) {
		System.out.println(new UserDAO().getUser().toString());

	}
}
