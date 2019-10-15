package edu.vinaenter.models;

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
	private String username;
	private String fullname;
	private String remember_token;
	private String password;
		// TODO Auto-generated method stub
}
