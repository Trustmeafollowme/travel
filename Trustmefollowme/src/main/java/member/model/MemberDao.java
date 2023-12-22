package member.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

	public int getMyjNum(String myemail) {
		int myjNum = sqlSessionTemplate.selectOne(namespace+".getMyjNum",myemail);
		return myjNum;
	}

	public void updateMyjNum(String myemail) {
		sqlSessionTemplate.selectOne(namespace+".updateMyjNum",myemail);
		
	}

	public MemberBean getMemberInfoByMyEmail(String myemail) {
		MemberBean mb = sqlSessionTemplate.selectOne(namespace+".getMemberInfoByMyEmail", myemail);
		return mb;
	}

	public int changePw(Map<String, String> map) {
		int cnt = sqlSessionTemplate.update(namespace+".changePw", map);
		return cnt;
	}

	public int updateProfile(MemberBean mb) {
		int cnt = sqlSessionTemplate.update(namespace+".updateProfile", mb);
		return cnt;
	}
	
	
}
