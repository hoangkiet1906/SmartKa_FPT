package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.print.attribute.standard.DateTimeAtCompleted;

import SmartKa.Constants.Constant;
import SmartKa.Model.Blog;
import SmartKa.Service.JDBCConnection;

public class BlogDAO {
	public static Connection connection = new JDBCConnection().conn;
	
	public static Date fdate;
	public static String getNOBlog() {
		String noblog = null;
		try {
			String query = Constant.GET_NUMBER_OF_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				noblog = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return noblog;
	}
	public static ArrayList getBlogTag() {
		ArrayList blogTag = new ArrayList();
		try {
			String query = Constant.GET_ALL_BLOG_TAG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				blogTag.add(rs.getString(1));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return blogTag;
	}
	public static String getNOBlogTag(String tag) {
		String noblogtag = null;
		try {
			String query = Constant.GET_NO_BLOG_BY_TAG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ps.setString(1, tag);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				noblogtag = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return noblogtag;
	}
	public static String getNOBlogSearched(String key) {
		String noblogsearched = null;
		try {
			String query = Constant.COUNT_SEARCHED_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ps.setString(1, "%"+key+"%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				noblogsearched = rs.getString(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return noblogsearched;
	}
	public static ArrayList<Blog> getBlogByTag(String tag, int start, int end) {
		Blog sblog = null;
		ArrayList<Blog> tagResult = new ArrayList<Blog>();
		try {
			String query = Constant.GET_BLOG_BY_TAG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ps.setString(1, tag);
			ps.setInt(2, start-1);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);				
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),day,month, year);
				tagResult.add(sblog);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return tagResult;
	}
	
	public static ArrayList<Blog> getAllBlog() {

		ArrayList<Blog> blogList = new ArrayList<Blog>();
		try {
			String query = Constant.GET_ALL_BLOG_QUERY;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//format date
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);				
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				Blog sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),day,month, year);
				blogList.add(sblog);
			
			}
		} catch (Exception e) {
			
		}
		return blogList;
	}
	
	
	public static ArrayList<Blog> getAllBlogAdmin() {

		ArrayList<Blog> blogList = new ArrayList<Blog>();
		try {
			String query = Constant.GET_ALL_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//format date
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);				
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				Blog sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),day,month, year);
				blogList.add(sblog);
			
			}
		} catch (Exception e) {
			
		}
		return blogList;
	}
	
	public static ArrayList<Blog> getBlog(int first, int end) {

		ArrayList<Blog> blogList = new ArrayList<Blog>();
		try {
			String query = Constant.GET_BLOG_PER_PAGE;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ps.setInt(1, first-1);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//format date
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);				
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				Blog sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),day,month, year);
				blogList.add(sblog);
			
			}
		} catch (Exception e) {
			
		}
		return blogList;
	}
	public static Blog getBlogByID(int blogid) {
		Blog sblog = null;
		try {
			String query = Constant.GET_BLOG_BY_ID_QUERY;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ps.setInt(1, blogid);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), fdate, rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13), day, month, year);
				break;
			}
		} 
		catch (Exception e) {
			// TODO: handle exception
		}
		return sblog;
	}
	public static ArrayList<Blog> getLatestBlog() {
		ArrayList<Blog> latestBlog = new ArrayList<Blog>();
		try {
			String query = Constant.GET_LATEST_2_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//format date
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);				
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				Blog sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),day,month, year);
				latestBlog.add(sblog);
			
			}
		} catch (Exception e) {
			
		}
		return latestBlog;
	}
	public static ArrayList<Blog> getsearchBlog(String keytxt, int first, int end) {
		ArrayList<Blog> resultBlog = new ArrayList<Blog>();
		try {
			String query = Constant.SEARCH_BLOG_BY_NAME;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(query);
			ps.setString(1, "%"+keytxt+"%");
			ps.setInt(2, first-1);
			ps.setInt(3, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				//format date
				Date date=rs.getDate(5); 
				SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy");
				String fdate = formatter.format(date);				
				String day = String.valueOf(fdate.charAt(0)+String.valueOf(fdate.charAt(1)));
				String month = String.valueOf(fdate.charAt(3)+String.valueOf(fdate.charAt(4)+String.valueOf(fdate.charAt(5))));
				String year = String.valueOf(fdate.charAt(7)+String.valueOf(fdate.charAt(8)+String.valueOf(fdate.charAt(9)+String.valueOf(fdate.charAt(10)))));
				Blog sblog = new Blog(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12), rs.getString(13),day,month, year);
				resultBlog.add(sblog);
			
			}
		} catch (Exception e) {
			
		}
		return resultBlog;
	}
	
	
	public static String updateBlog(int id, String title, String content, String img, String tag, String ct1, String ct2, String ct3, String img1, String img2 ) {
		try {
			String updateQuery = Constant.UPDATE_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(updateQuery);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, img);
			ps.setString(4, tag);
			ps.setString(5, ct1);
			ps.setString(6, ct2);
			ps.setString(7, ct3);
			ps.setString(8, img1);
			ps.setString(9, img2);
			ps.setInt(10, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Update blog successfully!";
	}

	public static String updateBlogNotImg(int id, String title, String content, String tag, String ct1, String ct2, String ct3 ) {
		try {
			String updateQuery = Constant.UPDATE_BLOG_NOT_IMG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(updateQuery);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, tag);
			ps.setString(4, ct1);
			ps.setString(5, ct2);
			ps.setString(6, ct3);
			ps.setInt(7, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "Update blog successfully!";
	}

	public static void updateStatusBlog(String status, int id ) {
		try {
			String updateQuery = Constant.UPDATE_STATUS_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(updateQuery);
			ps.setString(1, status);
			ps.setInt(2, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static String DeleteBlogbyId(int id ) {
		try {
			String updateQuery = Constant.DELETE_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(updateQuery);
			ps.setInt(1, id);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "delete sucessfully!";
	}

	public static String getBlogStatus(int id) {
		String status = "";
		try {
			String sql = Constant.SELECT_BLOG_STATUS;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				status = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return status;
	}

	public static int countBlog() {
		int count = 0;
		try {
			String sql = Constant.COUNT_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return count;
	}

	public static void insertBlog(int id, String title, String author, String ct, String date, String img, String tag,
			String ct1, String ct2, String ct3, String img1, String img2) {

		try {
			String sql = Constant.INSERT_BLOG;
			PreparedStatement ps = BlogDAO.connection.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, title);
			ps.setString(3, author);
			ps.setString(4, ct);
			ps.setString(5, date);
			ps.setString(6, img);
			ps.setString(7, tag);
			ps.setString(8, ct1);
			ps.setString(9, ct2);
			ps.setString(10, ct3);
			ps.setString(11, img1);
			ps.setString(12, img2);
			ps.execute();
		}catch (SQLException e) {
			e.printStackTrace();
		}

	}
	public static void main(String[] args) {
		System.out.println(BlogDAO.getBlogByID(1+1));
	}
}

