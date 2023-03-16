package generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.CoreStudent;
import generator.service.CoreStudentService;
import generator.mapper.CoreStudentMapper;
import org.springframework.stereotype.Service;

/**
* @author fang
* @description 针对表【core_student】的数据库操作Service实现
* @createDate 2023-03-16 19:28:02
*/
@Service
public class CoreStudentServiceImpl extends ServiceImpl<CoreStudentMapper, CoreStudent>
    implements CoreStudentService{

}




