package board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.swing.Box.Filler;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.model.BoardBean;
import board.model.BoardDao;

@Controller
public class BoardUpdateController {

	private final String command = "/boardUpdate.bd";
	private final String viewPage = "boardUpdateForm";
	private final String gotoPage = "redirect:/boardList.bd";
	
	@Autowired
	private BoardDao boardDao;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value = command, method = RequestMethod.GET)
	public String boardUpdateForm(Model model, @RequestParam("num") int num) {
		
		BoardBean bb = boardDao.oneData(num);
		
		model.addAttribute("bb", bb);
		return viewPage;
	}
	@RequestMapping(value = command, method = RequestMethod.POST)
	public String boardUpdate(@ModelAttribute("bb") @Valid BoardBean bb, BindingResult result) {
		
		if(result.hasErrors()) {
			return viewPage;
		}
		boardDao.boardUpdate(bb);
		
		String upload = servletContext.getRealPath("/resources/images/");
		
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
