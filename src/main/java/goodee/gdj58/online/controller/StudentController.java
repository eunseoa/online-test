package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.mapper.id.IdMapper;
import goodee.gdj58.online.service.StudentService;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Student;



@Controller
public class StudentController {
	@Autowired StudentService studentService;
	@Autowired IdMapper idMapper;
	
	// 학생 삭제
	@GetMapping("/student/removeStudent")
	public String removeStudent(HttpSession session, @RequestParam(value="studentNo") int studentNo) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		int row = studentService.deleteStudent(studentNo);
		if(row == 0) {
			System.out.println("학생 삭제 실패");
		} else {
			System.out.println("학생 삭제 성공");
		}
		
		return "redirect:/student/studentList";
	}
	
	// 학생 등록
	@GetMapping("/student/addStudent")
	public String addStudent(HttpSession session) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "student/addStudent";
	}
	
	@PostMapping("/student/addStudent")
	public String addStudent(HttpSession session, Student student) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		// 중복아이디 검사
		String idCheck = idMapper.selectIdCheck(student.getStudentId());
		if(idCheck != null) {
			session.setAttribute("errorMsg", "중복된 ID");
			return "teacher/addTeacher";
		}
		
		int row = studentService.insertStudent(student);
		if(row == 0) {
			System.out.println("학생 등록 실패");
			session.setAttribute("errorMsg", "시스템에러로 등록 실패");
		} else {
			System.out.println("학생 등록 성공");
		}
		
		return "redirect:/student/studentList";
	}
	
	// 학생 리스트
	@GetMapping("/student/studentList")
	public String studentList(HttpSession session
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) {
		// 비로그인시 로그인폼으로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		List<Student> list = studentService.getSelectStudentList(currentPage, rowPerPage);
		session.setAttribute("list", list);
		session.setAttribute("currentPage", currentPage);
		
		return "student/studentList";
	}
}
