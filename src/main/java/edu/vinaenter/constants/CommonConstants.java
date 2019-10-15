package edu.vinaenter.constants;

public class CommonConstants {

	public static final String EMAIL_REGEX = "^[_\\w\\d-]+(\\.[_\\w\\d-]+)*@[\\w\\d-]+(\\.[\\w\\d-]+)*(\\.[\\w]{2,})$";

	public static final String PHONE_REGEX = "^[\\d]*$";

	public static final String BIRTHDAY_REGEX = "\\d{4}-\\d{2}-\\d{2}";

	public static final int DEFAULT_PAGING_SIZE = 5;
	
	public static final int DEFAULT_HOT = 5;
	
	public static final int DEFAULT_LATEST = 3;

	public static final String DATE_FORMAT = "DD/MM/YYYY";

	public static final String DIR_UPLOAD = "upload";

	public static final int SIZE = 100000;

	private CommonConstants() {
		throw new InstantiationError("Must not instantiate this class");
	}

	public static void main(String[] args) {
		System.out.println(BIRTHDAY_REGEX.matches("2019-01-11"));
	}
}
