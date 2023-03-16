package generator.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import generator.domain.CoreGroup;
import generator.service.CoreGroupService;
import generator.mapper.CoreGroupMapper;
import org.springframework.stereotype.Service;

/**
* @author fang
* @description 针对表【core_group】的数据库操作Service实现
* @createDate 2023-03-16 19:28:02
*/
@Service
public class CoreGroupServiceImpl extends ServiceImpl<CoreGroupMapper, CoreGroup>
    implements CoreGroupService{

}




