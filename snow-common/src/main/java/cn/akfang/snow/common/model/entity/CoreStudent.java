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
 * @TableName core_student
 */
@TableName(value ="core_student")
@Data
public class CoreStudent implements Serializable {
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
    private Date attend_date;

    /**
     * 
     */
    private String grade;

    /**
     * 
     */
    private Long classroom_id;

    /**
     * 
     */
    private Long user_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}