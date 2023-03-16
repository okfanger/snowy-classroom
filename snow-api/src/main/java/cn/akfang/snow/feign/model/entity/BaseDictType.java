package cn.akfang.snow.feign.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import lombok.Data;

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