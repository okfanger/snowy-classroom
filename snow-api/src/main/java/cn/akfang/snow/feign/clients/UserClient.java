package cn.akfang.snow.feign.clients;

import cn.akfang.snow.common.model.user.vo.UserVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(name = "userservice")

/**
 *     # 获取/刷新/验证 token
 *
 *     # path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
 *     # path('refresh/', TokenRefreshView.as_view(), name='token_refresh'),
 *     # path('verify/', TokenVerifyView.as_view(), name='token_verify'),
 *
 *     # 获取Token的接口
 *     path('auth/login/', MyTokenObtainPairView.as_view(), name='token_obtain_pair'),
 *     # 刷新Token有效期的接口
 *     path('auth/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
 *     # 验证Token的有效性
 *     path('auth/verify/', TokenVerifyView.as_view(), name='token_verify'),
 *
 *     # 忘记密码
 *     path('user/forget/', UserForgetView.as_view(), name="user_forget"),
 *     # 用户信息
 *     path('user/info/', UserInfoView.as_view(), name='token_verify'),
 *     # 注册用户
 *     path('user/register/', UserRegisterView.as_view(), name="user_register"),
 *     # 用户权限菜单
 *     path('user/nav/', UserNavView.as_view(), name="user_nav"),
 *
 *
 *     #生成二维码工具类
 *     path('qrcode/', QRCodeView.as_view(), name="qrcode"),
 */
public interface UserClient {

    @GetMapping("/token")
    UserVo getByToken(@RequestParam String token);

}
