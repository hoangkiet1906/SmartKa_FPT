package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;

import SmartKa.Constants.Constant;
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
}
