package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class LoginController {
	@Autowired
	private MemberDao memberDao;
	
	@RequestMapping(value="/login.mb",method=RequestMethod.GET)
	public String loginForm(){
	
		return "login";
	}
	
	@RequestMapping(value="/login.mb",method=RequestMethod.POST)
	public String login(MemberBean mb,
						HttpServletResponse response,HttpServletRequest request,HttpSession session) throws IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = null;
		out = response.getWriter();
		MemberBean member = memberDao.getMemberInfo(mb);
		
		if(member!=null) {
			String _name = member.getName();
			if(_name.equals("어드민")) {
			
				out.print("<script>alert('어드민님 환영합니다. 관리지 페이지로 이동합니다.');</script>");
				out.flush();
				 session.setAttribute("myemail", member.getEmail());
			     session.setAttribute("mynum", member.getNum());
				return "admini.mb";
			}else {
//				out.print("<script>alert("+_name+"'님 나믿따에 오신걸 환영합니다');</script>");
//				out.flush();
				 session.setAttribute("myemail", member.getEmail());
			     session.setAttribute("mynum", member.getNum());
				return "redirect:mainScreen.m";
			}
			 
		}else {
		out.print("<script>alert('가입하지 않은 회원입니다.');</script>");
			out.flush();
			return "login";
		}
		
	}
}
