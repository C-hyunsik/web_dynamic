package member.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class MemberDTO {
	private String name, id, pwd, gender, email1, email2;
	private String tel1, tel2, tel3, zipcode, addr1, addr2, logtime;
}
