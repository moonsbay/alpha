package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.jdbc.SQL;

import com.example.model.City;

@Mapper
public interface CityMapper {
	@Select("select * from city order by id")
	List<City> selectAll();
	
	@Select("""
			select * 
			from city
            where countrycode = #{code, jdbcType=VARCHAR} 
			""")
         // where country_code = #{code, jdbcType=VARCHAR}	오라클

	
	List<City> selectAllByCode(String code);     // jdbcType=VARCHAR은 null이 들어왔을 때의 처리를 위함
//	@Select("select code, name from country")
	@Select("""
			select code as "code",
			       name as "name"
			from country
			""")   // 소문자로 조회하는 코드, EL에서도 접근하기 위해?
	List<Map<String, Object>> selectCountryCodes();//일부항목만 가져올 때 <Map..사용 임포트하여..
	
	
	@SelectProvider(type = SqlProvider.class, method = "searchAll")
	List<City> searchAll(String code, Long population);
	
	public static class SqlProvider{
		
		public static String searchAll(String code, Long population) {
			var s = new SQL();
			s.SELECT("*");
			s.FROM("city");
			if(code != null && !code.trim().equals(""))
//				s.WHERE(String.format("country_code = '%s'", code));   오라클
				s.WHERE(String.format("countrycode = '%s'", code));   //mysql
			if(population != null)
				s.WHERE(String.format("population >= %d", population));
			
			return s.toString();
		}
		
		
	}
	
	
	
}
