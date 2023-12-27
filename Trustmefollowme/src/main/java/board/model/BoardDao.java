package board.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("boardDao")
public class BoardDao {
	private final String namespace = "board.Board";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<BoardBean> boardList(Map<String, String> map) {
		
		List<BoardBean> lists = sqlSessionTemplate.selectList(namespace+".boardList",map);

		return lists;
	}

	public void boardInsert(BoardBean bb) {
		
		sqlSessionTemplate.insert(namespace+".boardInsert",bb);
		
	}

	public BoardBean boardDetail(String num) {
		
		sqlSessionTemplate.update(namespace+".readCount",num);
		
		BoardBean bb = sqlSessionTemplate.selectOne(namespace+".boardDetail",num);
		
		return bb;
	}

	public BoardBean oneData(int num) {
		
		BoardBean bb = sqlSessionTemplate.selectOne(namespace+".oneData",num);
		
		return bb;
	}

	public void boardUpdate(BoardBean bb) {
		
		sqlSessionTemplate.update(namespace+".boardUpdate",bb);
		
	}

	public void boardDelete(int num) {
		
		sqlSessionTemplate.delete(namespace+".boardDelete",num);
		
	}

	public LikeBean findLike(Map<String, String> map) {
		
		LikeBean lb = sqlSessionTemplate.selectOne(namespace+".findLike",map);
		
		return lb;
	}

	public int likeInsert(Map<String, String> map) {
		
		int cnt = -1;
		
		cnt = sqlSessionTemplate.insert(namespace+".likeInsert",map);
		
		return cnt;
	}

	public void likeUp(LikeBean likeInfo) {
		
		sqlSessionTemplate.update(namespace+".likeUp",likeInfo);
		
	}

	public void likeDown(LikeBean likeInfo) {
		
		sqlSessionTemplate.update(namespace+".likeDown",likeInfo);
		
	}

	public int likeCount(String num) {
		
		int cnt = sqlSessionTemplate.selectOne(namespace+".likeCount",num);
		
		return cnt;
	}
	
	public void chatInsert(ChatBean cb) {
		
		sqlSessionTemplate.insert(namespace+".chatInsert",cb);
		
	}
	
	public void replyInsert(ChatBean cb) {
		
		sqlSessionTemplate.insert(namespace+".replyInsert",cb);
		
		sqlSessionTemplate.update(namespace+".replyUpdate",cb);
		
	}

	public List<ChatBean> chatList(String num) {
		
		List<ChatBean> lists = sqlSessionTemplate.selectList(namespace+".chatList",num);
		
		return lists;
	}

	public List<LikeBean> likeTotalCount(Map<String, Integer> map2) {
		
		List<LikeBean> lb = sqlSessionTemplate.selectList(namespace+".likeTotalCount",map2);
		
		return lb;
	}

	public int replyDelete(Map<String, Integer> map) {
		
		int cnt = sqlSessionTemplate.delete(namespace+".replyDelete",map);
		
		return cnt;
	}

	public int replyAllDelete(Map<String, Integer> map) {
		
		int cnt = sqlSessionTemplate.delete(namespace+".replyAllDelete",map);
		
		return cnt;
	}
	
	public ChatBean getData(int chatnum) {
		
		ChatBean cb = sqlSessionTemplate.selectOne(namespace+".getData",chatnum);
		
		return cb;
	}

	public int chatUpdate(ChatBean cb) {
		
		int cnt = sqlSessionTemplate.update(namespace+".chatUpdate",cb);
		
		return cnt;
	}

	public ChatBean getContext(ChatBean cb2) {
		
		ChatBean cb = sqlSessionTemplate.selectOne(namespace+".getContext",cb2);
		
		return cb;
	}

	public List<BoardBean> likesList() {
		
		List<BoardBean> lists = sqlSessionTemplate.selectList(namespace+".likesList");
		
		return lists;
	}

	public List<BoardBean> readcountList() {
		
		List<BoardBean> lists = sqlSessionTemplate.selectList(namespace+".readcountList");
		
		return lists;
	}

}
