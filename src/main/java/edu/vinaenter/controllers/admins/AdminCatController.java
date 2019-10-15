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
import edu.vinaenter.models.Category;
import edu.vinaenter.services.CategoryService;

@Controller
@RequestMapping(UrlConstants.URL_ADMIN)
public class AdminCatController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;

	// index
	@GetMapping(UrlConstants.URL_ADMIN_CAT_INDEX)
	public String index(Model model) {
		List<Category> listCat = categoryService.findAll();
		model.addAttribute("listCat", listCat);
		return "cland.admin.cat.index";
	}

	// search
	@GetMapping(UrlConstants.URL_ADMIN_CAT_SEARCH)
	public String search(Model model, @RequestParam("str") String str) {
		List<Category> listCat = categoryService.findAllByStr(str);
		model.addAttribute("listCat", listCat);
		return "cland.admin.cat.index";
	}

	// add
	@GetMapping(UrlConstants.URL_ADMIN_CAT_ADD)
	public String add() {
		return "cland.admin.cat.add";
	}

	@PostMapping(UrlConstants.URL_ADMIN_CAT_ADD)
	public String add(@Valid @ModelAttribute("cat") Category cat, BindingResult bs, RedirectAttributes ra) {
		if (bs.hasErrors()) {
			return "cland.admin.cat.add";
		}
		int check = categoryService.addItem(cat);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.add.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_ADD;
	}

	// del
	// @RequestParam lấy tham số dấu hỏi trên url
	// @PathVariable lấy tham số ngoặc nhọn trên url
	@GetMapping(UrlConstants.URL_ADMIN_CAT_DEL)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		int check = categoryService.delItem(id);
		System.out.println(check);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.del.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.del.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_INDEX;
	}

	// edit
	@GetMapping(UrlConstants.URL_ADMIN_CAT_EDIT)
	public String edit(@PathVariable Integer id, Model model) {
		Category cat = categoryService.findItemById(id);
		model.addAttribute("cat", cat);
		return "cland.admin.cat.edit";
	}

	@PostMapping(UrlConstants.URL_ADMIN_CAT_EDIT)
	public String edit(@Valid @ModelAttribute("cat") Category cat, BindingResult bs, RedirectAttributes ra) {
		if (bs.hasErrors()) {
			return "cland.admin.cat.edit";
		}
		int check = categoryService.editItem(cat);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.edit.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.edit.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_EDIT;
	}

}
