package edu.vinaenter.controllers.admins;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constants.UrlConstants;
import edu.vinaenter.models.Users;
import edu.vinaenter.services.UsersService;

@Controller
@RequestMapping(UrlConstants.URL_ADMIN)
public class AdminUsersController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private UsersService usersService;

	// index
	@GetMapping(UrlConstants.URL_ADMIN_USERS_INDEX)
	public String index(Model model) {
		List<Users> listUsers = usersService.findAll();
		model.addAttribute("listUsers", listUsers);
		return "cland.admin.users.index";
	}

	// add
	@GetMapping(UrlConstants.URL_ADMIN_USERS_ADD)
	public String add() {
		return "cland.admin.users.add";
	}

	@PostMapping(UrlConstants.URL_ADMIN_USERS_ADD)
	public String add(@Valid @ModelAttribute("users") Users users, @RequestParam("password1") String password1,
			BindingResult bs, RedirectAttributes ra) {
		if (bs.hasErrors()) {
			return "cland.admin.users.add";
		}
		if (!password1.equals(users.getPassword())) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.failpassword", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
		}
		int check = usersService.addItem(users);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
	}

	// del
	@GetMapping(UrlConstants.URL_ADMIN_USERS_DEL)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		int check = usersService.delItem(id);
		System.out.println(check);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.del.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.del.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
	}

	// edit
	@GetMapping(UrlConstants.URL_ADMIN_USERS_EDIT)
	public String edit(@PathVariable Integer id, Model model) {
		Users users = usersService.findItemById(id);
		model.addAttribute("uands", users);
		return "cland.admin.users.edit";
	}

	@PostMapping(UrlConstants.URL_ADMIN_USERS_EDIT)
	public String edit(@Valid @ModelAttribute("users") Users users, @RequestParam("password1") String password1,
			@RequestParam("password2") String password2, BindingResult bs, RedirectAttributes ra) {
		if (bs.hasErrors()) {
			return "cland.admin.users.add";
		}
		if (!password1.equals(users.getPassword())) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.failpassword", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
		}
		int check = usersService.addItem(users);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
	}

}
