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
import goodee.gdj58.online.service.TeacherService;
import goodee.gdj58.online.vo.Teacher;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	public String teacherList(Model model
							, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
							, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
							, @RequestParam(value = "searchWord", defaultValue = "") String searchWord) {
		// 디버깅
		log.debug("\u001B[31m" + currentPage + "<-- currentPage");
		log.debug("\u001B[31m" + rowPerPage + "<-- rowPerPage");
		log.debug("\u001B[31m" + searchWord + "<-- searchWord");
		
		// 강사 리스트
		List<Teacher> list = teacherService.getTeacherList(currentPage, rowPerPage, searchWord);
		
		// 강사 데이터 개수
		int cntTeacher = teacherService.countTeacher(searchWord);
		log.debug("\u001B[31m" + cntTeacher + "<-- cntTeacher");
		
		// 페이징
		int lastPage = cntTeacher / rowPerPage;
		if(lastPage % rowPerPage != 0 || lastPage == 0) { // 데이터 개수가 rowPerPage보다 적을때 lastPage가 0으로 나옴
			lastPage++;
		}
		
		int showPage = 10;
		int startPage = ((currentPage - 1) / showPage) * showPage + 1;
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage;
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		log.debug("\u001B[31m" + lastPage + "<-- lastPage");
		
		boolean prev = (currentPage == 1 || startPage == 1) ? false : true;
		boolean next = (currentPage == lastPage || endPage == lastPage) ? false : true;
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		
		return "employee/teacherList";
	}
}
