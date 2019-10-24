package edu.vinaenter.controllers.clands;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.constants.UrlConstants;
import edu.vinaenter.dto.CategoryDTO;
import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Comment;
import edu.vinaenter.models.Contact;
import edu.vinaenter.services.CategoryService;
import edu.vinaenter.services.CommentService;
import edu.vinaenter.services.ContactService;
import edu.vinaenter.services.LandsService;

@Controller
public class ClandHomeController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private LandsService landsService;

	@Autowired
	private ContactService contactService;

	@Autowired
	private CommentService commentService;

	// list cat
	@ModelAttribute
	public void commonObject(ModelMap model) {
		List<CategoryDTO> listCat = categoryService.findAll();
		List<CategoryDTO> listCatHot = categoryService.findCategoryHot();
		List<LandsDTO> listLandsHot = landsService.findItemsHot();
		model.addAttribute("listCat", listCat);
		model.addAttribute("listCatHot", listCatHot);
		model.addAttribute("listLandsHot", listLandsHot);
	}

	// home
	@GetMapping({ UrlConstants.URL_CLAND_HOME, UrlConstants.URL_CLAND_HOME_PAGINATION })
	public String home(ModelMap model, @PathVariable(required = false) Integer page) {
		int numberOfItems = landsService.countPagination();
		int numberOfPage = (int) Math.ceil((float) numberOfItems / CommonConstants.DEFAULT_PAGING_SIZE);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if (currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		List<LandsDTO> listLandsLatest = landsService.findItemsLatest();
		List<LandsDTO> listLands = landsService.findAllPagination(offset);
		model.addAttribute("listLandsLatest", listLandsLatest);
		model.addAttribute("listLands", listLands);
		model.addAttribute("numberOfPage", numberOfPage);
		model.addAttribute("currentPage", currentPage);
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
		List<Comment> listComment = commentService.findAllByLandsID(landsDTO.getId());
		model.addAttribute("landsDTO", landsDTO);
		model.addAttribute("listComment", listComment);
		model.addAttribute("listLands", listLands);
		return "cland.cland.detail";
	}

	// search
	@GetMapping({ UrlConstants.URL_CLAND_SEARCH, UrlConstants.URL_CLAND_SEARCH_PAGINATION })
	public String search(Model model, @RequestParam("str") String str, @RequestParam("option") String option,
			@PathVariable(required = false) Integer page) {
		int numberOfItems = landsService.countPagination();
		int numberOfPage = (int) Math.ceil((float) numberOfItems / CommonConstants.DEFAULT_PAGING_SIZE);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if (currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		List<LandsDTO> listLands = landsService.findAllByStrPagination(str, offset, option);
		model.addAttribute("listLands", listLands);
		model.addAttribute("numberOfPage", numberOfPage);
		model.addAttribute("currentPage", currentPage);
		return "cland.cland.index";
	}

	// contact
	@GetMapping(UrlConstants.URL_CLAND_CONTACT)
	public String contact() {
		return "cland.cland.contact";
	}

	@PostMapping(UrlConstants.URL_CLAND_CONTACT_ADD)
	public String add(@Valid @ModelAttribute("contact") Contact contact, BindingResult bs, RedirectAttributes ra) {
		if (bs.hasErrors()) {
			return "cland.cland.contact";
		}
		int check = contactService.addItem(contact);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("home.contact.add.success", null, null));
			return "redirect:" + UrlConstants.URL_CLAND_HOME + UrlConstants.URL_CLAND_CONTACT;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("home.contact.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_CLAND_HOME + UrlConstants.URL_CLAND_CONTACT;
	}

	// add comment
	@PostMapping(UrlConstants.URL_CLAND_COMMENT_ADD)
	public String add(@Valid @ModelAttribute("comment") Comment comment, BindingResult br, RedirectAttributes ra,
			Model model) {
		if (br.hasErrors()) {
			return "cland.cland.detail";
		}
		int check = commentService.addItems(comment);
		if (check > 0) {
			List<Comment> listComment = commentService.findAllByLandsID(comment.getLid());
			model.addAttribute("listComment", listComment);
			return "cland.cland.displayComment";
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("home.comment.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_CLAND_HOME + UrlConstants.URL_CLAND_DETAIL;
	}
}
