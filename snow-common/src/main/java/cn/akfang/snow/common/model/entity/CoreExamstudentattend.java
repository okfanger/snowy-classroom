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
 * @TableName core_examstudentattend
 */
@TableName(value ="core_examstudentattend")
@Data
public class CoreExamstudentattend implements Serializable {
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
    private Double score;

    /**
     * 
     */
    private Integer is_done;

    /**
     * 
     */
    private Long course_id;

    /**
     * 
     */
    private Long exam_id;

    /**
     * 
     */
    private Long student_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}