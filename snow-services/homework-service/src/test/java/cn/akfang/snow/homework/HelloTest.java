package cn.akfang.snow.homework;

import cn.akfang.snow.common.model.user.entity.UsersUser;
import cn.akfang.snow.feign.clients.UserClient;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = HomeworkApplication.class)
public class HelloTest {

    @Autowired
    UserClient userClient;

    @Test
    public void test() {
        UsersUser hello = userClient.hello();
        System.out.println(hello);
    }
}
