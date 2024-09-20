package user.service;

import java.util.List;
import java.util.Scanner;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSearchService implements UserService {

	@Override
	public void execute() {
		Scanner sc = new Scanner(System.in);
		System.out.println();
		
		System.out.println("1. 이름으로 검색");
		System.out.println("2. 아이디로 검색");
		System.out.print("번호 입력 : ");
		String num = sc.next();
		
		System.out.println();
		if(num.equals("1")) {
			System.out.print("검색할 이름의 일부를 입력하세요 : ");
			String name = sc.next();
			
			UserDAO userDAO = UserDAO.getInstance();
			List<UserDTO> list = userDAO.search(num, name);
			for(UserDTO userDTO : list) {
				System.out.println(userDTO.getName() + "\t" + 
								   userDTO.getId() + "\t" + 
								   userDTO.getPwd());
			}
		}
		else if(num.equals("2")){
			System.out.print("검색할 아이디의 일부를 입력하세요 : ");
			String id = sc.next();
			
			UserDAO userDAO = UserDAO.getInstance();
			List<UserDTO> list = userDAO.search(num, id);
			for(UserDTO userDTO : list) {
				System.out.println(userDTO.getName() + "\t" + 
								   userDTO.getId() + "\t" + 
								   userDTO.getPwd());
			}
		}
		else {
			System.out.println("잘못된 요청입니다.");
		}
	}
}
