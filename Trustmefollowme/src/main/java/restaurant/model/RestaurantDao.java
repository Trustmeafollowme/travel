package restaurant.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("RestaurantDao")
public class RestaurantDao {
	private final String namespace = "restaurant.Restaurant";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<RestaurantBean> resList(Map<String, String> map) {
		
		
		List<RestaurantBean> lists = sqlSessionTemplate.selectList(namespace+".resList",map);
		
		return lists;
	}
}
