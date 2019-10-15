package edu.vinaenter.controllers.clands;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.constants.UrlConstants;
import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Category;
import edu.vinaenter.services.CategoryService;
import edu.vinaenter.services.Contact;
import edu.vinaenter.services.LandsService;

@Controller
public class ClandHomeController {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private LandsService landsService;

	// list cat
	@ModelAttribute
	public void commonObject(ModelMap model) {
		List<Category> listCat = categoryService.findAll();
		List<Category> listCatHot = categoryService.findCategoryHot();
		List<LandsDTO> listLandsHot = landsService.findItemsHot();
		model.addAttribute("listCat", listCat);
		model.addAttribute("listCatHot", listCatHot);
		model.addAttribute("listLandsHot", listLandsHot);
	}

	// home
	@GetMapping({ UrlConstants.URL_CLAND_HOME, UrlConstants.URL_CLAND_HOME_PAGINATION })
	public String home(ModelMap model, @PathVariable(required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = (page - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		int countPagination = landsService.countPagination();
		int totalPage = (int) Math.ceil((float) countPagination / CommonConstants.DEFAULT_PAGING_SIZE);
		List<LandsDTO> listLandsLatest = landsService.findItemsLatest();
		List<LandsDTO> listLands = landsService.findAllPagination(offset);
		model.addAttribute("listLands", listLands);
		model.addAttribute("listLandsLatest", listLandsLatest);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		return "cland.cland.index";
	}

	// list lands same cat
	@GetMapping(UrlConstants.URL_CLAND_CAT)
	public String cat(ModelMap model, @PathVariable Integer id) {
		List<LandsDTO> listLands = landsService.findAllById(id);
		model.addAttribute("listLands", listLands);
		return "cland.cland.cat";
	}

	// detail
	@GetMapping(UrlConstants.URL_CLAND_DETAIL)
	public String detail(ModelMap model, @PathVariable Integer id) {
		LandsDTO landsDTO = landsService.findItemById(id);
		List<LandsDTO> listLands = landsService.findAllById(landsDTO.getCid());
		model.addAttribute("landsDTO", landsDTO);
		model.addAttribute("listLands", listLands);
		return "cland.cland.detail";
	}

	// search
	@GetMapping({ UrlConstants.URL_CLAND_SEARCH, UrlConstants.URL_CLAND_SEARCH_PAGINATION })
	public String search(Model model, @RequestParam("str") String str, @PathVariable(required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = (page - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		int countPagination = landsService.countPagination();
		int totalPage = (int) Math.ceil((float) countPagination / CommonConstants.DEFAULT_PAGING_SIZE);
		List<LandsDTO> listLands = landsService.findAllByStrPagination(str, offset);
		model.addAttribute("listLands", listLands);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		return "cland.cland.index";
	}

	// contact
	@GetMapping(UrlConstants.URL_CLAND_CONTACT)
	public String contact() {
		return "cland.cland.contact";
	}
	
	@PostMapping(UrlConstants.URL_CLAND_CONTACT)
	public String contact(@Valid @ModelAttribute("contact") Contact contact, BindingResult br) {
		if (br.hasErrors()) {
			return "cland.cland.contact";
		}
		return "cland.cland.contact";
	}
}
