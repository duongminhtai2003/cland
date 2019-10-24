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

	public static final String URL_CLAND_CONTACT_ADD = "/contact/add";

	public static final String URL_CLAND_COMMENT_ADD = "/comment/add";

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

	// lands
	public static final String URL_ADMIN_LANDS_INDEX = "/lands/index";

	public static final String URL_ADMIN_LANDS_INDEX_PAGINATION = "/lands/index/{page}";
	
	public static final String URL_ADMIN_LANDS_SEARCH = "/lands/search";

	public static final String URL_ADMIN_LANDS_SEARCH_PAGINATION = "/lands/search/{page}";

	public static final String URL_ADMIN_LANDS_ADD = "/lands/add";

	public static final String URL_ADMIN_LANDS_DEL = "/lands/del/{id}";

	public static final String URL_ADMIN_LANDS_EDIT = "/lands/edit/{id}";

	// users
	public static final String URL_ADMIN_USERS_INDEX = "/users/index";

	public static final String URL_ADMIN_USERS_INDEX_PAGINATION = "/users/index/{page}";

	public static final String URL_ADMIN_USERS_SEARCH = "/users/search";

	public static final String URL_ADMIN_USERS_SEARCH_PAGINATION = "/users/search/{page}";

	public static final String URL_ADMIN_USERS_ADD = "/users/add";

	public static final String URL_ADMIN_USERS_DEL = "/users/del/{id}";

	public static final String URL_ADMIN_USERS_EDIT = "/users/edit/{id}";
	
	public static final String URL_ADMIN_ENABLE = "/users/enable";
	
	public static final String URL_ADMIN_USERS_CHECK_USERNAME = "/users/checkUsername";

	// contact
	public static final String URL_ADMIN_CONTACT_INDEX = "/contact/index";

	public static final String URL_ADMIN_CONTACT_INDEX_PAGINATION = "/contact/index/{page}";
	
	public static final String URL_ADMIN_CONTACT_SEARCH = "/contact/search";

	public static final String URL_ADMIN_CONTACT_SEARCH_PAGINATION = "/contact/search/{page}";

	public static final String URL_ADMIN_CONTACT_DEL = "/contact/del/{id}";

	// comment
	public static final String URL_ADMIN_COMMENT_INDEX = "/comment/index";

	public static final String URL_ADMIN_COMMENT_PAGINATION = "/comment/index/{page}";
	
	public static final String URL_ADMIN_COMMENT_SEARCH = "/comment/search";

	public static final String URL_ADMIN_COMMENT_SEARCH_PAGINATION = "/comment/search/{page}";

	public static final String URL_ADMIN_COMMENT_DEL = "/comment/del/{id}";

	private UrlConstants() {
		throw new InstantiationError("Must not instantiate this class");
	}
}
