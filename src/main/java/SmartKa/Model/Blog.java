package SmartKa.Model;

import java.time.format.DateTimeFormatter;
import java.util.Date;

public class Blog {
	int idblog;
	String title;
	String author;
	String content;
	String date;
	String image;
	String tag;
	String status;
	String ct1;
	String ct2;
	String ct3;
	String img1;
	String img2;
	String day;
	String month;
	String year;
	public Blog(int idblog, String title, String author, String content, String date, String image, String tag, String status, String ct1, String ct2, String ct3, String img1, String img2,String day, String month, String year) {
		super();
		this.idblog = idblog;
		this.title = title;
		this.author = author;
		this.content = content;
		this.date = date;
		this.image = image;
		this.tag = tag;
		this.status = status;
		this.ct1 = ct1;
		this.ct2 = ct2;
		this.ct3 = ct3;
		this.img1 = img1;
		this.img2 = img2;
		this.day= day;
		this.month = month;
		this.year = year;
		
	}
	public int getIdblog() {
		return idblog;
	}
	public void setIdblog(int idblog) {
		this.idblog = idblog;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCt1() {
		return ct1;
	}
	public void setCt1(String ct1) {
		this.ct1 = ct1;
	}
	public String getCt2() {
		return ct2;
	}
	public void setCt2(String ct2) {
		this.ct2 = ct2;
	}
	public String getCt3() {
		return ct3;
	}
	public void setCt3(String ct3) {
		this.ct3 = ct3;
	}
	public String getImg1() {
		return img1;
	}
	public void setImg1(String img1) {
		this.img1 = img1;
	}
	public String getImg2() {
		return img2;
	}
	public void setImg2(String img2) {
		this.img2 = img2;
	}
	public String getDay() {
		return day;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public Blog(int idblog, String title, String author, String content, String date, String image, String tag,
			String status, String ct1, String ct2, String ct3, String img1, String img2) {
		super();
		this.idblog = idblog;
		this.title = title;
		this.author = author;
		this.content = content;
		this.date = date;
		this.image = image;
		this.tag = tag;
		this.status = status;
		this.ct1 = ct1;
		this.ct2 = ct2;
		this.ct3 = ct3;
		this.img1 = img1;
		this.img2 = img2;
	}
	@Override
	public String toString() {
		return "ID: "+idblog+", title:"+ title +", author: " + author +", content: "+content+", date: "+date+", image: "+image+", tag: "+tag+", status: "+status+", ct1: "+ct1+", ct2: "+ct2+", ct3: "+ct3+", img1: "+img1+", img2: "+img2+", day: "+day+", month: " +month+", year: "+ year+ "\n";
	}
}
	