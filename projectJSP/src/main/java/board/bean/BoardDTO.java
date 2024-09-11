package board.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class BoardDTO {
	private int seq, ref, lev, step, pseq, reply, hit;
	private String id, name, email, subject, content, logtime;
}
