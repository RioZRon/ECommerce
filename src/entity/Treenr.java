package entity;

/**
 * Treenr entity. @author MyEclipse Persistence Tools
 */

public class Treenr implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String name;
	private String time;
	private String count;
	private String text;
	private Integer tid;

	// Constructors

	/** default constructor */
	public Treenr() {
	}

	/** minimal constructor */
	public Treenr(String title, Integer tid) {
		this.title = title;
		this.tid = tid;
	}

	/** full constructor */
	public Treenr(String title, String name, String time, String count,
			String text, Integer tid) {
		this.title = title;
		this.name = name;
		this.time = time;
		this.count = count;
		this.text = text;
		this.tid = tid;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getCount() {
		return this.count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Integer getTid() {
		return this.tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

}