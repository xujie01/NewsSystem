package magicgis.newssystem.models;

import java.util.Date;

public class User extends BaseEntity {

	private static final long serialVersionUID = 6923757046786572615L;
	private String username;
	private String password;
	private String email;
	private Date createTime = new Date();

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
