package entity;

/**
 * Questions entity. @author MyEclipse Persistence Tools
 */

public class Questions implements java.io.Serializable {

	// Fields

	private Integer id;
	private Dhnr dhnr;
	private Subject subject;
	private String title;
	private String choise;
	private String type;
	private Integer score;
	private String answer;
	private Integer sequence;

	// Constructors

	/** default constructor */
	public Questions() {
	}

	/** full constructor */
	public Questions(Dhnr dhnr, Subject subject, String title, String choise,
			String type, Integer score, String answer, Integer sequence) {
		this.dhnr = dhnr;
		this.subject = subject;
		this.title = title;
		this.choise = choise;
		this.type = type;
		this.score = score;
		this.answer = answer;
		this.sequence = sequence;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Dhnr getDhnr() {
		return this.dhnr;
	}

	public void setDhnr(Dhnr dhnr) {
		this.dhnr = dhnr;
	}

	public Subject getSubject() {
		return this.subject;
	}

	public void setSubject(Subject subject) {
		this.subject = subject;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getChoise() {
		return this.choise;
	}

	public void setChoise(String choise) {
		this.choise = choise;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Integer getSequence() {
		return this.sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
	}

}