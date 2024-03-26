package org.example.services;

import org.example.model.UsersRoles;
import org.springframework.stereotype.Service;

@Service
public class UsersRolesService extends BaseService<UsersRoles>{

	@Override
	protected Class<UsersRoles> clazz() {
		// TODO Auto-generated method stub
		return UsersRoles.class;
	}	

}
