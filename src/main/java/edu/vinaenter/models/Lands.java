package edu.vinaenter.models;

import java.sql.Timestamp;

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
	private String name;
	private String description;
	private Timestamp date_create;
	private Category cat;
	private String picture;
	private int area;
	private String address;
	private int count_views;
}
