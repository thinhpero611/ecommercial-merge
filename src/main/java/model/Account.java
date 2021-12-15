package model;

public class Account {
	private String user, password;
	private int role;
	private String name, address, phone;
	private int check;
	private String message;

	public Account() {}
	
	public Account(String user, String password, int role, String name, String address, String phone, int check) {
		super();
		this.user = user;
		this.password = password;
		this.role = role;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.check = check;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}
	
	public String getMessage() {
		return message;
	}
	
	public boolean validate() {
		String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
		String regex = "[a-zA-Z0-9_!@#$%^&*]+";
		
		if (user == null) {
			message = "No email was set.";
			return false;
		}
		
		else if (password == null) {
			message = "No password was set.";
			return false;
		}
		
		else if (!user.matches(regexMail)) {
			message = "In valid email";
			return false;
		} 
		
		else if (password.length() < 8) {
			message = "Password must be at least 8 charactor.";
			return false;
		} 
		
		else if (!password.matches(regex)) {
			message = "in valid password";
			return false;
		}
		
		else return true;
	}
	
}
