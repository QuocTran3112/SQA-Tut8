package org.example.services;

import org.example.model.Role;
import org.springframework.stereotype.Service;

@Service
public class RoleService extends BaseService<Role>{
		
	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
}
