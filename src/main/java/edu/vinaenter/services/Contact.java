package edu.vinaenter.services;


import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Contact {
	private int id;
	@NotEmpty
	private String fullname;
	@NotEmpty
	private String email;
	@NotEmpty
	private String subject;
	@NotEmpty
	private String content;
}
