package generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.CoreStudentCourses;
import generator.service.CoreStudentCoursesService;
import generator.mapper.CoreStudentCoursesMapper;
import org.springframework.stereotype.Service;

/**
* @author fang
* @description 针对表【core_student_courses】的数据库操作Service实现
* @createDate 2023-03-16 19:28:02
*/
@Service
public class CoreStudentCoursesServiceImpl extends ServiceImpl<CoreStudentCoursesMapper, CoreStudentCourses>
    implements CoreStudentCoursesService{

}




