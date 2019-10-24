package edu.vinaenter.models;

import java.sql.Timestamp;

import javax.validation.constraints.Digits;

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
public class Lands {
	private int id;
	@NotEmpty(message = "không được để trống")
	private String name;
	@NotEmpty(message = "không được để trống")
	private String description;
	private Timestamp date_create;
	private Category cat;
	private String picture;
	@Digits(integer = 11, fraction = 0)
	private int area;
	@NotEmpty(message = "không được để trống")
	private String address;
	private int count_views;
}
