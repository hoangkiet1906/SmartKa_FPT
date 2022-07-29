package SmartKa.Model;

import java.util.ArrayList;

public class BlogControl {
	ArrayList<Blog> blogList;
	int noPage;
	public BlogControl(ArrayList<Blog> blogList, int noPage) {
		super();
		this.blogList = blogList;
		this.noPage = noPage;
	}
	public ArrayList<Blog> getBlogList() {
		return blogList;
	}
	public void setBlogList(ArrayList<Blog> blogList) {
		this.blogList = blogList;
	}
	public int getNoPage() {
		return noPage;
	}
	public void setNoPage(int noPage) {
		this.noPage = noPage;
	}
	@Override
	public String toString() {
		return "BlogControl [blogList=" + blogList + ", noPage=" + noPage + "]";
	}
	
}
