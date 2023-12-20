package member.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import hotel.model.HotelBean;

@Component("memberDao")
public class MemberDao {

	private final String namespace = "member.Member";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int findEmail(String inputemail) {
		int cnt = sqlSessionTemplate.selectOne(namespace+".findEmail",inputemail);
		return cnt;
	}

	public void insertMember(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".insertMember",mb);
	}


	public MemberBean getMemberInfo(MemberBean mb) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace+".getMemberInfo",mb);
		return member;
	}

	public List<MemberBean> findPassword(MemberBean mb) {
		List<MemberBean>lists = new ArrayList<MemberBean>();
		lists = sqlSessionTemplate.selectList(namespace+".findPassword",mb);
		return lists;
	}

	public MemberBean getMemberByEmail(String kakaoEmail) {
		MemberBean member = sqlSessionTemplate.selectOne(namespace + ".getMemberByEmail", kakaoEmail);
		return member;
	}

	public List<MemberBean> getAllMember() {
		List<MemberBean> list = sqlSessionTemplate.selectList(namespace+".getAllMember");
		System.out.println("lists.size()"+list.size());
		return list;
	}

	public int getMyjNum(String myemail) {
		int myjNum = sqlSessionTemplate.selectOne(namespace+".getMyjNum",myemail);
		return myjNum;
	}

	public void updateMyjNum(String myemail) {
		sqlSessionTemplate.selectOne(namespace+".updateMyjNum",myemail);
		
	}

	
	
}
