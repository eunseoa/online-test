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
import goodee.gdj58.online.vo.Employee;

@Controller
public class EmployeeController {
	@Autowired 
	EmployeeService employeeService;
	
	// 비밀번호 수정
	// 수정 form으로 감
	@GetMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session) {
		// 로그인 후 호춫가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		return "employee/modifyEmpPw";
	}
	// 수정 Action
	@PostMapping("/employee/modifyEmpPw")
	public String modifyEmpPw(HttpSession session
							// required = true는 null이 들어올 수 없게함
							, @RequestParam(value="oldPw") String oldPw
							, @RequestParam(value="newPw") String newPw) {
		// 로그인 후 호춫가능
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/loginEmp";
		}
		
		employeeService.updateEmployeePw(loginEmp.getEmpNo(), oldPw, newPw);
		
		return "employee/modifyEmpPw";
	}
	
	// 로그인
	@GetMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session) {
		// 이미 로그인되어있으면 empList로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		return "employee/loginEmp";
	}
	
	@PostMapping("/employee/loginEmp")
	public String loginEmp(HttpSession session, Employee emp) {
		Employee resultEmp = employeeService.login(emp);
		if(resultEmp == null) { // 로그인 실패
			return "redirect:/employee/loginEmp";
		}
		session.setAttribute("loginEmp", resultEmp);
		return "redirect:/employee/empList";
	}
	
	// 로그아웃
	@GetMapping("/employee/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/employee/loginEmp";
	}
	
	/*
		로그인 후에 사용가능한 기능
	 */
	
	// 삭제
	@GetMapping("/employee/removeEmp")
	public String removeEmp(HttpSession session, @RequestParam("empNo") int empNo) {
		// 이미 로그인되어있으면 empList로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		
		int row = employeeService.removeEmployee(empNo);
		if(row == 1) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		return "redirect:/employee/empList"; // 리스트로 리다이렉트
	}
	
	// 입력
	@GetMapping("/employee/addEmp")
	public String addEmp(HttpSession session) {
		// 이미 로그인되어있으면 empList로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		
		return "employee/addEmp"; // forword
	}
	@PostMapping("/employee/addEmp")
	public String addEmp(HttpSession session, Employee employee) {
		// 이미 로그인되어있으면 empList로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp != null) {
			return "redirect:/employee/empList";
		}
		
		int row = employeeService.addEmployee(employee);
		if(row == 1) {
			System.out.println("입력 성공");
		} else {
			System.out.println("입력 실패");
		}
		return "redirect:/employee/empList"; //sendRedirect, CM -> C
	}
	
	// 리스트
	@GetMapping("/employee/empList")
	public String empList(HttpSession session
						, Model model
						, @RequestParam(value = "currentPage", defaultValue = "1") int currentPage
						, @RequestParam(value = "rowPerPage", defaultValue = "10") int rowPerPage) { 
		// 이미 로그인되어있으면 empList로
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(loginEmp == null) {
			return "redirect:/employee/empLogin";
		}
		
							// int currentPage = Integer.parseInt(request.getParamenter(""));
		List<Employee> list = employeeService.getEmployeeList(currentPage, rowPerPage);
		// request.setAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		return "employee/empList";
	}
}
