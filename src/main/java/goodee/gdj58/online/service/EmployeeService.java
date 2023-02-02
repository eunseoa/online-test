package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.emp.EmployeeMapper;
import goodee.gdj58.online.mapper.id.IdMapper;
import goodee.gdj58.online.vo.Employee;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional // 예외가 발생했을때 db에서 롤백하는게 아니라 spring 메소드에서 취소 시킴
public class EmployeeService {
	// DI new EmployeeMapper()
	// EmployeeMapper에 들어갈 수 있는 객체를 찾고 강제로 주입
	@Autowired  private EmployeeMapper employeeMapper;
	@Autowired private IdMapper idMapper;
	
	// 비밀번호 수정
	public int updateEmployeePw(int empNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("empNo", empNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		
		return employeeMapper.updateEmployeePw(paramMap);
	}
	
	// 로그인
	public Employee login(Employee emp) {
		return employeeMapper.login(emp);
	}
	
	// 사원 삭제
	public int removeEmployee(int empNo) {
		return employeeMapper.deleteEmployee(empNo);
	}
	
	// 사원 추가
	public int addEmployee(Employee employee) {
		return employeeMapper.insetEmployee(employee);
	}
	
	// emp 데이터 총 개수
	public int countEmp(String searchWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchWord", searchWord);
		
		return employeeMapper.countEmp(paramMap);
	}
	
	// emp리스트
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return employeeMapper.selectEmployeeList(paramMap);
	}
}
