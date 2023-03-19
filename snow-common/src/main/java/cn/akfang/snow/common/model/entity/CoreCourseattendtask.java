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
 * @TableName core_courseattendtask
 */
@TableName(value ="core_courseattendtask")
@Data
public class CoreCourseattendtask implements Serializable {
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
    private Integer duration;

    /**
     * 
     */
    private Date expire_time;

    /**
     * 
     */
    private Long course_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}