package edu.vinaenter.models;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Data
@ToString
public class Users {

	private int id;
	@NotEmpty(message = "không được để trống")
	private String username;
	@NotEmpty(message = "không được để trống")
	private String fullname;
	@NotEmpty(message = "không được để trống")
	private String password;
	private int enable;
	private int roleid;
	private String roleName;
	
}
