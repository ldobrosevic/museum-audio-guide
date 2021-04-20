package hr.fer.apptownfunk.models;

public enum UserRoles {
	
	REGISTERED_USER ("registered_user"),
	ADMIN ("admin"),
	OWNER ("owner");
	
	private final String role;
	private UserRoles(String role) {
		this.role = role;
	}
	public String getRole() {
		return role;
	}
}
