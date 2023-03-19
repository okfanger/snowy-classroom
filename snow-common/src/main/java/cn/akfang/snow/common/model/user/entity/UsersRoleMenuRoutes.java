package cn.akfang.snow.common.model.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 
 * @TableName users_role_menu_routes
 */
@TableName(value ="users_role_menu_routes")
@Data
public class UsersRoleMenuRoutes implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private Long role_id;

    /**
     * 
     */
    private Long menurouter_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}