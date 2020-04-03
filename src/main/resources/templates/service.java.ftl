package ${package.Service};

import ${package.Entity}.${entity};
import com.github.pagehelper.Page;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * ${table.comment!} 服务类
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */

public interface ${table.serviceName} {

    /**
	* 根据id查询${entity}
	*/
    ${entity} get${entity}ById(<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception;

    /**
	* 查询${entity}列表
	*/
    List<${entity}> list${entity}(Map<String, Object> map) throws Exception;

	/**
	* 分页查询${entity}列表
	*/
	Page<${entity}> page${entity}(Map<String, Object> map, Integer pageNo, Integer pageSize) throws Exception;

    /**
	* 新增${entity}
	*/
	Integer add${entity}(${entity} ${table.entityPath}) throws Exception;

	/**
	* 更新${entity}
	*/
	Integer update${entity}(${entity} ${table.entityPath}) throws Exception;

	/**
	* 根据id物理删除${entity}
	*/
	Integer delete${entity}ById(<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id)	throws Exception;

	/**
	* 根据id逻辑删除${entity}
	*/
	Integer remove${entity}ById(<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id)	throws Exception;
}
