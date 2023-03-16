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
 * @TableName core_groupstudentbinder
 */
@TableName(value ="core_groupstudentbinder")
@Data
public class CoreGroupstudentbinder implements Serializable {
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
    private Integer leader;

    /**
     * 
     */
    private Long course_id;

    /**
     * 
     */
    private Long group_id;

    /**
     * 
     */
    private Long student_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}