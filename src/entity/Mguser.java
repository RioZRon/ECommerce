package entity;

/**
 * Mguser entity. @author MyEclipse Persistence Tools
 */

public class Mguser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String users;
	private String pwd;
	private String name;
	private String num;
	private String admin;

	// Constructors

	/** default constructor */
	public Mguser() {
	}

	/** full constructor */
	public Mguser(String users, String pwd, String name, String num,
			String admin) {
		this.users = users;
		this.pwd = pwd;
		this.name = name;
		this.num = num;
		this.admin = admin;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsers() {
		return this.users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNum() {
		return this.num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getAdmin() {
		return this.admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

}