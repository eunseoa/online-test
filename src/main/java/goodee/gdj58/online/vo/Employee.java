package goodee.gdj58.online.vo;

import lombok.Data;

@Data // 롬복 : 필수적인 메소드를 오버라이딩 해줌 (@ToString, @Getter , @Setter, @EqualsAndHashCode, @RequiredArgsConstructor)
public class Employee {
	private int empNo;
	private String empId;
	private String empPw;
	private String empName;
}
