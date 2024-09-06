package guestbook.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class GuestbookDTO {
	private int seq;
	private String name, email, homepage, subject, content, logtime;
	
}