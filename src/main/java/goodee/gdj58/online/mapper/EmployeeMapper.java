package goodee.gdj58.online.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.online.vo.Employee;

@Mapper
public interface EmployeeMapper {
	int updateEmployeePw(Map<String, Object> paramMap);
	Employee login(Employee employee);
	int deleteEmployee(int empNo);
	int insetEmployee(Employee employee);
	// 추상메소드
	List<Employee> selectEmployeeList(Map<String, Object> paramMap);
}
