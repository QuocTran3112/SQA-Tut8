package org.example.services;

import org.apache.catalina.User;
import org.example.dto.UserSearch;
import org.example.model.Users;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class UserService extends BaseService<Users>{

	@Override
	protected Class<Users> clazz() {
		return Users.class;
	}

	public Users loadStaffByStaffname(String StaffName) {
		String sql = "select * from tbl_users u where u.username = '" + StaffName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}

	public PagerData<Users> searchUser(UserSearch userSearch) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users u WHERE 1=1";

		if (userSearch != null) {
		
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(userSearch.getKeyword())) {
				sql += " and (u.username like '%" + userSearch.getKeyword() + "%'" + 
								 " or u.email like '%" + userSearch.getKeyword() + "%')";
			}
		}

        assert userSearch != null;
        return super.getEntitiesByNativeSQL(sql, userSearch.getCurrentPage());
	}
	
	
}
