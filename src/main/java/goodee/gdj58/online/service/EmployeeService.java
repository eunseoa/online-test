package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.EmployeeMapper;
import goodee.gdj58.online.mapper.IdMapper;
import goodee.gdj58.online.vo.Employee;

@Service
@Transactional // 예외가 발생했을때 db에서 롤백하는게 아니라 spring 메소드에서 취소 시킴
public class EmployeeService {
	// DI new EmployeeMapper()
	@Autowired // EmployeeMapper에 들어갈 수 있는 객체를 찾고 강제로 주입
	private EmployeeMapper employeeMapper;
	@Autowired
	private IdMapper idMapper;
	
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
		// id값이 null일때 사용가능한 id
		String id = idMapper.selectId(employee.getEmpId());
		
		return employeeMapper.insetEmployee(employee);
	}
	
	// emp리스트
	public List<Employee> getEmployeeList(int currentPage, int rowPerPage) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		return employeeMapper.selectEmployeeList(paramMap);
	}
}
