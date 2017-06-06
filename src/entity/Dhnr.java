package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Dhnr entity. @author MyEclipse Persistence Tools
 */

public class Dhnr implements java.io.Serializable {

	// Fields

	private Integer id;
	private String title;
	private String img;
	private String name;
	private String time;
	private Integer count;
	private String text;
	private String features;
	private String encrypt;
	private Integer hid;
	private String istest;
	private Set questionses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Dhnr() {
	}

	/** minimal constructor */
	public Dhnr(Integer hid) {
		this.hid = hid;
	}

	/** full constructor */
	public Dhnr(String title, String img, String name, String time,
			Integer count, String text, String features, String encrypt,
			Integer hid, String istest, Set questionses) {
		this.title = title;
		this.img = img;
		this.name = name;
		this.time = time;
		this.count = count;
		this.text = text;
		this.features = features;
		this.encrypt = encrypt;
		this.hid = hid;
		this.istest = istest;
		this.questionses = questionses;
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

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public Integer getCount() {
		return this.count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getFeatures() {
		return this.features;
	}

	public void setFeatures(String features) {
		this.features = features;
	}

	public String getEncrypt() {
		return this.encrypt;
	}

	public void setEncrypt(String encrypt) {
		this.encrypt = encrypt;
	}

	public Integer getHid() {
		return this.hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public String getIstest() {
		return this.istest;
	}

	public void setIstest(String istest) {
		this.istest = istest;
	}

	public Set getQuestionses() {
		return this.questionses;
	}

	public void setQuestionses(Set questionses) {
		this.questionses = questionses;
	}

}