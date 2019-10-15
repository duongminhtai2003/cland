package edu.vinaenter.dto;

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
public class LandsDTO {
	private int id;
	
	private String landsName;
	
	private String description;
	
	private Timestamp dateCreate;
	
	private String picture;
	
	private double area;
	
	private String address;
	
	private int countViews;
	
	private int cid;
	
	private String catName;
}
