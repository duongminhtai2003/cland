package edu.vinaenter.controllers.auth;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import edu.vinaenter.constants.UrlConstants;

@Controller
@RequestMapping(UrlConstants.URL_AUTH)
public class AuthLoginController {

	@GetMapping(UrlConstants.URL_LOGIN)
	public String login() {
		return "cland.auth.login";
	}

	@GetMapping("403")
	public String get403() {
		return "cland.403";
	}

}
