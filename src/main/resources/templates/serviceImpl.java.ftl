package ${package.ServiceImpl};

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import ${package.Entity}.${entity};
import ${package.Mapper}.${table.mapperName};
import ${package.Service}.${table.serviceName};
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * ${table.comment!} 服务实现类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
@Service
public class ${table.serviceImplName} implements ${table.serviceName} {

    @Autowired
    private ${table.mapperName} ${table.entityPath}Mapper;

    /**
	* 根据id查询${entity}
	*/
    @Override
    public ${entity} get${entity}ById(<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {
        return ${table.entityPath}Mapper.get${entity}ById(id);
    }

    /**
	* 查询${entity}列表
	*/
    @Override
    public List<${entity}> list${entity}(Map<String, Object> map) throws Exception {
        return ${table.entityPath}Mapper.list${entity}(map);
    }

    /**
	* 分页查询${entity}列表
	*/
    @Override
	public Page<${entity}> page${entity}(Map<String, Object> map, Integer pageNo, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNo,pageSize);
        return ${table.entityPath}Mapper.page${entity}(map);
    }

    /**
	* 新增${entity}
	*/
    @Override
    @Transactional
    public Integer add${entity}(${entity} ${table.entityPath}) throws Exception {
        return ${table.entityPath}Mapper.add${entity}(${table.entityPath});
    }

    /**
	* 更新${entity}
	*/
    @Override
    @Transactional
    public Integer update${entity}(${entity} ${table.entityPath}) throws Exception {
        return ${table.entityPath}Mapper.update${entity}(${table.entityPath});
    }

   	/**
	* 根据id删除${entity}
	*/
    @Override
    @Transactional
	public Integer delete${entity}ById(<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {
        return ${table.entityPath}Mapper.delete${entity}ById(id);
    }

	/**
	* 根据id逻辑删除${entity}
	*/
    @Override
    @Transactional
	public Integer remove${entity}ById(<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {
        return ${table.entityPath}Mapper.remove${entity}ById(id);
    }
}
