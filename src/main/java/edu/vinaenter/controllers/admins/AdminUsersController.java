package edu.vinaenter.controllers.admins;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import edu.vinaenter.constants.CommonConstants;
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

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// index
	@GetMapping({ UrlConstants.URL_ADMIN_USERS_INDEX, UrlConstants.URL_ADMIN_USERS_INDEX_PAGINATION })
	public String index(Model model, @PathVariable(required = false) Integer page) {
		int numberOfItems = usersService.countPagination();
		int numberOfPage = (int) Math.ceil((float) numberOfItems / CommonConstants.DEFAULT_PAGING_SIZE);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if (currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		List<Users> listUsers = usersService.findAllPagination(offset);
		model.addAttribute("numberOfPage", numberOfPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listUsers", listUsers);
		return "cland.admin.users.index";
	}

	// search
	@GetMapping({ UrlConstants.URL_ADMIN_USERS_SEARCH, UrlConstants.URL_ADMIN_USERS_SEARCH_PAGINATION })
	public String search(Model model, @RequestParam("str") String str, @RequestParam("option") String option,
			@PathVariable(required = false) Integer page) {
		int numberOfItems = usersService.countPagination();
		int numberOfPage = (int) Math.ceil((float) numberOfItems / CommonConstants.DEFAULT_PAGING_SIZE);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if (currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		List<Users> listUsers = usersService.searchItems(offset, str, option);
		model.addAttribute("listUsers", listUsers);
		model.addAttribute("numberOfPage", numberOfPage);
		model.addAttribute("currentPage", currentPage);
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
		if (password1.equals(users.getPassword())) {
			if (usersService.checkUsername(users.getUsername()) > 0) {
				ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.duplicate", null, null));
				return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
			} else {
				users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));
				int check = usersService.addItem(users);
				if (check > 0) {
					ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.success", null, null));
					return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
				}
				ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.fail", null, null));
				return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
			}
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.add.failpassword", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_ADD;
	}

	// del
	@GetMapping(UrlConstants.URL_ADMIN_USERS_DEL)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		Users users = usersService.findItemById(id);
		if ("ADMIN".equals(users.getRoleName())) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.del.checkadmin", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
		} else {
			int check = usersService.delItem(id);
			if (check > 0) {
				ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.del.success", null, null));
				return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
			}
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.del.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
	}

	// edit
	@GetMapping(UrlConstants.URL_ADMIN_USERS_EDIT)
	public String edit(@PathVariable Integer id, Model model) {
		Users users = usersService.findItemById(id);
		model.addAttribute("users", users);
		return "cland.admin.users.edit";
	}

	@PostMapping(UrlConstants.URL_ADMIN_USERS_EDIT)
	public String edit(@Valid @ModelAttribute("users") Users users, BindingResult br, RedirectAttributes ra) {
		users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));
		if (br.hasErrors()) {
			return "cland.admin.users.edit";
		}
		int check = usersService.editItem(users);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.edit.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.users.edit.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_EDIT;
	}

	// enable
	@GetMapping(UrlConstants.URL_ADMIN_ENABLE)
	public String enable(Model model, @RequestParam("enable") Integer enable, @RequestParam("id") Integer id,
			RedirectAttributes ra) {
		usersService.editEnable(enable, id);
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_USERS_INDEX;
	}

	// check username
	@PostMapping(UrlConstants.URL_ADMIN_USERS_CHECK_USERNAME)
	public String edit(@RequestParam("username") String username) {
		if (usersService.checkUsername(username) > 0) {
			return "cland.admin.checkusernamefail";
		}
		return "cland.admin.checkusernamesuccess";
	}

}
