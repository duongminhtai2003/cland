package edu.vinaenter.controllers.admins;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.vinaenter.constants.CommonConstants;
import edu.vinaenter.constants.FileDefine;
import edu.vinaenter.constants.UrlConstants;
import edu.vinaenter.dto.LandsDTO;
import edu.vinaenter.models.Category;
import edu.vinaenter.models.Lands;
import edu.vinaenter.services.CategoryService;
import edu.vinaenter.services.LandsService;
import edu.vinaenter.utils.FileUtil;

@Controller
@RequestMapping(UrlConstants.URL_ADMIN)
public class AdminLandsController {

	@Autowired // DI
	private ServletContext servletContext;

	@Autowired
	private MessageSource messageSource;

	@Autowired
	private LandsService landsService;

	@Autowired
	private CategoryService categoryService;

	// index
	@GetMapping({ UrlConstants.URL_ADMIN_LANDS_INDEX, UrlConstants.URL_ADMIN_LANDS_INDEX_PAGINATION })
	public String index(Model model, @PathVariable(required = false) Integer page) {
		if (page == null) {
			page = 1;
		}
		int offset = (page - 1) * CommonConstants.DEFAULT_PAGING_SIZE;
		int countPagination = landsService.countPagination();
		int totalPage = (int) Math.ceil((float) countPagination / CommonConstants.DEFAULT_PAGING_SIZE);
		List<LandsDTO> listLands = landsService.findAllPagination(offset);
		model.addAttribute("listLands", listLands);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("page", page);
		return "cland.admin.lands.index";
	}

	// search
	@GetMapping({ UrlConstants.URL_ADMIN_LANDS_SEARCH, UrlConstants.URL_ADMIN_LANDS_SEARCH_PAGINATION })
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
		return "cland.admin.lands.index";
	}

	// add
	@GetMapping(UrlConstants.URL_ADMIN_LANDS_ADD)
	public String add(Model model) {
		List<Category> listCat = categoryService.findAll();
		model.addAttribute("listCat", listCat);
		return "cland.admin.lands.add";
	}

	@PostMapping(UrlConstants.URL_ADMIN_LANDS_ADD)
	public String add(@Valid @ModelAttribute("lands") Lands lands, BindingResult br, @RequestParam("cid") Integer cid,
			@RequestParam("file") MultipartFile mtf, RedirectAttributes ra) {
		if (br.hasErrors()) {
			return "cland.admin.lands.add";
		} // upload file
		String fileName = mtf.getOriginalFilename(); // thu muc chua file
		String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
		File saveDir = new File(dirPath);
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		} // tao duong dan file
		String newFileName = FileUtil.rename(fileName);
		String filePath = dirPath + File.separator + newFileName; // tao doi tuong file de upload len server
		try {
			mtf.transferTo(new File(filePath));
			System.out.println("file path: " + filePath);
			ra.addFlashAttribute("msg", "uploads file thaÌ€nh cÃ´ng");
		} catch (IllegalStateException | IOException e) {
			System.out.println("aÌ�dasdas");
			ra.addFlashAttribute("msg", "uploads file thÃ¢Ì�t baÌ£i");
		}
		lands.setCat(new Category(cid, null));
		lands.setPicture(newFileName);
		int check = landsService.addItem(lands);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.lands.add.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.lands.add.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_ADD;
	}

	// del
	@GetMapping(UrlConstants.URL_ADMIN_LANDS_DEL)
	public String del(@PathVariable Integer id, RedirectAttributes ra) {
		int check = landsService.delItem(id);
		System.out.println(check);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.del.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.cat.del.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_INDEX;
	}

	// edit
	@GetMapping(UrlConstants.URL_ADMIN_LANDS_EDIT)
	public String edit(@PathVariable Integer id, Model model) {
		List<Category> listCat = categoryService.findAll();
		LandsDTO lands = landsService.findItemById(id);
		model.addAttribute("listCat", listCat);
		model.addAttribute("lands", lands);
		return "cland.admin.lands.edit";
	}

	@PostMapping(UrlConstants.URL_ADMIN_LANDS_EDIT)
	public String edit(@Valid @ModelAttribute("lands") Lands lands, BindingResult br, @RequestParam("cid") Integer cid,
			@RequestParam("file") MultipartFile mtf, RedirectAttributes ra) {
		if (br.hasErrors()) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.lands.edit.fail", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_EDIT;
		} // upload file
		String fileName = mtf.getOriginalFilename(); // thu muc chua file
		String dirPath = servletContext.getRealPath("") + FileDefine.DIR_UPLOAD;
		File saveDir = new File(dirPath);
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		} // tao duong dan file
		String newFileName = FileUtil.rename(fileName);
		String filePath = dirPath + File.separator + newFileName; // tao doi tuong file de upload len server
		try {
			mtf.transferTo(new File(filePath));
			System.out.println("file path: " + filePath);
		} catch (IllegalStateException | IOException e) {
			System.out.println("upload failed!!!");
		}
		lands.setCat(new Category(cid, null));
		lands.setPicture(newFileName);
		int check = landsService.editItem(lands);
		if (check > 0) {
			ra.addFlashAttribute("msg", messageSource.getMessage("admin.lands.edit.success", null, null));
			return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_INDEX;
		}
		ra.addFlashAttribute("msg", messageSource.getMessage("admin.lands.edit.fail", null, null));
		return "redirect:" + UrlConstants.URL_ADMIN + UrlConstants.URL_ADMIN_LANDS_EDIT;
	}
}