package cn.akfang.snow.course.web;

import cn.akfang.snow.feign.clients.UserClient;
import cn.akfang.snow.feign.model.entity.UsersUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
public class CourseController{


    @Autowired
    UserClient userClient;
    @GetMapping("/hello")
    public UsersUser hello() {
        UsersUser user = userClient.hello();
        return user;
    }
}
