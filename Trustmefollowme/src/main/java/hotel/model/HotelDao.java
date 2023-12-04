package hotel.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("hotelDao")
public class HotelDao {
	private final String namespace = "hotel.Hotel";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
