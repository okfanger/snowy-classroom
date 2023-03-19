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
 * @TableName core_studentcourseattend
 */
@TableName(value ="core_studentcourseattend")
@Data
public class CoreStudentcourseattend implements Serializable {
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
    private Date sign_in_time;

    /**
     * 
     */
    private String result;

    /**
     * 
     */
    private Long student_id;

    /**
     * 
     */
    private Long task_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}