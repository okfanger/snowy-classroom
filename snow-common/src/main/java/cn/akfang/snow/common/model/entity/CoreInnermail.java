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
 * @TableName core_innermail
 */
@TableName(value ="core_innermail")
@Data
public class CoreInnermail implements Serializable {
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
    private String content;

    /**
     * 
     */
    private String title;

    /**
     * 
     */
    private Date send_date;

    /**
     * 
     */
    private Date receive_date;

    /**
     * 
     */
    private Integer is_read;

    /**
     * 
     */
    private Long from_user_id;

    /**
     * 
     */
    private Long to_user_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}