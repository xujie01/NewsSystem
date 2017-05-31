package magicgis.newssystem.models.security;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import magicgis.newssystem.models.BaseEntity;

public class Admin extends BaseEntity {

	private static final long serialVersionUID = -2754043214810493011L;
	// 用户名
	private String username;
	// 密码
	private String password;
	// Email
	private String email;
	// 是否启用
	private boolean enabled;
	// 连续登录失败次数
	private Integer loginFailureCount;
	// 锁定日期
	private Date lockedTime;
	// 最后登录日期
	private Date loginTime;
	// 最后登录IP
	private String ipAddress;
	// 创建时间
	private Date createTime = new Date();
	// 拥有的权限
	private Set<Role> roles = new HashSet<Role>();
	// 权限总和
	private long[] rightSum;

	public Integer getLoginFailureCount() {
		return loginFailureCount;
	}

	public void setLoginFailureCount(Integer loginFailureCount) {
		this.loginFailureCount = loginFailureCount;
	}

	public Date getLockedTime() {
		return lockedTime;
	}

	public void setLockedTime(Date lockedTime) {
		this.lockedTime = lockedTime;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

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

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public long[] getRightSum() {
		return rightSum;
	}

	public void setRightSum(long[] rightSum) {
		this.rightSum = rightSum;
	}

	/**
	 * 判断用户是否具有指定权限
	 */
	public boolean hasRight(Right r) {
		int pos = r.getRightPos();
		long code = r.getRightCode();
		return !((rightSum[pos] & code) == 0);//如果相对应位都是1，则结果为1，否则为0
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	/**
	 * 计算用户权限总和
	 */
	public void calculateRightSum() {
		int pos = 0;
		long code = 0;
		for (Role role : roles) {
			for (Right r : role.getRights()) {
				pos = r.getRightPos();
				code = r.getRightCode();
				rightSum[pos] = rightSum[pos] | code;//位运算符，如果相对应位都是0，则结果为0，否则为1
			}
		}
		// 释放资源
		roles = null;
	}

}
