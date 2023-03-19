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
 * @TableName core_studentcourseleave
 */
@TableName(value ="core_studentcourseleave")
@Data
public class CoreStudentcourseleave implements Serializable {
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
    private String reason;

    /**
     * 
     */
    private String type;

    /**
     * 
     */
    private String remark;

    /**
     * 
     */
    private Integer status;

    /**
     * 
     */
    private Date start_time;

    /**
     * 
     */
    private Date end_time;

    /**
     * 
     */
    private Long course_id;

    /**
     * 
     */
    private Long student_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}