package cn.akfang.snow.common.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * 
 * @TableName core_student_courses
 */
@TableName(value ="core_student_courses")
@Data
public class CoreStudentCourses implements Serializable {
    /**
     * 
     */
    @TableId(type = IdType.AUTO)
    private Long id;

    /**
     * 
     */
    private Long student_id;

    /**
     * 
     */
    private Long course_id;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;
}