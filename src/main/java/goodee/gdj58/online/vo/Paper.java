package goodee.gdj58.online.vo;

import lombok.Data;

@Data
public class Paper {
	private int paperNo;
	private int testNo;
	private int studentNo;
	private int questionNo;
	private int answer;
	private String answerOx;
	private int answerScore;
}
