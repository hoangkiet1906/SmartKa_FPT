package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import SmartKa.Constants.Constant;
import SmartKa.Model.Order;
import SmartKa.Model.Work;
import SmartKa.Service.JDBCConnection;

public class WorkDAO {
	public static Connection connection = new JDBCConnection().conn;

	public static void save(Work work) {
		String query = Constant.SAVE_WORK_QUERY;
		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, work.getStaff_name());
			ps.setInt(2, work.getOrder().getId());
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static ArrayList<Work> getWorkByStaffNameAndStatus(String staffname, String status) {
		ArrayList<Work> arrayList = new ArrayList<Work>();

		String query = Constant.GET_WORKS_BY_STATUS_AND_NAME_QUERY;

		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, status);
			ps.setString(2, staffname);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				arrayList.add(new Work(rs.getInt(1), rs.getString(2),
						new Order(rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getString(7),
								rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12),
								rs.getString(13))));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return arrayList;
	}

	public static ArrayList<Work> getWorkByStatus(String status) {
		ArrayList<Work> arrayList = new ArrayList<Work>();

		String query = Constant.GET_WORKS_BY_STATUS_QUERY;

		try {
			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, status);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				arrayList.add(new Work(rs.getInt(1), rs.getString(2),
						new Order(rs.getInt(3), rs.getString(4), rs.getString(5), rs.getDouble(6), rs.getString(7),
								rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12),
								rs.getString(13))));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return arrayList;
	}

	public static void main(String[] args) {
		System.out.println(getWorkByStaffNameAndStatus("kietbocvac", "Processing").toString());
	}
}