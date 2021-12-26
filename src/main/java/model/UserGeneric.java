package model;

public class UserGeneric {
	private String mail;
	private String name;
	private int age;
	private String city;
	private String country;
	private int numberOfOrder;
	private float totalPayment;
	
	public UserGeneric() {
		// TODO Auto-generated constructor stub
	}

	public UserGeneric(String mail, String name, int age, String city, String country, int numberOfOrder, float totalPayment) {
		super();
		this.mail = mail;
		this.name = name;
		this.age = age;
		this.city = city;
		this.country = country;
		this.numberOfOrder = numberOfOrder;
		this.totalPayment = totalPayment;
	}
	
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumberOfOrder() {
		return numberOfOrder;
	}

	public void setNumberOfOrder(int numberOfOrder) {
		this.numberOfOrder = numberOfOrder;
	}

	public float getTotalPayment() {
		return totalPayment;
	}

	public void setTotalPayment(float totalPayment) {
		this.totalPayment = totalPayment;
	}

}
