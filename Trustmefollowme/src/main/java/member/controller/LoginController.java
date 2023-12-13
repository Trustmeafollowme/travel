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
			String _email = member.getEmail();
			if(_email.equals("admin@gmail.com")) {
			
				out.print("<script>alert('���δ� ȯ���մϴ�');</script>");
				out.flush();
				 session.setAttribute("myemail", member.getEmail());
			     session.setAttribute("mynum", member.getNum());
				return "mainScreen";
			}else {
				out.print("<script>alert('���ϵ��� ���Ű� ȯ���մϴ�');</script>");
				out.flush();
				 session.setAttribute("myemail", member.getEmail());
			     session.setAttribute("mynum", member.getNum());
				return "mainScreen";
			}
			 
		}else {
		out.print("<script>alert('�������� ���� ȸ���Դϴ�. ������������ �̵��ϰڽ��ϴ�');</script>");
			out.flush();
			return "join";
		}
		
	}
}
