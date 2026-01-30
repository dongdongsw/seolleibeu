package com.sist.web.mypage.restcontroller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

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
    @Value("${file.upload.profile}")
    private String uploadDir;

    @PostMapping("/mypage/profile_upload_ok")
    public ResponseEntity<String> profile_upload_ok(
            @RequestParam("profile") MultipartFile profile,
            HttpSession session
    ) {
        try {
            if (profile.isEmpty()) {
                return ResponseEntity.badRequest().body("파일 없음");
            }

            Integer uno = (Integer) session.getAttribute("uno");
            if (uno == null) {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("로그인 필요");
            }

            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String oname = profile.getOriginalFilename();
            String ext = oname.substring(oname.lastIndexOf("."));
            String newName = UUID.randomUUID().toString() + ext;

            Path savePath = Paths.get(uploadDir, newName);
            Files.copy(
                profile.getInputStream(),
                savePath,
                StandardCopyOption.REPLACE_EXISTING
            );

            String urlPath = "/profile/" + newName;

            mService.profile_update(urlPath, uno);

            session.setAttribute("profile", urlPath);

            return ResponseEntity.ok(urlPath);

        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                                 .body("서버 오류");
        }
    }

    @DeleteMapping("/mypage/user_delete_vue/")
    public ResponseEntity<Map> user_delete_vue(
      HttpSession session
    )
    {
    	Map map=new HashMap();
    	try
    	{
    		Integer uno = (Integer)session.getAttribute("uno");
    		mService.userDelete(uno);
    		map.put("uno", uno);
    		session.invalidate();
    	}catch(Exception ex)
    	{
    		ex.printStackTrace();
    		return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
    	}
    	return new ResponseEntity<>(map,HttpStatus.OK);
    }
}
