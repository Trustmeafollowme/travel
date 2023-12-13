package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class JoinController {
	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = "/join.mb", method = RequestMethod.GET)
	public String joinForm() {
		return "join";
	}

	@RequestMapping(value = "join.mb", method = RequestMethod.POST)
	public String join(MemberBean mb,HttpServletResponse response) throws IOException {

		memberDao.insertMember(mb);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		out = response.getWriter();
		out.print("<script>alert('회원가입이 완료되었습니다.');</script>");
		out.flush();
		
		return "login";
		
		
	}

}
