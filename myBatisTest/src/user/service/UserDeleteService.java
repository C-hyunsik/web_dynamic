package user.service;

import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserDeleteService implements UserService {

	@Override
	public void execute() {
		Scanner sc = new Scanner(System.in);
		System.out.println();
		
		System.out.print("삭제할 아이디를 입력 : ");
		String id = sc.next();
		System.out.print("삭제할 비밀번호를 입력 : ");
		String pwd = sc.next();
		UserDAO userDAO = UserDAO.getInstance(); 
		UserDTO userDTO = new UserDTO();
		
		userDTO.setId(id);
		userDTO.setPwd(pwd);
		
		int su = userDAO.delete(userDTO);
		
		if(su>0) {
			System.out.println(su+"건의 데이터를 삭제했습니다.");
		}
		else {
			System.out.println("아이디 혹은 비밀번호가 틀립니다.");
		}

	}

}