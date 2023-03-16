package cn.akfang.snow.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import cn.akfang.snow.feign.model.entity.UsersUser;
import cn.akfang.snow.user.service.UsersUserService;
import cn.akfang.snow.user.mapper.UsersUserMapper;
import org.springframework.stereotype.Service;

/**
* @author fang
* @description 针对表【users_user】的数据库操作Service实现
* @createDate 2023-03-16 19:28:02
*/
@Service
public class UsersUserServiceImpl extends ServiceImpl<UsersUserMapper, UsersUser>
    implements UsersUserService{

}




