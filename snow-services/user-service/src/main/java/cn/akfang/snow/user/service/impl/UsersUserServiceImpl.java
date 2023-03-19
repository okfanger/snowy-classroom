package cn.akfang.snow.user.service.impl;

import cn.akfang.snow.common.model.user.dto.LoginDto;
import cn.akfang.snow.common.model.user.entity.UsersUser;
import cn.akfang.snow.user.mapper.UsersUserMapper;
import cn.akfang.snow.user.service.UsersUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.stereotype.Service;

/**
 * @author fang
 * @description 针对表【users_user】的数据库操作Service实现
 * @createDate 2023-03-16 19:28:02
 */
@Service
public class UsersUserServiceImpl extends ServiceImpl<UsersUserMapper, UsersUser>
        implements UsersUserService {

    @Override
    public UsersUser getUserByUsernamePassword(LoginDto loginDto) {
        try {
            String username = loginDto.getUsername();
            String password = loginDto.getPassword();

            QueryWrapper<UsersUser> qw = new QueryWrapper<>();

            qw.eq("username", username);
            qw.eq("password", password);

            return baseMapper.selectOne(qw);
        } catch (TooManyResultsException ignore) {
            return null;
        }
    }
}




