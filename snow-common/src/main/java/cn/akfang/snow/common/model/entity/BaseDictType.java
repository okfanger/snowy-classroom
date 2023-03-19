package cn.akfang.snow.common.model.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 
 * @TableName base_dict_type
 */
@TableName(value ="base_dict_type")
@Data
public class BaseDictType implements Serializable {
    /**
     * 
     */
    @TableId
    private String type;

    /**
     * 
     */
    private String type_name;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}