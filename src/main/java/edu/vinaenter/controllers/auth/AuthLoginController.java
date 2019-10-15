package edu.vinaenter.controllers.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constants.UrlConstants;

@Controller
@RequestMapping(UrlConstants.URL_AUTH)
public class AuthLoginController {
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MessageSource messageSource;
	
	// login
	@GetMapping(UrlConstants.URL_LOGIN)
	public String login() {
		return "cland.auth.login";
	}
	
	@GetMapping("get-password")
	@ResponseBody
	public String getPassword() {
		return bCryptPasswordEncoder.encode("123456");
	}
	
	@GetMapping("403")
	public String get403(RedirectAttributes ra) {
		ra.addFlashAttribute("enable", messageSource.getMessage("login.enable", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_INDEX;
	}
	
}
