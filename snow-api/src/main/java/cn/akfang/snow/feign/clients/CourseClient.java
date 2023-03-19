package cn.akfang.snow.feign.clients;

import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(name = "courseservice")
public interface CourseClient {

}
