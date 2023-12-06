package cafe.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;

@Controller
public class CafeDeleteController {
	private final String command = "cafeDelete.cf";
	private final String gotoPage = "redirect:mainCafeList.cf";
	
	@Autowired
	private CafeDao cafeDao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String cafeDelete(@RequestParam("cnum") String cnum, 
							@RequestParam("pageNumber") String pageNumber) {
		CafeBean cb = cafeDao.getCafeDetailByCnum(cnum);
		String uploadPath = servletContext.getRealPath("/resources/uploadFolder/");
		
		File dFile = new File(uploadPath+File.separator+cb.getImage());
		dFile.delete();
		
		if(cb.getImage2() != null) {
			File dFile2 = new File(uploadPath+File.separator+cb.getImage2());
			dFile2.delete();
		}
		
		if(cb.getImage3() != null) {
			File dFile3 = new File(uploadPath+File.separator+cb.getImage3());
			dFile3.delete();
		}
		
		if(cb.getImage4() != null) {
			File dFile4 = new File(uploadPath+File.separator+cb.getImage4());
			dFile4.delete();
		}
		
		if(cb.getImage5() != null) {
			File dFile5 = new File(uploadPath+File.separator+cb.getImage5());
			dFile5.delete();
		}
		
		cafeDao.deleteCafe(cnum);
		
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
