package cn.akfang.snow.feign.clients;

import cn.akfang.snow.feign.model.entity.UsersUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(name="userservice")
public interface UserClient {

    @GetMapping("/hello")
    UsersUser hello();
}
