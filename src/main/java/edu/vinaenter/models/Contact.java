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
public class Contact {

	private int id;
	
	@NotEmpty(message = "không được để trống")
	private String fullname;
	@NotEmpty(message = "không được để trống")
	private String email;
	@NotEmpty(message = "không được để trống")
	private String subject;
	@NotEmpty(message = "không được để trống")
	private String content;
}
