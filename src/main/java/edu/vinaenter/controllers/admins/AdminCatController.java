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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constants.UrlConstants;
import edu.vinaenter.dto.CategoryDTO;
import edu.vinaenter.models.Category;
import edu.vinaenter.services.CategoryService;
import edu.vinaenter.services.LandsService;
import edu.vinaenter.validators.CategoryNameValidator;

@Controller
@RequestMapping(UrlConstants.URL_ADMIN)
public class AdminCatController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private LandsService landsService;

	@Autowired
	private CategoryNameValidator categoryNameValidator;

	// index
	@GetMapping(UrlConstants.URL_ADMIN_CAT_INDEX)
	public String index(Model model) {
		List<CategoryDTO> listCat = categoryService.findAll();
		model.addAttribute("listCat", listCat);
		return "cland.admin.cat.index";
	}

	// add
	@GetMapping(UrlConstants.URL_ADMIN_CAT_ADD)
	public String add() {
		return "cland.admin.cat.add";
	}

	@PostMapping(UrlConstants.URL_ADMIN_CAT_ADD)
	public String add(@Valid @ModelAttribute("cat") Category cat, BindingResult br, RedirectAttributes ra) {
		categoryNameValidator.validate(cat, br);
		if (br.hasErrors()) {
			return "cland.admin.cat.add";
		}
		if (categoryService.countPagination(cat.getName()) > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.add.duplicate", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_ADD;

		} else {
			int check = categoryService.addItem(cat);
			if (check > 0) {
				ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.add.success", null, null));
				return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_INDEX;
			}
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_CAT_ADD;
	}

	// del
	@GetMapping(UrlConstants.URL_ADMIN_CAT_DEL)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		int checkDelCat = categoryService.delItem(id);
		landsService.delItemByCid(id);
		if (checkDelCat > 0) {
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
	public String edit(@Valid @ModelAttribute("cat") Category cat, BindingResult br, RedirectAttributes ra) {
		if (br.hasErrors()) {
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
