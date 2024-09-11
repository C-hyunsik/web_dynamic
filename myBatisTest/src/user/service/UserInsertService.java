package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserInsertService implements UserService{

	@Override
	public void execute() {
		System.out.println();
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름 입력 : ");
		String name = sc.next();
		System.out.print("아이디 입력 : ");
		String id = sc.next();
		System.out.print("비밀번호 입력 : ");
		String pwd = sc.next();
		
		UserDTO userDTO = new UserDTO();
		
		userDTO.setName(name);
		userDTO.setId(id);
		userDTO.setPwd(pwd);
		
		UserDAO userDAO = UserDAO.getInstance();
		
		int su = userDAO.insert(userDTO);
		System.out.println(su + "건의 데이터가 삽입되었습니다.");
	}

}
