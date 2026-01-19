package com.sist.web.login.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.UsersVO;

@Repository
@Mapper
public interface LoginMapper {
	// <회원가입> 회원가입
	@Insert("INSERT INTO users(uno, id, pwd, name, phone, email, role, status, required_agree, optional_agree) "
			+ "VALUES(users_uno_seq.NEXTVAL, #{id}, #{pwd}, #{name}, #{phone}, #{email}, 'USER_ROLE', 'ACTIVE', #{required_agree}, #{optional_agree})")
	public void registerInsert(UsersVO vo);

	// <회원가입> 비밀번호 회원가입하면서 검사 하는 부분
	
	// <회원가입> 닉네임 중복 체크
	@Select("SELECT COUNT(*) "
			+ "FROM users "
			+ "WHERE name = #{name}")
	public int registerUserNameCheck(String name);
	
	@Select("SELECT uno, id, pwd, name, phone, email "
			+ "FROM users "
			+ "WHERE id = #{id}")
	public UsersVO loginInfoData(String id);
	
	// <회원가입> 아이디 중복 체크
	@Select("SELECT COUNT(*) "
			+ "FROM users "
			+ "WHERE id = #{id}")
	public int loginIdCheck(String id);	
	
	// <회원가입> 이메일 중복 체크
	@Select("SELECT COUNT(*) "
			+ "FROM users "
			+ "WHERE email = #{email}")
	public int registerEmailCheck(String email);
	
	// <비밀번호 찾기> 비밀번호 바꾸기
	@Update("UPDATE users SET pwd = #{pwd} WHERE id = #{id}")
	public void pwdReset(@Param("pwd") String pwd, @Param("id") String id);
	
}
