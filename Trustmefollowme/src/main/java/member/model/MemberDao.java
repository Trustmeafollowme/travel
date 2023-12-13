package member.model;

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
	
	
}
