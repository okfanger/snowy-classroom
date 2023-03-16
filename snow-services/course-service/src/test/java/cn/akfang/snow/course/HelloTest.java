package cn.akfang.snow.course;

import cn.akfang.snow.feign.clients.UserClient;
import cn.akfang.snow.feign.model.entity.UsersUser;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = CourseApplication.class)
public class HelloTest {

    @Autowired
    UserClient userClient;

    @Test
    public void test() {
        UsersUser hello = userClient.hello();
        System.out.println(hello);
    }
}
