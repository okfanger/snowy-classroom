package cn.akfang.snow.common.utils;

import cn.hutool.jwt.JWT;

;

public class JwtUtil {

    private static final String SECRET_KEY = "django-insecure-c1nix92bljn$db(x_3((=v0%=@l8!d+_&7=+!j39pg$b36!zn5";

    public static JWT build() {

        return JWT.create()
                .setKey(SECRET_KEY.getBytes());
    }
}
