package cn.akfang.snow.feign.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * 
 * @TableName users_menuroutermeta
 */
@TableName(value ="users_menuroutermeta")
@Data
public class UsersMenuroutermeta implements Serializable {
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
    private String title;

    /**
     * 
     */
    private String icon;

    /**
     * 
     */
    private Integer keepAlive;

    /**
     * 
     */
    private String target;

    /**
     * 
     */
    private Integer hidden;

    /**
     * 
     */
    private Integer hiddenHeaderContent;

    /**
     * 
     */
    private Integer hideChildren;

    /**
     * 
     */
    private Integer hideHeader;

    /**
     * 
     */
    private Integer show;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}