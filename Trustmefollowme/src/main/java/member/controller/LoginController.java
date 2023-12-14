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
			if(_name.equals("����")) {
			
				out.print("<script>alert('���δ� ȯ���մϴ�. ������ �������� �̵��մϴ�.');</script>");
				out.flush();
				 session.setAttribute("myemail", member.getEmail());
			     session.setAttribute("mynum", member.getNum());
				return "admini.mb";
			}else {
//				out.print("<script>alert("+_name+"'�� ���ϵ��� ���Ű� ȯ���մϴ�');</script>");
//				out.flush();
				 session.setAttribute("myemail", member.getEmail());
			     session.setAttribute("mynum", member.getNum());
				return "redirect:mainScreen.m";
			}
			 
		}else {
		out.print("<script>alert('�������� ���� ȸ���Դϴ�.');</script>");
			out.flush();
			return "login";
		}
		
	}
}
