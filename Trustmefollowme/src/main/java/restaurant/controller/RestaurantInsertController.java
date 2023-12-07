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
		File file2 = new File(upload+File.separator+rb.getImage2());
		File file3 = new File(upload+File.separator+rb.getImage3());
		File file4 = new File(upload+File.separator+rb.getImage4());
		File file5 = new File(upload+File.separator+rb.getImage5());
		
		MultipartFile multi = rb.getImgUpload();
		MultipartFile multi2 = rb.getImgUpload2();
		MultipartFile multi3 = rb.getImgUpload3();
		MultipartFile multi4 = rb.getImgUpload4();
		MultipartFile multi5 = rb.getImgUpload5();
		
		try {
			multi.transferTo(file);
			multi.transferTo(file2);
			multi.transferTo(file3);
			multi.transferTo(file4);
			multi.transferTo(file5);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return viewPage;
	}
}
