package goodee.gdj58.online.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Repository
@Data
public class Test {
	private int testNo;
	private String testTitle;
	private String createdate;
}
