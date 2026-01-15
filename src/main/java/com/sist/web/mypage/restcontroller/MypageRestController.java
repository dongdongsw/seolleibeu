package com.sist.web.mypage.restcontroller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.mypage.service.MypageService;
import com.sist.web.vo.UsersVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class MypageRestController {
	private final MypageService mService;
	
	@PostMapping("/mypage/mypagePwd")
    public ResponseEntity<Boolean> mypagePwd(
        @RequestParam("pwd") String pwd,
        HttpSession session
    )
	{
		try {
	        boolean result = mService.mypagePwd(pwd);

	        if (result) {
	            session.setAttribute("MYPAGE_PWD_OK", true);
	        }

	        return new ResponseEntity<>(result, HttpStatus.OK);
	    } catch (Exception ex) {
	        return new ResponseEntity<>(false, HttpStatus.INTERNAL_SERVER_ERROR);
	    }
    }
	
	// 닉네임 중복 확인
    @GetMapping("/mypage/mypagNameChk")
    public ResponseEntity<Boolean> checkNickname(
    	@RequestParam("name") String name,
        HttpSession session
    ) {
    	try {
            int uno = (Integer) session.getAttribute("uno");
            boolean result = mService.mypagNameChk(name, uno);

            return new ResponseEntity<>(result, HttpStatus.OK);
        } catch (Exception ex) {
            return new ResponseEntity<>(false, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    // 연락처 중복 확인
    @GetMapping("/mypage/mypagPhoneChk")
    public ResponseEntity<Boolean> checkPhone(
        @RequestParam("phone") String phone,
        HttpSession session
    ) {
    	try {
            int uno = (Integer) session.getAttribute("uno");
            boolean result = mService.mypagPhoneChk(phone, uno);

            return new ResponseEntity<>(result, HttpStatus.OK);
        } catch (Exception ex) {
            return new ResponseEntity<>(false, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PostMapping("/mypage/update")
    public ResponseEntity<Void> update(
        @RequestBody UsersVO vo,
        HttpSession session
    )
        {
         try {
            int uno = (Integer) session.getAttribute("uno");
            vo.setUno(uno);

            mService.mypageUpdate(vo);
            return new ResponseEntity<>(HttpStatus.OK);
         } catch (Exception ex) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
         }
     }
}
