package entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Subject entity. @author MyEclipse Persistence Tools
 */

public class Subject implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Integer score;
	private Integer time;
	private Set achievements = new HashSet(0);
	private Set questionses = new HashSet(0);

	// Constructors

	/** default constructor */
	public Subject() {
	}

	/** full constructor */
	public Subject(String name, Integer score, Integer time, Set achievements,
			Set questionses) {
		this.name = name;
		this.score = score;
		this.time = time;
		this.achievements = achievements;
		this.questionses = questionses;
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

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getTime() {
		return this.time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	public Set getAchievements() {
		return this.achievements;
	}

	public void setAchievements(Set achievements) {
		this.achievements = achievements;
	}

	public Set getQuestionses() {
		return this.questionses;
	}

	public void setQuestionses(Set questionses) {
		this.questionses = questionses;
	}

}