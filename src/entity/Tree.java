package entity;

/**
 * Tree entity. @author MyEclipse Persistence Tools
 */

public class Tree implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String url;
	private Integer pid;
	private String isparent;
	private String dan;
	private String encrypt;
	private Integer num;

	// Constructors

	/** default constructor */
	public Tree() {
	}

	/** minimal constructor */
	public Tree(String name, Integer pid) {
		this.name = name;
		this.pid = pid;
	}

	/** full constructor */
	public Tree(String name, String url, Integer pid, String isparent,
			String dan, String encrypt, Integer num) {
		this.name = name;
		this.url = url;
		this.pid = pid;
		this.isparent = isparent;
		this.dan = dan;
		this.encrypt = encrypt;
		this.num = num;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getPid() {
		return this.pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getIsparent() {
		return this.isparent;
	}

	public void setIsparent(String isparent) {
		this.isparent = isparent;
	}

	public String getDan() {
		return this.dan;
	}

	public void setDan(String dan) {
		this.dan = dan;
	}

	public String getEncrypt() {
		return this.encrypt;
	}

	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

}