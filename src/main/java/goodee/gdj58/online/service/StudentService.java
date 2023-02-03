package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.student.StudentMapper;
import goodee.gdj58.online.vo.Student;

@Service
@Transactional
public class StudentService {
	@Autowired StudentMapper studentMapper;
	
	// 학생 비밀번호 수정
	public int updateStudentPw(int studentNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("studentNo", studentNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		
		return studentMapper.updateStudentPw(paramMap);
	}
	
	// 학생 로그인
	public Student login(Student student) {
		return studentMapper.login(student);
	}
	
	// 학생 삭제
	public int deleteStudent(int studentNo) {
		return studentMapper.deleteStudent(studentNo);
	}
	
	// 학생 등록
	public int insertStudent(Student student) {
		return studentMapper.insertStudent(student);
	}
	
	// 학생 데이터 총 개수
	public int countStudent(String searchWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchWord", searchWord);
		return studentMapper.countStudent(paramMap);
	}
	
	// 학생 리스트
	public List<Student> getSelectStudentList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return studentMapper.selectStudentList(paramMap);
	}
}
