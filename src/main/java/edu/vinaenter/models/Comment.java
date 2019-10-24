package edu.vinaenter.models;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Data
@ToString
public class Comment {
	private int id;
	@NotEmpty(message = "không được để trống")
	private String fullname;
	@NotEmpty(message = "không được để trống")
	private String content;
	private Timestamp dateCreate;
	private int lid;
	private String landsName;
}
