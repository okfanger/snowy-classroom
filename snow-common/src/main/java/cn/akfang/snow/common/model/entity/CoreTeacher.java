package cn.akfang.snow.common.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName core_teacher
 */
@TableName(value ="core_teacher")
@Data
public class CoreTeacher implements Serializable {
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
    private Integer teach_age;

    /**
     * 
     */
    private String rank;

    /**
     * 
     */
    private String desc;

    /**
     * 
     */
    private Long user_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}