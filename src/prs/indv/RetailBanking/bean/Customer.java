package prs.indv.RetailBanking.bean;



public class Customer {

	
	private String customerSSN;
	private String customerId;
	private String FirstName;
	private String MiddleName;
	private String LastName;
	
	private int age;
	private String addressLine1;
	private String addressLine2;
	private String city;
	private String state;
	private Account account = new Account();
	private String gender;
	private String number;
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public Account getAccount() {
		return account;
	}
	public void setAccount(Account account) {
		this.account = account;
	}
	
	public String getCustomerSSN() {
		return customerSSN;
	}
	public void setCustomerSSN(String customerSSN) {
		this.customerSSN = customerSSN;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getMiddleName() {
		return MiddleName;
	}
	public void setMiddleName(String middleName) {
		MiddleName = middleName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddressLine1() {
		return addressLine1;
	}
	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}
	public String getAddressLine2() {
		return addressLine2;
	}
	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Customer(String customerSSN, String customerId, String firstName, String middleName, String lastName,
			int age, String addressLine1, String addressLine2, String city, String state, Account account) {
		super();
		this.customerSSN = customerSSN;
		this.customerId = customerId;
		FirstName = firstName;
		MiddleName = middleName;
		LastName = lastName;
		this.age = age;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.city = city;
		this.state = state;
		this.account = account;
	}
	

	
	


	
}