package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import SmartKa.Constants.Constant;
import SmartKa.Model.Support;
import SmartKa.Model.User;
import SmartKa.Service.JDBCConnection;

public class SupportDAO {
	public static Connection connection = new JDBCConnection().conn;
	public static ArrayList<Support> getAllSp() {
		ArrayList<Support> sp = new ArrayList<Support>();
		try {	
			String sql = Constant.GET_ALL_SUPPORT;
			PreparedStatement ps = UserDAO.connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	Support a = new Support(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4),rs.getString(7));
            	sp.add(a);
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sp;
	}
	public static void main(String[] args) {
		System.out.println(SupportDAO.getAllSp());
	}
}
