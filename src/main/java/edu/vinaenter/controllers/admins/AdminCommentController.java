package edu.vinaenter.controllers.admins;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.constants.UrlConstants;
import edu.vinaenter.models.Comment;
import edu.vinaenter.models.Contact;
import edu.vinaenter.services.CommentService;

@Controller
@RequestMapping(UrlConstants.URL_ADMIN)
public class AdminCommentController {

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private CommentService commentService;

	// index
	@GetMapping({ UrlConstants.URL_ADMIN_COMMENT_INDEX, UrlConstants.URL_ADMIN_COMMENT_PAGINATION })
	public String index(Model model, @PathVariable(required = false) Integer page) {
		int numberOfItems = commentService.countPagination();
		int numberOfPage = (int) Math.ceil((float) numberOfItems / CommonConstants.DEFAULT_PAGING_SIZE);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if (currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		List<Comment> listComment = commentService.findAllPagination(offset);
		model.addAttribute("numberOfPage", numberOfPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listComment", listComment);
		return "cland.admin.comment.index";
	}

	@GetMapping({ UrlConstants.URL_ADMIN_COMMENT_SEARCH, UrlConstants.URL_ADMIN_COMMENT_SEARCH_PAGINATION })
	public String search(Model model, @RequestParam("str") String str, @RequestParam("option") String option,
			@PathVariable(required = false) Integer page) {
		int numberOfItems = commentService.countPagination();
		int numberOfPage = (int) Math.ceil((float) numberOfItems / CommonConstants.DEFAULT_PAGING_SIZE);
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		if (currentPage > numberOfPage || currentPage < 1) {
			currentPage = 1;
		}
		int offset = (currentPage - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		List<Comment> listComment = commentService.searchItems(offset, str, option);
		model.addAttribute("numberOfPage", numberOfPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("listComment", listComment);
		return "cland.admin.comment.index";
	}

	// del
	@GetMapping(UrlConstants.URL_ADMIN_COMMENT_DEL)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		int check = commentService.delItems(id);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.comment.del.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_COMMENT_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.comment.del.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_COMMENT_INDEX;
	}
}
