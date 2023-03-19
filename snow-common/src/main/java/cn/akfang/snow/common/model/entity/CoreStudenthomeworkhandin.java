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
 * @TableName core_studenthomeworkhandin
 */
@TableName(value ="core_studenthomeworkhandin")
@Data
public class CoreStudenthomeworkhandin implements Serializable {
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
    private Date submit_time;

    /**
     * 
     */
    private String submit_detail;

    /**
     * 
     */
    private Long course_id;

    /**
     * 
     */
    private Long homework_id;

    /**
     * 
     */
    private Long student_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}