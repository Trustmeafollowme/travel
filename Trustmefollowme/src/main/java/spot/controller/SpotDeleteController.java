package spot.controller;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cafe.model.CafeBean;
import cafe.model.CafeDao;
import spot.model.SpotBean;
import spot.model.SpotDao;

@Controller
public class SpotDeleteController {
	private final String command = "spotDelete.sp";
	private final String gotoPage = "redirect:mainSpotList.sp";
	
	@Autowired
	private SpotDao  spotdao;
	
	@Autowired
	ServletContext servletContext;
	
	@RequestMapping(command)
	public String cafeDelete(@RequestParam("snum") int snum, 
							@RequestParam("pageNumber") String pageNumber) {
		SpotBean sb = spotdao.spotDetail(snum);
		String uploadPath = servletContext.getRealPath("/resources/images/");
		
		File dFile = new File(uploadPath+File.separator+sb.getImage());
		dFile.delete();
		
		if(sb.getImage2() != null) {
			File dFile2 = new File(uploadPath+File.separator+sb.getImage2());
			dFile2.delete();
		}
		
		if(sb.getImage3() != null) {
			File dFile3 = new File(uploadPath+File.separator+sb.getImage3());
			dFile3.delete();
		}
		
		if(sb.getImage4() != null) {
			File dFile4 = new File(uploadPath+File.separator+sb.getImage4());
			dFile4.delete();
		}
		
		if(sb.getImage5() != null) {
			File dFile5 = new File(uploadPath+File.separator+sb.getImage5());
			dFile5.delete();
		}
		
		spotdao.deleteSpot(snum);
		
		return gotoPage+"?pageNumber="+pageNumber;
	}
}
