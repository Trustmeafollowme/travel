package restaurant.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("RestaurantDao")
public class RestaurantDao {
	private final String namespace = "restaurant.Restaurant";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<RestaurantBean> restList(Map<String, String> map,Paging pageInfo) {
		
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<RestaurantBean> lists = sqlSessionTemplate.selectList(namespace+".restList",map,rowBounds);
		
		return lists;
	}
	
	public int totalCount(Map<String, String> map) {
		
		int cnt = sqlSessionTemplate.selectOne(namespace+".totalCount",map);
		
		return cnt;
	}

	public RestaurantBean restDetail(int rnum) {
		
		RestaurantBean rb = sqlSessionTemplate.selectOne(namespace+".restDetail",rnum);
		
		return rb;
	}

	public void restInsert(RestaurantBean rb) {
		
		sqlSessionTemplate.insert(namespace+".restInsert",rb);

	}
}
