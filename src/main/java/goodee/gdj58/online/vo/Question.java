package goodee.gdj58.online.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class Question {
	private int questionNo;
	private int testNo;
	private int questionIdx;
	private String questionTitle;
}
