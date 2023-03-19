package cn.akfang.snow.user.service;

import cn.akfang.snow.common.model.user.dto.LoginDto;
import cn.akfang.snow.common.model.user.entity.UsersUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
* @author fang
* @description 针对表【users_user】的数据库操作Service
* @createDate 2023-03-16 19:28:02
*/
public interface UsersUserService extends IService<UsersUser> {

    UsersUser getUserByUsernamePassword(LoginDto loginDto);
}
