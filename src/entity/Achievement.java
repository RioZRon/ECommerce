package entity;

/**
 * Achievement entity. @author MyEclipse Persistence Tools
 */

public class Achievement implements java.io.Serializable {

	// Fields

	private Integer id;
	private Teacher teacher;
	private Student student;
	private Subject subject;
	private String achievement;
	private Integer sign;

	// Constructors

	/** default constructor */
	public Achievement() {
	}

	/** full constructor */
	public Achievement(Teacher teacher, Student student, Subject subject,
			String achievement, Integer sign) {
		this.teacher = teacher;
		this.student = student;
		this.subject = subject;
		this.achievement = achievement;
		this.sign = sign;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Teacher getTeacher() {
		return this.teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public String getAchievement() {
		return this.achievement;
	}

	public void setAchievement(String achievement) {
		this.achievement = achievement;
	}

	public Integer getSign() {
		return this.sign;
	}

	public void setSign(Integer sign) {
		this.sign = sign;
	}

}