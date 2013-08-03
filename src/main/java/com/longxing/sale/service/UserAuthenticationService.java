package com.longxing.sale.service;

import java.util.List;

import org.springframework.stereotype.Service;

import cn.org.rapid_framework.page.Page;

import com.github.springrest.auth.AuthenticationService;
import com.github.springrest.model.Authentication;
import com.longxing.sale.model.User;
import com.longxing.sale.vo.query.UserQuery;

@Service("authenticationService")
public class UserAuthenticationService implements AuthenticationService {

	private UserManager userManager;

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	@Override
	public boolean authenticate(Authentication authentication) {
		UserQuery query = new UserQuery();
		query.setUserName(authentication.getPrincipal());
		query.setPassword(authentication.getCredential());
		Page page = userManager.findPage(query);
		List list = page.getResult();
		if (list.size() == 0) {
			return false;
		}
		User user = (User) list.get(0);
		authentication.setSubjectId(user.getUserId());
		authentication.setCredential(null);
		return true;
	}

}
