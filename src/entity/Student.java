package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */

public class Student implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String snum;
	private String password;
	private Set achievements = new HashSet(0);
	private Set sdanswers = new HashSet(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String name, String snum, String password) {
		this.name = name;
		this.snum = snum;
		this.password = password;
	}

	/** full constructor */
	public Student(String name, String snum, String password, Set achievements,
			Set sdanswers) {
		this.name = name;
		this.snum = snum;
		this.password = password;
		this.achievements = achievements;
		this.sdanswers = sdanswers;
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

	public String getSnum() {
		return this.snum;
	}

	public void setSnum(String snum) {
		this.snum = snum;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set getAchievements() {
		return this.achievements;
	}

	public void setAchievements(Set achievements) {
		this.achievements = achievements;
	}

	public Set getSdanswers() {
		return this.sdanswers;
	}

	public void setSdanswers(Set sdanswers) {
		this.sdanswers = sdanswers;
	}

}