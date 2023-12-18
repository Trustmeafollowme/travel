package board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardInsertController {

	private final String command = "/boardInsert.bd";
	private final String viewPage = "boardInsertForm";
	private final String gotoPage = "redirect:/boardList.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private ServletContext servletContext;

	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardInsertForm() {
		
		return viewPage;
	}
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String boardInsert(HttpServletRequest request, @Valid BoardBean bb, BindingResult result) {

		if(result.hasErrors()) {
			
			return viewPage;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(new Date());
		
		bb.setReg_date(date);
		bb.setIp(request.getRemoteAddr());
		
		String upload = servletContext.getRealPath("/resources/images/");
		
		boardDao.boardInsert(bb);
		File file = new File(upload+File.separator+bb.getImage());
		
		MultipartFile multi = bb.getImgUpload();
		
		try {
			multi.transferTo(file);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return gotoPage;
	}
}
