package member.controller; 

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import member.model.MemberBean;
import member.model.MemberDao;

@Controller
public class ChangePasswordController {
	private final String command = "changePw.mb";
	private final String gotoPage = "redirect:myPage.mb";
	
	@Autowired
	private MemberDao mDao;
	
	@RequestMapping(value = command, method = RequestMethod.POST)
	public void changePw(HttpSession session, HttpServletResponse response,
						@RequestParam("password") String cpw,
						@RequestParam("newpassword") String password){
		response.setContentType("text/html; charset=UTF-8");
		
		String email = (String) session.getAttribute("myemail");
		
		System.out.println("password:"+password);
		System.out.println("email:"+email);
		
		
		MemberBean mb = mDao.getMemberInfoByMyEmail(email);
		
		int cnt = 0;
		PrintWriter out = null;
		
		if(mb.getPassword().equals(cpw)) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("password", password);
			
			cnt = mDao.changePw(map);
			try {
				out = response.getWriter();
				if(cnt > 0) {
		            out.println("<script type='text/javascript'>");
		            out.println("alert('��й�ȣ�� �����Ͽ����ϴ�.');");
		            out.println("window.location.href = '"+gotoPage+"';");
		            out.println("</script>");
		            out.flush();
				}else {
					out.println("<script type='text/javascript'>");
		            out.println("alert('��й�ȣ ������ �����Ͽ����ϴ�.');");
		            out.println("window.location.href = '"+gotoPage+"';");
		            out.println("</script>");
					out.flush();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			try {
				out = response.getWriter();
				out.println("<script type='text/javascript'>");
	            out.println("alert('���� ��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
	            out.println("window.location.href = '"+gotoPage+"';");
	            out.println("</script>");
				out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}