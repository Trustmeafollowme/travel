package board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.model.BoardDao;
import board.model.ChatBean;

@Controller
public class ReplyUpdateController {

	private final String command = "replyUpdate.bd";
	private final String gotoPage = "redirect:/boardDetail.bd";

	@Autowired
	private BoardDao boardDao;

	@RequestMapping(command)
	public String replyUpdate(HttpServletRequest request,ChatBean cb){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String date = sdf.format(new Date());
    	cb.setReg_date(date);
    	cb.setIp(request.getRemoteAddr());

		int cnt = boardDao.chatUpdate(cb);

    	return gotoPage+"?num="+cb.getB_num();
	}
}
