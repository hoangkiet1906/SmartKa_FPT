package SmartKa.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;import org.springframework.beans.factory.config.TypedStringValue;

import SmartKa.Constants.Constant;
import SmartKa.Model.CateNumber;
import SmartKa.Model.ORProduct;
import SmartKa.Model.Product;
import SmartKa.Model.RevenueChartData;
import SmartKa.Model.User;
import SmartKa.Service.JDBCConnection;
import SmartKa.Validators.Validators;

public class ProductDAO {
	public static Connection connection = new JDBCConnection().conn;
	// -----------------------------------COUNT PRODUCT--------------------------------------
		// count product
			// count all
				public static Integer countProduct() {
					int count = 0;
					try {
						String sql = Constant.COUNT_ALL_PRODUCT;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	count = rs.getInt(1);
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return count;
				}
				
			//
		// end count product
				
				
				
		
	// ------------------------------------GET PRODUCT--------------------------------------
		
		// get product
			// get all product
				public static ArrayList<Product> getAllProduct() {
					ArrayList<Product> list = new ArrayList<Product>();
					try {
						String sql = Constant.GET_ALL_PRODUCT;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	Product bean = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
			           			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
			           			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
			                list.add(bean);
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return list;
				}
				
			// get product per page
				public static ArrayList<Product> getProductPerPage(int page) {
					ArrayList<Product> list = ProductDAO.getAllProduct();
					ArrayList<Product> returnList = new ArrayList<Product>();
					int start, end, size;
					size = Constant.NUMBER_OF_PRODUCT_PER_PAGE;
					start = (page-1)*size;
					end = page*size-1;
					for(int i=start; i<=end; i++) {
						if(i<list.size())
							returnList.add(list.get(i));
					}
					return returnList;
				}
				
			// get product by status
				public static ArrayList<Product> getProductByStatus(String status) {
					ArrayList<Product> list = new ArrayList<Product>();
					try {
						String sql = Constant.GET_PRODUCT_BY_STATUS;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
						ps.setString(1, status);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	Product bean = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
			            			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
			            			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
			                list.add(bean);
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return list;
				}

			// get product by id
				public static Product getProductById(int id) {
					Product product = new Product();
					try {
						String sql = Constant.GET_PRODUCT_BY_ID;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
						ps.setInt(1, id);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
			            			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
			            			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
			                break;
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return product;
				}
		// end get product
				
				

	// ------------------------------------TAG PRODUCT--------------------------------------			
			
		// tag
			// get tag list for homepage ( 1 product / 1 tag )
				public static ArrayList<Product> getProductByTag() {
					ArrayList<Product> list = new ArrayList<Product>();
					ArrayList<String> listTagArrayList = new ArrayList<String>();
					try {
						String sql = Constant.GET_TAG_PRODUCT;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	String bean = rs.getString(1);
			            	listTagArrayList.add(bean);
			            }
			            for (String stringTag : listTagArrayList) {
							try {
								String sql2 = Constant.GET_PRODUCT_BY_TAG_LIMIT;
								PreparedStatement ps2 = new JDBCConnection().conn.prepareStatement(sql2);
								ps2.setString(1, stringTag);
					            ResultSet rs2 = ps2.executeQuery();
					            while(rs2.next()){
					            	Product bean2 = new Product(rs2.getInt(1), rs2.getString(2), rs2.getInt(3),
					            			rs2.getInt(4), rs2.getString(5), rs2.getString(6), rs2.getString(7),
					            			rs2.getInt(8), rs2.getString(9), rs2.getString(10), rs2.getString(11));
					                list.add(bean2);
					            }
			
							} catch (Exception e) {
								// TODO: handle exception
							}
						}
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return list;
				}
				
			// get tag list
				public static ArrayList<CateNumber> getProductTagList(){
					ArrayList<CateNumber> list = new ArrayList<CateNumber>();
					try {
						String sql = Constant.GET_NUMBER_CATE;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	String id = rs.getString(1).replaceAll(" ", "").replaceAll(",", "").replaceAll(".", "");
			            	String name = rs.getString(1);
			            	int quantity = rs.getInt(2);
			            	CateNumber bean = new CateNumber(id, name, quantity);
			            	list.add(bean);
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return list;
				}
		
			// get all product by tag
				public static ArrayList<Product> getAllProductByTag(String tag) {
					ArrayList<Product> list = new ArrayList<Product>();
					try {
						String sql = Constant.GET_PRODUCT_BY_TAG;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
						ps.setString(1, tag);
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
			            			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
			            			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
			                list.add(product);
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return list;
				}
			
			// get product by tag per page
				public static ArrayList<Product> getProductByTagPerPage(String tag, int page) {
					ArrayList<Product> list = ProductDAO.getAllProductByTag(tag);
					ArrayList<Product> listReturn = new ArrayList<Product>();
					
					int start, end, size;
					size = Constant.NUMBER_OF_PRODUCT_PER_PAGE;
					start = (page-1)*size;
					end = page*size-1;
					
					for(int i=start; i<=end; i++) {
						if(i<list.size())
							listReturn.add(list.get(i));
					}
					
					return listReturn;
				}
		// end tag
			
				
				
	// ----------------------------------SEARCH PRODUCT--------------------------------------
		// search
			// get all search product
				public static ArrayList<Product> getAllSearchProduct(String key) {
					ArrayList<Product> list = new ArrayList<Product>();
					try {
						String sql = Constant.SEARCH_PRODUCT;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(sql);
						ps.setString(1, "%"+key+"%");
			            ResultSet rs = ps.executeQuery();
			            while(rs.next()){
			            	Product product = new Product(rs.getInt(1), rs.getString(2), rs.getInt(3),
			            			 rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7),
			            			 rs.getInt(8), rs.getString(9), rs.getString(10), rs.getString(11));
			                list.add(product);
			            }
					} catch (Exception e) {
						// TODO: handle exception
						e.printStackTrace();
					}
					return list;
				}
			
			// get search product per page
				public static ArrayList<Product> getSearchProductPerPage(String key, int page) {
					ArrayList<Product> list = ProductDAO.getAllSearchProduct(key);
					ArrayList<Product> returnList = new ArrayList<Product>();
					int start, end, size;
					size = Constant.NUMBER_OF_PRODUCT_PER_PAGE;
					start = (page-1)*size;
					end = page*size-1;
					for(int i=start; i<=end; i++) {
						if(i<list.size())
							returnList.add(list.get(i));
					}
					return returnList;
				}
		// end search
				//lviet code
				public static ArrayList<ORProduct> getRevenueMng() {
					ArrayList<ORProduct> ORPlist = new ArrayList<ORProduct>();
					try {
						String query = Constant.GET_OUTSTANDING_REVENUE;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							ORProduct bean = new ORProduct(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
									rs.getInt(3) * rs.getInt(4));
							ORPlist.add(bean);
						}

					} catch (Exception e) {
						// TODO: handle exception
					}
					return ORPlist;
				}

				public static ArrayList<ORProduct> getRarelyBought() {
					ArrayList<ORProduct> RBlist = new ArrayList<ORProduct>();
					try {
						String query = Constant.GET_RARELY_BOUGHT_PRODUCT;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							ORProduct bean = new ORProduct(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4),
									rs.getInt(3) * rs.getInt(4));
							RBlist.add(bean);
						}
					} catch (Exception e) {
						// TODO: handle exception
					}
					return RBlist;
				}

				public static ArrayList<RevenueChartData> getWeeklyChartData(String firstdate, String seconddate) {
					ArrayList<RevenueChartData> chartdata = new ArrayList<RevenueChartData>();
					try {
						String day1 = Validators.getCurrentDateMinus(0);
						String day2 = Validators.getCurrentDateMinus(-1);
						String day3 = Validators.getCurrentDateMinus(-2);
						String day4 = Validators.getCurrentDateMinus(-3);
						String day5 = Validators.getCurrentDateMinus(-4);
						String day6 = Validators.getCurrentDateMinus(-5);
						String day7 = Validators.getCurrentDateMinus(-6);
						RevenueChartData data1 = new RevenueChartData(0, day1);
						RevenueChartData data2 = new RevenueChartData(0, day2);
						RevenueChartData data3 = new RevenueChartData(0, day3);
						RevenueChartData data4 = new RevenueChartData(0, day4);
						RevenueChartData data5 = new RevenueChartData(0, day5);
						RevenueChartData data6 = new RevenueChartData(0, day6);
						RevenueChartData data7 = new RevenueChartData(0, day7);
						chartdata.add(data1);
						chartdata.add(data2);
						chartdata.add(data3);
						chartdata.add(data4);
						chartdata.add(data5);
						chartdata.add(data6);
						chartdata.add(data7);
						String query = Constant.GET_TOTAL_MONEY_WEEKLY;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
						ps.setString(1, firstdate);
						ps.setString(2, seconddate);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							for (int i = 0; i < chartdata.size(); i++) {
								if (rs.getString(2).equals(chartdata.get(i).getDateCO())) {
									chartdata.get(i).setTotalmoney(rs.getInt(1));
								} 

							}

						}

					} catch (Exception e) {
						// TODO: handle exception
					}
					return chartdata;
				}	
				public static ArrayList<RevenueChartData> getPrevWeeklyChartData(String firstdate, String seconddate) {
					ArrayList<RevenueChartData> chartdata = new ArrayList<RevenueChartData>();
					try {
						String day1 = Validators.getCurrentDateMinus(-7);
						String day2 = Validators.getCurrentDateMinus(-8);
						String day3 = Validators.getCurrentDateMinus(-9);
						String day4 = Validators.getCurrentDateMinus(-10);
						String day5 = Validators.getCurrentDateMinus(-11);
						String day6 = Validators.getCurrentDateMinus(-12);
						String day7 = Validators.getCurrentDateMinus(-13);
						RevenueChartData data1 = new RevenueChartData(0, day1);
						RevenueChartData data2 = new RevenueChartData(0, day2);
						RevenueChartData data3 = new RevenueChartData(0, day3);
						RevenueChartData data4 = new RevenueChartData(0, day4);
						RevenueChartData data5 = new RevenueChartData(0, day5);
						RevenueChartData data6 = new RevenueChartData(0, day6);
						RevenueChartData data7 = new RevenueChartData(0, day7);
						chartdata.add(data1);
						chartdata.add(data2);
						chartdata.add(data3);
						chartdata.add(data4);
						chartdata.add(data5);
						chartdata.add(data6);
						chartdata.add(data7);
						String query = Constant.GET_TOTAL_MONEY_WEEKLY;
						PreparedStatement ps = new JDBCConnection().conn.prepareStatement(query);
						ps.setString(1, firstdate);
						ps.setString(2, seconddate);
						ResultSet rs = ps.executeQuery();
						while (rs.next()) {
							for (int i = 0; i < chartdata.size(); i++) {
								if (rs.getString(2).equals(chartdata.get(i).getDateCO())) {
									chartdata.get(i).setTotalmoney(rs.getInt(1));
								} 

							}

						}

					} catch (Exception e) {
						// TODO: handle exception
					}
					return chartdata;
				}
				public static int CalculatingRevenue() {
					int grownrate = 0;	
					float totalMoney = 0;
					float totalMoneyprev = 0;
					ArrayList<RevenueChartData> weekData = ProductDAO.getWeeklyChartData(Validators.getCurrentDateMinus(-7), Validators.getCurrentDateMinus(0));
					for(int i=0;i< weekData.size();i++) {
						totalMoney += weekData.get(i).getTotalmoney();
					}
					ArrayList<RevenueChartData> prevWeekData = ProductDAO.getPrevWeeklyChartData(Validators.getCurrentDateMinus(-14), Validators.getCurrentDateMinus(7));
					for(int i=0;i< prevWeekData.size();i++) {
						totalMoneyprev += prevWeekData.get(i).getTotalmoney();
					}
					System.out.println(totalMoney);
					System.out.println(totalMoneyprev);
					grownrate =(int)((((totalMoney/totalMoneyprev)*100)-100));
					return grownrate;
				}
				public static int TotalWeek() {
					int totalMoney = 0;
					ArrayList<RevenueChartData> weekData = ProductDAO.getWeeklyChartData(Validators.getCurrentDateMinus(-7), Validators.getCurrentDateMinus(0));
					for(int i=0;i< weekData.size();i++) {
						totalMoney += weekData.get(i).getTotalmoney();
					}
					return totalMoney;
				}
				// product maga of Jin
				public static void updateProduct(int id, String name, int price, int quantity, String img, String des, String tag,
						String status) {
					try {
						String updateQuery = Constant.UPDATE_PRODUCT;
						PreparedStatement ps = ProductDAO.connection.prepareStatement(updateQuery);
						ps.setString(1, name);
						ps.setInt(2, price);
						ps.setInt(3, quantity);
						ps.setString(4, img);
						ps.setString(5, des);
						ps.setString(6, tag);
						ps.setString(7, status);
						ps.setInt(8, id);
						ps.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}

				public static void updateProductNotImg(int id, String name, int price, int quantity, String des, String tag,
						String status) {
					try {
						String updateQuery = Constant.UPDATE_PRODUCT_NOT_IMG;
						PreparedStatement ps = ProductDAO.connection.prepareStatement(updateQuery);
						ps.setString(1, name);
						ps.setInt(2, price);
						ps.setInt(3, quantity);
						ps.setString(4, des);
						ps.setString(5, tag);
						ps.setString(6, status);
						ps.setInt(7, id);
						ps.executeUpdate();
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}

				public static int getIdLastProduct() {
					int count = 0;
					try {
						String sql = Constant.GET_ID_LAST_PRODUCT;
						PreparedStatement ps =ProductDAO.connection.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						while(rs.next()) {
							count = rs.getInt(1);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} 
					return count;
				}

				public static void deleteProduct(int id) {
					try {
						String updateQuery = Constant.DELETE_PRODUCT;
						PreparedStatement ps = ProductDAO.connection.prepareStatement(updateQuery);
						ps.setInt(1, id);
						ps.execute();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

				public static void insertProduct(int id, String name, int price, int quantity, String img, String des, String tag,
						String status) {

					try {
						String sql = Constant.INSERT_PRODUCT;
						PreparedStatement ps = ProductDAO.connection.prepareStatement(sql);
						ps.setInt(1, id);
						ps.setString(2, name);
						ps.setInt(3, price);
						ps.setInt(4, quantity);
						ps.setString(5, img);
						ps.setString(6, des);
						ps.setString(7, tag);
						ps.setString(8, status);
						ps.execute();
					} catch (SQLException e) {
						e.printStackTrace();
					}

				}
	
	public static void main(String[] args) {
	
		

	}
}