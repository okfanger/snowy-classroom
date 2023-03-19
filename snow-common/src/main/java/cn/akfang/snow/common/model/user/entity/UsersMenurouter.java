package cn.akfang.snow.common.model.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName users_menurouter
 */
@TableName(value ="users_menurouter")
@Data
public class UsersMenurouter implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
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
    private Integer parentId;

    /**
     * 
     */
    private String name;

    /**
     * 
     */
    private String component;

    /**
     * 
     */
    private String redirect;

    /**
     * 
     */
    private Integer hidden;

    /**
     * 
     */
    private Integer hideChildrenInMenu;

    /**
     * 
     */
    private String path;

    /**
     * 
     */
    private Long meta_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}