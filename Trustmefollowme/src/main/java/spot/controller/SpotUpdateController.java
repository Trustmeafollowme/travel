package spot.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import spot.model.SpotBean;
import spot.model.SpotDao;



@Controller
public class SpotUpdateController {
	private final String command = "spotUpdate.sp";
	private final String viewPage = "spotUpdateForm";
	private final String gotoPage = "redirect:spotList.sp";
	
	@Autowired
	SpotDao spotDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String cafeUpdate(@RequestParam("snum") int snum, 
							@RequestParam(value="pageNumber",required = false) String pageNumber, 
							HttpServletRequest request) {
		SpotBean sb = spotDao.spotDetail(snum);
		request.setAttribute("spotBean", sb);
		request.setAttribute("pageNumber", pageNumber);
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String cafeUpdate(@Valid SpotBean sb, BindingResult cResult,  
							@RequestParam(value="pageNumber",required = false) String pageNumber, 
							HttpServletRequest request) throws IllegalStateException, IOException {
		if(cResult.hasErrors()) {
			request.setAttribute("pageNumber", pageNumber);
			return viewPage;
		}
		
		System.out.println("sb.getImage() :"+sb.getImage());
		System.out.println("sb.getImage2() :"+sb.getImage2());
		System.out.println("sb.getImage3() :"+sb.getImage3());
		System.out.println("sb.getImage4() :"+sb.getImage4());
		System.out.println("sb.getImage5() :"+sb.getImage5());
		spotDao.updateSpot(sb);

		return gotoPage+"?pageNumber="+pageNumber;
	}
}
