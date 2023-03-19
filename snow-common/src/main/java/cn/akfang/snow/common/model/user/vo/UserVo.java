package cn.akfang.snow.common.model.user.vo;

import cn.akfang.snow.common.model.entity.CoreStudent;
import cn.akfang.snow.common.model.entity.CoreTeacher;
import cn.akfang.snow.common.model.user.entity.UsersRole;
import lombok.Data;

import java.util.Date;

@Data
public class UserVo {
    private Long id;

    /**
     *
     */
    private Date create_time;

    /**
     *
     */
    private Date update_time;

    /**
     *
     */
    private String name;

    /**
     *
     */
    private String username;

    /**
     *
     */
    private String email;

    /**
     *
     */
    private String telephone;

    /**
     *
     */
    private Integer type;

    /**
     *
     */
//    private Long role_id;

    private UsersRole role;

    private CoreTeacher teacherBinder;

    private CoreStudent studentBinder;
}
