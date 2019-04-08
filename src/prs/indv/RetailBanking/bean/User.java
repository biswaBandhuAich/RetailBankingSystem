package prs.indv.RetailBanking.bean;

public class User {
	private String userName;
	private String password;
	private String userType;
	private String Name;
	private String securityQuestion;
	private String answer;
	private String email;
	public User(String userName, String password, String userType, String name, String securityQuestion, String answer,
			String email) {
		super();
		this.userName = userName;
		this.password = password;
		this.userType = userType;
		Name = name;
		this.securityQuestion = securityQuestion;
		this.answer = answer;
		this.email = email;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getSecurityQuestion() {
		return securityQuestion;
	}
	public void setSecurityQuestion(String securityQuestion) {
		this.securityQuestion = securityQuestion;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
