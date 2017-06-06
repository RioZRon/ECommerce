package entity;

/**
 * Sdanswer entity. @author MyEclipse Persistence Tools
 */

public class Sdanswer implements java.io.Serializable {

	// Fields

	private Integer id;
	private Student student;
	private Integer qid;
	private String answer;
	private Integer score;

	// Constructors

	/** default constructor */
	public Sdanswer() {
	}

	/** full constructor */
	public Sdanswer(Student student, Integer qid, String answer, Integer score) {
		this.student = student;
		this.qid = qid;
		this.answer = answer;
		this.score = score;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Integer getQid() {
		return this.qid;
	}

	public void setQid(Integer qid) {
		this.qid = qid;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}