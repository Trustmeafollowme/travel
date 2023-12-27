package myjourney.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import member.model.MemberDao;
import myjourney.model.MyJourneyDao;

@Controller
public class MyJourneySaveController {
   private final String command = "saveMyjourney.mj";
   private final String gotoPage = "mainScreen.m";
   
   @Autowired
   private MyJourneyDao myJourneyDao;
   
   @Autowired
   MemberDao mDao;
   
   @RequestMapping(command)
   public void saveMJ(HttpSession session, HttpServletResponse response) {
      response.setContentType("text/html;charset=UTF-8");
      String id = (String) session.getAttribute("myemail");
      System.out.println("saveMJ id:"+id);
       
      // jnum=0? check
      int tCheck = myJourneyDao.searchJnumZero(id);
      System.out.println("saveMJ tCheck:"+tCheck);
      if(tCheck > 0) { // myJourney에 jnum=0 있으면
         mDao.updateMyjNum(id);
      }
      int jnum = mDao.getMyjNum(id);
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("id", id);
      map.put("jnum", jnum+1);
      myJourneyDao.updateMJList(id);
      int cnt = myJourneyDao.saveMyJourney(map);
      PrintWriter out;
      if (cnt > 0) {    
         try {
            out = response.getWriter();
            out.write("<script>alert('여정을 생성하였습니다.');location.href='"+gotoPage+"'</script>");
            out.flush();
         } catch (IOException e) {
            e.printStackTrace();
         }
      }else {
         try {
            out = response.getWriter();
            out.write("<script>alert('여정을 생성하지 못했습니다.');history.go(-1);</script>");
            out.flush();
         } catch (IOException e) {
            e.printStackTrace();
         }
      }
   }
}