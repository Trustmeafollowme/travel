package restaurant.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("RestaurantDao")
public class RestaurantDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
