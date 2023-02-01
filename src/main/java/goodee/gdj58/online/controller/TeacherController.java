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
	
	// 강사 비밀번호 수정
	
	// 강사 삭제
	@GetMapping("/teacher/removeTeacher")
	public String deleteTeacher(HttpSession session, @RequestParam("teacherNo") int teacherNo) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		int row = teacherService.deleteTeacher(teacherNo);
		if(row == 0) {
			System.out.println("강사 삭제 실패");
		} else {
			System.out.println("강사 삭제 성공");
		}
		
		return "redirect:/teacher/teacherList";
	}
	
	// 깅사 등록
	@GetMapping("/teacher/addTeacher")
	public String insertTeacher(HttpSession session) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "teacher/addTeacher"; // forword
	}
	
	@PostMapping("/teacher/addTeacher")
	public String insertTeacher(HttpSession session, Teacher teacher) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		// 중복아이디 검사
		String idCheck = idMapper.selectIdCheck(teacher.getTeacherId());
		if(idCheck != null) {
			session.setAttribute("errorMsg", "중복된 ID");
			return "teacher/addTeacher";
		}
		
		int row = teacherService.insertTeacher(teacher);
		if(row == 0) {
			System.out.println("선생님 등록 실패");
			session.setAttribute("errorMsg", "시스템에러로 등록실패");
		} else {
			System.out.println("선생님 등록 성공");
		}
		
		return "redirect:/teacher/teacherList";
	}
	
	// 강사 리스트 출력
	@GetMapping("/teacher/teacherList")
	public String teacherList(HttpSession session
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage);
		session.setAttribute("list", list);
		session.setAttribute("currentPage", currentPage);
		
		return "teacher/teacherList";
	}
}
