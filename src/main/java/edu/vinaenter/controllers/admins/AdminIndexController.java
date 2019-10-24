package edu.vinaenter.controllers.admins;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.vinaenter.constants.UrlConstants;

@Controller
@RequestMapping(UrlConstants.URL_ADMIN)
public class AdminIndexController {

	@GetMapping(UrlConstants.URL_ADMIN_INDEX)
	public String index(Principal principal) {
		return "cland.admin.index";
	}
	
}
