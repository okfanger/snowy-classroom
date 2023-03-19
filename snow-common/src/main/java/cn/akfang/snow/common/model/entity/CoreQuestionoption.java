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
 * @TableName core_questionoption
 */
@TableName(value ="core_questionoption")
@Data
public class CoreQuestionoption implements Serializable {
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
    private Integer right;

    /**
     * 
     */
    private String content;

    /**
     * 
     */
    private Long exam_id;

    /**
     * 
     */
    private Long question_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}