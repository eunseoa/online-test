package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.mapper.id.IdMapper;
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;


	
@Controller
public class TeacherController {
	@Autowired TeacherService teacherService;
	@Autowired private IdMapper idMapper;
	
	// 강사 로그인
	@GetMapping("/loginTeacher")
	public String login() {
		return "teacher/loginTeacher";
	}
	
	@PostMapping("/loginTeacher")
	public String login(HttpSession session, Teacher teacher) {
		Teacher resultTeacher = teacherService.login(teacher);
		session.setAttribute("loginTeacher", resultTeacher);
		
		return "redirect:/loginTeacher";
	}
	
	// 강사 비밀번호 수정
	@GetMapping("/teacher/removeTeacher")
	public String modifyTeacher(HttpSession session) {
		// 비로그인시 로그인폼으로
		Teacher teacher = (Teacher)session.getAttribute("loginTeacher");
		if(teacher == null) {
			return "redirect:/teacher/loginTeacher";
		}
		
		return "teacher/modifyTeacherPw";
	}
	
	// 강사 삭제
	@GetMapping("/employee/teacher/removeTeacher")
	public String deleteTeacher(HttpSession session, @RequestParam("teacherNo") int teacherNo) {
		int row = teacherService.deleteTeacher(teacherNo);
		if(row == 0) {
			System.out.println("강사 삭제 실패");
		} else {
			System.out.println("강사 삭제 성공");
		}
		
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 깅사 등록
	@GetMapping("/employee/teacher/addTeacher")
	public String insertTeacher(HttpSession session) {
		return "employee/addTeacher"; // forword
	}
	
	@PostMapping("/employee/teacher/addTeacher")
	public String insertTeacher(HttpSession session, Teacher teacher) {
		// 중복아이디 검사
		String idCheck = idMapper.selectIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			session.setAttribute("errorMsg", "중복된 ID");
			return "employee/addTeacher";
		}
		
		int row = teacherService.insertTeacher(teacher);
		if(row == 0) {
			System.out.println("강사 등록 실패");
			session.setAttribute("errorMsg", "시스템에러로 등록실패");
		} else {
			System.out.println("강사 등록 성공");
		}
		
		return "redirect:/employee/teacher/teacherList";
	}
	
	// 강사 리스트 출력
	@GetMapping("/employee/teacher/teacherList")
	public String teacherList(HttpSession session
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) {
		
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage);
		session.setAttribute("list", list);
		session.setAttribute("currentPage", currentPage);
		
		return "employee/teacherList";
	}
}
