package goodee.gdj58.online.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.teacher.TeacherMapper;
import goodee.gdj58.online.vo.Teacher;

@Service
@Transactional
public class TeacherService {
	@Autowired TeacherMapper teacherMapper;
	
	// 강사 비밀번호 수정
	public int updateTeacher(int teacherNo, String oldPw, String newPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("teacherNo", teacherNo);
		paramMap.put("oldPw", oldPw);
		paramMap.put("newPw", newPw);
		
		return teacherMapper.updateTeacherPw(paramMap);
	}
	
	// 강사 로그인
	public Teacher login(Teacher teacher) {
		return teacherMapper.login(teacher);
	}
	
	// 강사 삭제
	public int deleteTeacher(int teacherNo) {
		return teacherMapper.deleteTeacher(teacherNo);
	}
	
	// 강사 등록 
	public int insertTeacher(Teacher teacher) {
		return teacherMapper.insertTeacher(teacher);
	}
	
	// 강사 데이터 총 개수
	public int countTeacher(String searchWord) {
		return teacherMapper.countTeacher(searchWord);
	}
	
	// 강사 리스트
	public List<Teacher> getTeacherList(int currentPage, int rowPerPage, String searchWord) {
		int beginRow = (currentPage - 1) * rowPerPage;
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return teacherMapper.selectTeacherList(paramMap);
	}
}
