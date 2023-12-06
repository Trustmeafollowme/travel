package restaurant.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import restaurant.model.RestaurantBean;
import restaurant.model.RestaurantDao;

@Controller
public class RestaurantInsertController {

	private final String command = "/restInsert.re";
	private final String viewPage = "restaurantInsertForm";
	private final String gotoPage = "restaurantListForm";
	
	@Autowired
	private RestaurantDao restaurantDao;

	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String restInsertForm() {
		
		
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String restInsert(@Valid RestaurantBean rb, BindingResult result) {
		
		
		if(result.hasErrors()) {
			
			return viewPage;
		}
		
		
		String upload = servletContext.getRealPath("/resources/images/");
		
		restaurantDao.restInsert(rb);
		
		File file = new File(upload+File.separator+rb.getImage());
		MultipartFile multi = rb.getImgUpload();
		try {
			multi.transferTo(file);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return viewPage;
	}
}
