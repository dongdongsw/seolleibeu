package com.sist.web.login.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.UsersVO;

@Repository
@Mapper
public interface LoginMapper {

	@Insert("INSERT INTO users(uno, id, pwd, name, phone, email, role, status, required_agree, optional_agree) "
			+ "VALUES(users_uno_seq.NEXTVAL, #{id}, #{pwd}, #{name,}, #{phone}, #{email}, 'USER', 'ACTIVE', #{required_agree}, #{optional_agree})")
	public void registerInsert(UsersVO vo);

	
	@Select("SELECT uno, id, pwd, name, phone, email "
			+ "FROM users "
			+ "WHERE id = #{id}")
	public UsersVO loginInfoData(String id);
	
	// 중복 체크
	@Select("SELECT COUNT(*) "
			+ "FROM users "
			+ "WHERE id = #{id}")
	public int loginIdCheck(String id);	
	
}
