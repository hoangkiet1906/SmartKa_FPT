package SmartKa.Model;

public class CmtModel {

	private String content;
	private String date;
	private String username;
	private String avt;
	public CmtModel(String content, String date, String username, String avt) {
		super();
		this.content = content;
		this.date = date;
		this.username = username;
		this.avt = avt;
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
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAvt() {
		return avt;
	}
	public void setAvt(String avt) {
		this.avt = avt;
	}
	@Override
	public String toString() {
		return "CmtProductModel [content=" + content + ", date=" + date + ", username=" + username + ", avt=" + avt
				+ "]";
	}
	
	
}
