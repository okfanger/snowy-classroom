package generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.CoreQuestion;
import generator.service.CoreQuestionService;
import generator.mapper.CoreQuestionMapper;
import org.springframework.stereotype.Service;

/**
* @author fang
* @description 针对表【core_question】的数据库操作Service实现
* @createDate 2023-03-16 19:28:02
*/
@Service
public class CoreQuestionServiceImpl extends ServiceImpl<CoreQuestionMapper, CoreQuestion>
    implements CoreQuestionService{

}




