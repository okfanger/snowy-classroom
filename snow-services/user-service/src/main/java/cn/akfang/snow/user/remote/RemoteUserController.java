package cn.akfang.snow.user.remote;

import cn.akfang.snow.common.model.dto.TokenPayload;
import cn.akfang.snow.common.model.user.entity.UsersUser;
import cn.akfang.snow.common.model.user.vo.UserVo;
import cn.akfang.snow.common.utils.JwtUtil;
import cn.akfang.snow.feign.clients.UserClient;
import cn.akfang.snow.user.service.UsersRoleService;
import cn.akfang.snow.user.service.UsersUserService;
import cn.hutool.core.bean.BeanUtil;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import cn.hutool.jwt.JWTPayload;
import org.springframework.beans.factory.annotation.Autowired;

public class RemoteUserController implements UserClient {

    @Autowired
    protected UsersUserService usersUserService;

    @Autowired
    protected UsersRoleService usersRoleService;

    @Override
    public UserVo getByToken(String token) {

        JWTPayload payload = JwtUtil.build()
                .parse(token)
                .getPayload();

        JSONObject claimsJson = payload.getClaimsJson();
        TokenPayload tokenPayload = JSONUtil.toBean(claimsJson, TokenPayload.class);

        Long id = tokenPayload.getId();
        UsersUser byId = usersUserService.getById(id);
        UserVo vo = new UserVo();
        BeanUtil.copyProperties(byId, vo);


        return vo;
    }
}
