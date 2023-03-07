package goodee.gdj58.online.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.online.service.EmployeeService;
import goodee.gdj58.online.service.IdService;
import goodee.gdj58.online.vo.Employee;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	@Autowired IdService idService;
	
	// 비밀번호 수정
	// 수정 form으로 감
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		return "employee/modifyEmpPw";
	}
	// 수정 Action
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
							// required = true는 null이 들어올 수 없게함
							, @RequestParam(value="oldPw") String oldPw
							, @RequestParam(value="newPw") String newPw) {
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		
		return "redirect:/employee/empList";
	}
	
	// 로그인
	@GetMapping("/loginEmp")
	public String loginEmp() {
		return "employee/loginEmp";
	}
	
	@PostMapping("/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {
		Employee resultEmp = employeeService.login(emp);
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/loginEmp";
	}
	
	/*
		로그인 후에 사용가능한 기능
	 */
	
	// 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(HttpSession session, @RequestParam("empNo") int empNo) {
		int row = employeeService.removeEmployee(empNo);
		if(row == 1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		return "redirect:/employee/empList"; // 리스트로 리다이렉트
	}
	
	// 등록
	@GetMapping("/employee/addEmp")
	public String addEmp() {
		return "employee/addEmp"; // forword
	}
	
	@PostMapping("/employee/addEmp")
	public String addEmp(Model model, Employee employee) {
		String idCehck = idService.getIdCheck(employee.getEmpId());
		if(idCehck != null) {
			model.addAttribute("errorMsg", "중복된 ID");
			return "employee/addEmp";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 0) {
			model.addAttribute("errorMsg", "시스템에러로 등록실패");
			System.out.println("등록 실패");
		} else {
			System.out.println("등록 성공");
		}
		return "redirect:/employee/empList"; //sendRedirect, CM -> C
	}
	
	// 관리자 리스트
	@GetMapping("/employee/empList")
	public String empList(Model model
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage
						, @RequestParam(value = "searchWord", defaultValue = "") String searchWord) { 
						// int currentPage = Integer.parseInt(request.getParamenter(""));
		
		// 디버깅
		log.debug("\u001B[31m" + currentPage + "<-- currentPage");
		log.debug("\u001B[31m" + rowPerPage + "<-- rowPerPage");
		log.debug("\u001B[31m" + searchWord + "<-- searchWord");
		
		// 관리자 리스트
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage, searchWord);
		
		// emp 데이터 개수
		int empCnt = employeeService.countEmp(searchWord);
		
		// 페이징
		int lastPage = empCnt / rowPerPage; // 마지막 페이지, 페이지 개수
		if(empCnt % rowPerPage != 0) {
			lastPage++;
		}
		
		int showPage = 10; // 한 페이지에 출력할 버튼 개수
		int startPage = ((currentPage - 1) / showPage) * showPage + 1;  // 시작페이지
		int endPage = (((currentPage - 1) / showPage) + 1) * showPage; // 마지막 버튼 페이지
		// lastPage가 endPage보다 작을 경우 lastPage로 바꿔줌
		if(lastPage < endPage) {
			endPage = lastPage;
		}
		
		// 이전 버튼 활성하
		boolean prev = (startPage == 1) ? false : true;
		// 다음 버튼 활성화
		boolean next = (endPage == lastPage) ? false : true;
		
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("showPage", showPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		return "employee/empList";
	}
}
