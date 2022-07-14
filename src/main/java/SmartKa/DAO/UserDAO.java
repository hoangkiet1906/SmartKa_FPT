package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.spi.DirStateFactory.Result;

import SmartKa.Model.User;
import SmartKa.Model.UserInfo;
import SmartKa.Service.JDBCConnection;

public class UserDAO {
	public ArrayList<User> getUser(){
		ArrayList<User> list = new ArrayList<User>();
		try {	
			String sql = "Select * from account";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	User bean = new User(rs.getString(1), rs.getString(2), rs.getString(3));
                list.add(bean);
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public UserInfo getUserInfo(String sessionuser) {
		UserInfo sessionui = null;		
		try {
			String sql = "select * from info where user_name= "+"'"+sessionuser +"'";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				sessionui = new UserInfo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				break;
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return sessionui;
	}
	public String addUserInfo() {
		String uname = "testname";
		String uavatar = "testurl";
		String uphone = "testphone";
		String uemail = "Testmail";
		String uadd="addresst";
		String udadd = "asdlxjv";
		String uuname = "bjviet";
		try {
			String addquery = "insert into info(fullname,avatar,phone,email,address,deliveryaddress,user_name)"
					+ "values('"+uname+"','"+uavatar+"','"+uphone+"','"+uemail+"','"+uadd+"','"+udadd+"','"+uuname+"')";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(addquery);
			ps.execute();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "add success";
	}
	public String updateUserInfo(int userid) {
		String uname = "testname2";
		String uavatar = "testurl2";
		String uphone = "testphone2";
		String uemail = "Testmail2";
		String uadd="testaddresst2";
		String udadd = "testasdlxjv2";
		String uuname = "testbjvie2t2";
		try {
			String addquery = "update info set fullname ='"+ uname +"', avatar='"+uavatar+"', phone='"+uphone+"', email='"+uemail+"', address='"+uadd+"', deliveryaddress='"+udadd+"', user_name='"+uuname+"' where id = "+ userid+";";
			PreparedStatement ps = new JDBCConnection().conn.prepareStatement(addquery);
			ps.execute();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "update success";
	}
	public static void main(String[] args) {
//		new UserDAO().getUserInfo("kietba").toString();
		System.out.println(new UserDAO().updateUserInfo(12));
	}
}
