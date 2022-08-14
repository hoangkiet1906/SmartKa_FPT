package SmartKa.Validators;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import SmartKa.Constants.Constant;
import SmartKa.DAO.UserDAO;
import SmartKa.Model.User;

public class Validators {
	// Check valid email
	public static boolean validEmail(String email) {
		String regex = "^(.+)@(.+)$";
		if (email.matches(regex)) {
			return true;
		}
		return false;
	}
	// Check valid password
	public static boolean validPassword(String password) {
		return password.length()>=6 ? true : false;
	}
	// Check existing user
	public static boolean checkExistingUser(User user) {
		ArrayList<User> users = UserDAO.getAllUsers();
		for (User u : users) {
			if (u.getUser_name().equals(user.getUser_name())) {
				return true;
			}
		}
		return false;
	}
	
	
	// Check phone number valid
	public static boolean validPhoneNumber (String phoneNumber) {
		String regex = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
		if (phoneNumber.matches(regex)) {
			return true;
		}
		return false;
	}
	
	//ktoan
	// Convert Object to JSON String
		public static String convertObjectToJSONString(Object object) throws JsonProcessingException {
			ObjectMapper objectMapper = new ObjectMapper();
			return objectMapper.writeValueAsString(object);
		}
		// Check valid email
		public static boolean isValidEmail(String email) {
			String regex = "^(.+)@(.+)$";
			if (email.matches(regex)) {
				return true;
			}
			return false;
		}
		// Check valid password
		public static boolean isValidPassword(String password) {
			return password.length()>=6 ? true : false;
		}
		// Check confirmation of password
		public static boolean confirmationPassword (String password, String confirmPassword) {
			return confirmPassword.equals(password);
		}
		// Hash password to MD5
		public static String hashPassword(String password) {
			MessageDigest messageDigest;
			String generatePassword = null;
			try {
				messageDigest = MessageDigest.getInstance("MD5");
				messageDigest.update(password.getBytes());
				byte[] bytes = messageDigest.digest();
				StringBuilder stringBuilder = new StringBuilder();
			    for (int i = 0; i < bytes.length; i++) {
			    	stringBuilder.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			    }
			    generatePassword = stringBuilder.toString();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			return generatePassword;
		}
		// Get Current Time
		public static String getCurrentTime() {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, 1);
			Date date = calendar.getTime();
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
			date.setDate(date.getDate()-1);
			return dateFormat.format(date);
		}
		public static String getCurrentDate() {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, 1);
			Date date = calendar.getTime();
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
			date.setDate(date.getDate()-1);
			return dateFormat.format(date);
		}
	
		public static String getCurrentDateMinus(int dayToMinus) {
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE, dayToMinus);
			Date week = cal.getTime();
			SimpleDateFormat dateFormat = new SimpleDateFormat("YYYY-MM-dd");
			return dateFormat.format(week);
		}
		// Check phone number valid
		public static boolean isValidPhoneNumber (String phoneNumber) {
			String regex = "^(0|\\+84)(\\s|\\.)?((3[2-9])|(5[689])|(7[06-9])|(8[1-689])|(9[0-46-9]))(\\d)(\\s|\\.)?(\\d{3})(\\s|\\.)?(\\d{3})$";
			if (phoneNumber.matches(regex)) {
				return true;
			}
			return false;
		}
	public static void main(String[] args) {
		System.out.println(Validators.checkExistingUser(new User("kietba", "toannguyen")));
	}
}