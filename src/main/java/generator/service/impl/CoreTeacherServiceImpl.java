package generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.CoreTeacher;
import generator.service.CoreTeacherService;
import generator.mapper.CoreTeacherMapper;
import org.springframework.stereotype.Service;

/**
* @author fang
* @description 针对表【core_teacher】的数据库操作Service实现
* @createDate 2023-03-16 19:28:02
*/
@Service
public class CoreTeacherServiceImpl extends ServiceImpl<CoreTeacherMapper, CoreTeacher>
    implements CoreTeacherService{

}




