package hotel.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("hotelDao")
public class HotelDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
