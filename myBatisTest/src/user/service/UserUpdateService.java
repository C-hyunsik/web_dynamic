package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserUpdateService implements UserService {

	@Override
	public void execute() {
		Scanner sc = new Scanner(System.in);
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = new UserDTO();
		
		System.out.println();
		String id = "";
		while(true) {
			System.out.print("아이디를 입력 : ");
			id = sc.next();
			List<UserDTO> list = userDAO.getUser(id);
			String name = null;
			System.out.println(list);
			for(UserDTO userDTO1 : list) {
				System.out.println(userDTO1.getName() + "\t" + 
						userDTO1.getId() + "\t" + 
						userDTO1.getPwd());
				name = userDTO1.getName();
			}//for
			if(name != null) {
				break;
			}
			else {
				System.out.println("수정할 아이디가 없습니다.");
			}//if
		}//while
		System.out.print("수정할 이름 입력 : ");
		String name = sc.next();
		System.out.print("수정할 비밀번호를 입력 : ");
		String pwd = sc.next();
		userDTO.setId(id);
		userDTO.setName(name);
		userDTO.setPwd(pwd);
		
		int su = userDAO.update(userDTO);
		
		if(su>0) {
			System.out.println("정보를 수정하였습니다.");
		}
		else {
			System.out.println("아이디 또는 비밀번호가 틀립니다.");
		}

	}

}
