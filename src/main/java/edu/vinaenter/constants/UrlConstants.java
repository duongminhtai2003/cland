package edu.vinaenter.constants;

public class UrlConstants {

	// public
	public static final String URL_CLAND_HOME = "/home";
	
	public static final String URL_CLAND_HOME_PAGINATION = "/home/{page}";

	public static final String URL_CLAND_CAT = "/cat/{name}-{id}.html";
	
	public static final String URL_CLAND_DETAIL = "/detail/{name}-{id}.html";
	
	public static final String URL_CLAND_SEARCH = "/search";
	
	public static final String URL_CLAND_SEARCH_PAGINATION = "/search/{page}";
	
	public static final String URL_CLAND_CONTACT = "/contact";

	// admin
	public static final String URL_ADMIN = "/admin";

	public static final String URL_ADMIN_INDEX = "/index";
	
	// auth
	public static final String URL_AUTH = "/auth";
	
	public static final String URL_LOGIN = "/login";

	// cat
	public static final String URL_ADMIN_CAT_INDEX = "/cat/index";

	public static final String URL_ADMIN_CAT_ADD = "/cat/add";

	public static final String URL_ADMIN_CAT_DEL = "/cat/del/{id}";

	public static final String URL_ADMIN_CAT_EDIT = "/cat/edit/{id}";

	public static final String URL_ADMIN_CAT_SEARCH = "/cat/search";

	// lands
	public static final String URL_ADMIN_LANDS_INDEX = "/lands/index";

	public static final String URL_ADMIN_LANDS_INDEX_PAGINATION = "/lands/index/{page}";

	public static final String URL_ADMIN_LANDS_ADD = "/lands/add";

	public static final String URL_ADMIN_LANDS_DEL = "/lands/del/{id}";

	public static final String URL_ADMIN_LANDS_EDIT = "/lands/edit/{id}";

	public static final String URL_ADMIN_LANDS_SEARCH = "/lands/search";

	public static final String URL_ADMIN_LANDS_SEARCH_PAGINATION = "/lands/search/{page}";

	// users
	public static final String URL_ADMIN_USERS_INDEX = "/users/index";

	public static final String URL_ADMIN_USERS_INDEX_PAGINATION = "/users/index/{page}";

	public static final String URL_ADMIN_USERS_ADD = "/users/add";

	public static final String URL_ADMIN_USERS_DEL = "/users/del/{id}";

	public static final String URL_ADMIN_USERS_EDIT = "/users/edit/{id}";

	public static final String URL_ADMIN_USERS_SEARCH = "/users/search";

	public static final String URL_ADMIN_USERS_SEARCH_PAGINATION = "/users/search/{page}";

	private UrlConstants() {
		throw new InstantiationError("Must not instantiate this class");
	}
}
