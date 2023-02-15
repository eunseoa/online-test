package goodee.gdj58.online.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.online.mapper.paper.PaperMapper;
import goodee.gdj58.online.vo.Paper;

@Service
@Transactional
public class PaperService {
	@Autowired PaperMapper paperMapper;
	// 답안지 상세보기
	public List<Map<String, Object>> paperOne(Paper paper) {
		return paperMapper.paperOne(paper);
	}
	
	// 답안지 제출
	public int insertPaper(Paper paper) {
		return paperMapper.insertPaper(paper);
	}
}
