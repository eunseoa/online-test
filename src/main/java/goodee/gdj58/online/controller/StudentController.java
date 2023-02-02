package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 학생 로그인
	@GetMapping("/loginStudent")
	public String login() {
		return "student/loginStudent";
	}
	
	@PostMapping("/loginStudent")
	public String login(HttpSession session, Student student) {
		Student resultStudent = studentService.login(student);
		session.setAttribute("loginStudent", resultStudent);
		
		return "redirect:/loginStudent";
	}
	
	// 학생 삭제
	@GetMapping("/employee/student/removeStudent")
	public String removeStudent(@RequestParam(value="studentNo") int studentNo) {
		int row = studentService.deleteStudent(studentNo);
		if(row == 0) {
			System.out.println("학생 삭제 실패");
		} else {
			System.out.println("학생 삭제 성공");
		}
		
		return "redirect:/employee/student/studentList";
	}
	
	// 학생 등록
	@GetMapping("/employee/student/addStudent")
	public String addStudent() {
		return "employee/addStudent";
	}
	
	@PostMapping("/employee/student/addStudent")
	public String addStudent(HttpSession session, Student student) {
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
		
		return "redirect:/employee/student/studentList";
	}
	
	// 학생 리스트
	@GetMapping("/employee/student/studentList")
	public String studentList(Model model
							, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value="rowPerPage", defaultValue = "10") int rowPerPage) {
		List<Student> list = studentService.getSelectStudentList(currentPage, rowPerPage);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		
		return "employee/studentList";
	}
}
