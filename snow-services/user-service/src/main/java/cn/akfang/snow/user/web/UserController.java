package cn.akfang.snow.user.web;

import cn.akfang.snow.common.exception.BusinessException;
import cn.akfang.snow.common.model.ErrorCode;
import cn.akfang.snow.common.model.dto.TokenPayload;
import cn.akfang.snow.common.model.user.dto.LoginDto;
import cn.akfang.snow.common.model.user.entity.UsersUser;
import cn.akfang.snow.common.model.user.vo.TokenVO;
import cn.akfang.snow.common.utils.JwtUtil;
import cn.akfang.snow.user.remote.RemoteUserController;
import cn.hutool.core.bean.BeanUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@Slf4j
@RestController
public class UserController extends RemoteUserController {
    @PostMapping("/login")
    TokenVO login(@RequestBody LoginDto loginDto) {
        UsersUser user = usersUserService.getUserByUsernamePassword(loginDto);

        if (Optional.ofNullable(user).isPresent()) {
            // 创建Token
            TokenPayload tokenPayload = new TokenPayload();
            tokenPayload.setId(user.getId());
            tokenPayload.setUsername(user.getUsername());
            tokenPayload.setName(user.getName());

            // Create JWT
            String signedToken = JwtUtil.build()
                    .addPayloads(BeanUtil.beanToMap(tokenPayload))
                    .sign();

            TokenVO tokenVO = new TokenVO();
            tokenVO.setToken(signedToken);
            return tokenVO;

        } else {
            throw new BusinessException(ErrorCode.NOT_FOUND_ERROR);
        }
    }
}
