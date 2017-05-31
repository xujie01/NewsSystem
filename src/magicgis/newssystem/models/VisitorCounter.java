package magicgis.newssystem.models;

import java.util.Date;

public class VisitorCounter extends BaseEntity{
	
	private static final long serialVersionUID = -4862720355704098697L;
	private String ipAddress;
	private Date createTime;
	private User user;
	private News news;
	
	public VisitorCounter() {
		
	}
	
	public VisitorCounter(String ipAddress, Date createTime,
			User user, News news) {
		this.ipAddress = ipAddress;
		this.createTime = createTime;
		this.user = user;
		this.news = news;
	}
	
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	
}
