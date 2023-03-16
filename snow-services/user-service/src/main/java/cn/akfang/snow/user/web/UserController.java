package cn.akfang.snow.user.web;

import cn.akfang.snow.feign.clients.UserClient;
import cn.akfang.snow.feign.model.entity.UsersUser;
import cn.akfang.snow.user.service.UsersUserService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
public class UserController implements UserClient {

    @Autowired
    UsersUserService usersUserService;

    @Override
    public UsersUser hello() {
        return usersUserService.getById(101);
    }
}
