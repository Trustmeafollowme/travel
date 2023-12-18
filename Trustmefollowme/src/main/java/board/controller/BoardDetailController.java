package board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import board.model.BoardBean;
import board.model.BoardDao;
import board.model.ChatBean;
import board.model.LikeBean;

@Controller
public class BoardDetailController {

    private final String command = "/boardDetail.bd";
    private final String viewPage = "boardDetailForm";

    @Autowired
    private BoardDao boardDao;

    @RequestMapping(value = command, method = RequestMethod.GET)
    public String boardDetailForm(Model model, @RequestParam("num") int num, LikeBean lb) {

        BoardBean bb = boardDao.boardDetail(num);
        model.addAttribute("bb", bb);

        Map<String, Integer> map = new HashMap<String, Integer>();
        map.put("b_num", num);
        map.put("m_num", 1);
        
        
        int likecount = boardDao.likeCount(num); // ���ƿ� ����
        
        LikeBean likeInfo = boardDao.findLike(map); // ���ƿ� ��� ����
        if (likeInfo == null) {
            int cnt = boardDao.likeInsert(map);
            if (cnt != -1) {
                LikeBean getInfo = boardDao.findLike(map);
                model.addAttribute("likeInfo", getInfo);
            }
        } else {
            model.addAttribute("likeInfo", likeInfo); 
        }											// ���ƿ� ��� ��
        
        model.addAttribute("likecount", likecount); // ���ƿ� ���� �Ӽ�
        
        
        List<ChatBean> lists = boardDao.chatList(num);
        model.addAttribute("lists", lists);
        
        return viewPage;
    }
}