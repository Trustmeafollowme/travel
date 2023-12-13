package spot.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cafe.model.CafeBean;
import cafe.model.CafeDao;

@Controller
public class SpotUpdateController {
	private final String command = "spotUpdate.sp";
	private final String viewPage = "spotUpdateForm";
	private final String gotoPage = "redirect:mainspotList.sp";
	
	@Autowired
	private spot.model.SpotDao SpotDao;
	
	@Autowired
	ServletContext servletContext;
	
//	@RequestMapping(value = command, method = RequestMethod.GET)
//	public String cafeUpdate(@RequestParam("cnum") String cnum, 
//							@RequestParam("pageNumber") String pageNumber, 
//							Model model) {
//		CafeBean cb = cafeDao.getCafeDetailByCnum(cnum);
//		model.addAttribute("cafeBean", cb);
//		model.addAttribute("pageNumber", pageNumber);
//		return viewPage;
//	}
//	
//	@RequestMapping(value = command, method = RequestMethod.POST)
//	public String cafeUpdate(@Valid CafeBean cb, BindingResult cResult,  
//							@RequestParam("pageNumber") String pageNumber, 
//							Model model, HttpServletRequest request) throws IllegalStateException, IOException {
//		if(cResult.hasErrors()) {
//			model.addAttribute("pageNumber", pageNumber);
//			return viewPage;
//		}
//		String uploadPath = request.getContextPath()+"/resources/images/";
//		cafeDao.updateCafe(cb);
//
//		return gotoPage+"?pageNumber="+pageNumber;
//	}
}
