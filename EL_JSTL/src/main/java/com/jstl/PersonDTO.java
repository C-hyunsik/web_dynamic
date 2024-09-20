package com.jstl;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
//@Getter
//@Setter
@Data	//setter, getter, toString 등등
public class PersonDTO {
	@NonNull
	private String name;
	private int age;
}
