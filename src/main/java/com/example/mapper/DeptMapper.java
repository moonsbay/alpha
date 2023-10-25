package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.example.model.Dept;

@Mapper

public interface DeptMapper {

	@Select("select * from dept")	
	List<Dept> selectAll();
	
	@Select("""
			select *
			from dept
			where dname like '%${search}%'    
			""")  //바로 밑의 String search이다
	List<Dept> selectByDname(String search);
	
	@Insert("""
			insert into dept
			values (
				#{deptno},
				#{dname},
				#{loc}
			)
			""")
	int insert(Dept dept);     //java에서 insert명령을 사용하게 하는 것,, 위의 @Insert안의 sql문이 동작하게 되는 것
	
	@Update("""
				update dept
				  set dname = #{dname},
				        loc = #{loc}
			   where deptno = #{deptno}   
			""")
	int update(Dept dept);    //java에서 update명령을 사용하게 하는 것,, 위의 @Insert안의 sql문이 동작하게 되는 것
	
	@Delete("delete from dept where deptno=#{deptno}")
	int delete(Dept dept);
}
