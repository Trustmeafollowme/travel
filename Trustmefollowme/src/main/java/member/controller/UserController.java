package member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.neo4j.Neo4jProperties.Authentication;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.model.KakaoProfile;
import member.model.MemberBean;
import member.model.MemberDao;
import member.model.OAuthToken;
@Controller
public class UserController {
	@Autowired
	private MemberDao memberDao;

	@Autowired
	private KakaoAPI kakaoAPI;
	@Autowired
	private OAuthToken oauthToken;
	
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
			
				/*
				 * out.print("<script>alert('���δ� ȯ���մϴ�. ������ �������� �̵��մϴ�.');</script>");
				 * out.flush();
				 */
				 session.setAttribute("myemail", member.getEmail());
//			     session.setAttribute("mynum", member.getNum());
				return "adminMainForm";
			}else {
//				out.print("<script>alert("+_name+"'�� ���ϵ��� ���Ű� ȯ���մϴ�');</script>");
//				out.flush();
				 session.setAttribute("myemail", member.getEmail());
//			     session.setAttribute("mynum", member.getNum());
				return "redirect:mainScreen.m";
			}
			 
		}else {
		out.print("<script>alert('�������� ���� ȸ���Դϴ�.');</script>");
			out.flush();
			return "login";
		}

	    }
	

	@RequestMapping("/kakao-login.mb")
	public String kakaoCallback(String code,MemberBean mb, Model model,HttpSession session) {//Data�� �������ִ� ��Ʈ�ѷ� �Լ�
		
		//Post������� key=value �����͸� ��û(īī��������)
		RestTemplate rt = new RestTemplate();
		
		//HttpHeaders ������Ʈ����
		HttpHeaders headers = new HttpHeaders();
		headers.add("Context-type","application/x-www-form-urlencoded;charset=utf-8");
		
		//HttpBody ������Ʈ ����
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		params.add("grant_type","authorization_code");
		params.add("client_id","3ebf8bbbb7b91d2e8e34c1ae7d68f0db");
		params.add("redirect_uri","http://localhost:8080/ex/kakao-login.mb");
		params.add("code",code);
		
		//HttpHeaders,HttpBody�� �ϳ��� ������Ʈ�� ���
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
		        new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		//http��û�ϱ� - Post�������- response ������ ������ ����
		ResponseEntity<String> response = rt.exchange(
			   "https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				kakaoTokenRequest,
				String.class
				);
		
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;
		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		System.out.println("īī�� ������ ��ū: "+oauthToken.getAccess_token());
		
		
		
		RestTemplate rt2 = new RestTemplate();
		
		//HttpHeaders ������Ʈ����
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
		headers2.add("Context-type","application/x-www-form-urlencoded;charset=utf-8");
		
		
		//HttpHeaders,HttpBody�� �ϳ��� ������Ʈ�� ���
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest2 = 
			    new HttpEntity<MultiValueMap<String, String>>(new LinkedMultiValueMap<String, String>(), headers2);
		
		//http��û�ϱ� - Post�������- response ������ ������ ����
		ResponseEntity<String> response2 = rt2.exchange(
			   "https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoProfileRequest2,
				String.class
				);
		
		
		ObjectMapper objectMapper2 = new ObjectMapper();
		KakaoProfile kakaoProfile= null;
		try {
			kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		//name.password,email
		System.out.println("īī�� ���̵�(��ȣ): "+kakaoProfile.getId());
		System.out.println("īī�� �̸���: "+kakaoProfile.getKakao_account().getEmail());
		
		System.out.println("�������� ��������: "+kakaoProfile.getKakao_account().getEmail()+"_"+kakaoProfile.getId());
		System.out.println("�������� �̸���: "+kakaoProfile.getKakao_account().getEmail());
//		UUID garbagePassword = UUID.randomUUID();
//		System.out.println("�������� ���� �н�����: "+garbagePassword);
		
		String kakaoEmail = kakaoProfile.getKakao_account().getEmail();
		
		// ȸ�� ���̺��� �ش� �̸��Ϸ� �˻�
		MemberBean existingMember = memberDao.getMemberByEmail(kakaoEmail);
		
	     if (existingMember != null) {
	            // �̹� ���Ե� ȸ���� ���, �α��� ó�� ���� �����ϰ� ���� �޽����� ��ȯ
	            model.addAttribute("message", "īī�� �α����� �Ϸ�Ǿ����ϴ�.");
	            session.setAttribute("myemail", kakaoEmail);
	            return "redirect:mainScreen.m";
	        } else {
	            // ���Ե��� ���� ȸ���� ���, ȸ������ ������ �̵�
	            model.addAttribute("myemail", kakaoEmail);
	            
	            return "join2";
	        }
}
	
	
//	 @RequestMapping(value = "/logout.mb", method = RequestMethod.GET)
//	    public String logout(HttpSession session, Model model) throws IOException {
//	        // ���ǿ��� �׼��� ��ū�� ������
//		  System.out.println("Logout request received."); // �α� �߰�
//	      
//		  String accessToken = (String) session.getAttribute("access_token");
//	        session.invalidate();
//	        // �׼��� ��ū�� �ִ��� Ȯ��
//	        if (accessToken != null) {
//	            // KakaoAPI���� �α׾ƿ��� �����մϴ�.
//	            kakaoAPI.kakaoLogout(accessToken);
//
//	            model.addAttribute("message", "�α׾ƿ��� �Ϸ�Ǿ����ϴ�.");
//	           
//	            // ���� ȭ������ �����̷�Ʈ
//	            return "redirect:mainScreen.m";
//	        } else {
//	            
//	            model.addAttribute("message", "�̹� �α׾ƿ��Ǿ��ų� �α������� �ʾҽ��ϴ�.");
//	            return "redirect:mainScreen.m"; // ���� ȭ���̳� �α��� ȭ������ �����̷�Ʈ�մϴ�.
//	        }
//	    }
//	
	 @RequestMapping(value = "/logout.mb", method = RequestMethod.GET)
	  public String logout(HttpSession session, Model model) throws IOException {
		 
		 String access_Token = (String)session.getAttribute("access_Token");
		 session.invalidate();
		 System.out.println("���Ǹ����");
		   if(access_Token != null && !"".equals(access_Token)){
	            kakaoAPI.kakaoLogout(access_Token);
	            session.removeAttribute("access_Token");
	            session.removeAttribute("myemail");
	            session.invalidate();
	            
	        }else{
	            System.out.println("access_Token is null");
	            
	        }
		   return "redirect:mainScreen.m";
	 }
	 
	
	
}




















