package ${package.Controller};

import org.springframework.web.bind.annotation.*;
<#if restControllerStyle>
import org.springframework.web.bind.annotation.RestController;
<#else>
import org.springframework.stereotype.Controller;
</#if>
import org.springframework.beans.factory.annotation.Autowired;
import io.swagger.annotations.Api;
import io.swagger.annotations.*;
import java.util.*;
import website.abin.common.ResultBean;
import  ${package.Service}.${table.serviceName};
import  ${package.Entity}.${table.entityName};
<#if superControllerClassPackage??>
import ${superControllerClassPackage};
</#if>

/**
 * <p>
 * ${table.comment!} 前端控制器
 * </p>
 *
 * @author ${author}
 * @date ${date}
 */
<#if restControllerStyle>
@RestController
<#else>
@Controller
</#if>
@CrossOrigin
@Api(value = "${table.entityPath}CRUD接口")
@RequestMapping("<#if package.ModuleName??>/${package.ModuleName}</#if>/<#if controllerMappingHyphenStyle??>${controllerMappingHyphen}<#else>${table.entityPath}</#if>")
<#if kotlin>
class ${table.controllerName}<#if superControllerClass??> : ${superControllerClass}()</#if>
<#else>
    <#if superControllerClass??>
public class ${table.controllerName} extends ${superControllerClass} {
    <#else>
public class ${table.controllerName} {
    </#if>

    @Autowired
    private ${table.serviceName} ${table.entityPath}Service;

    @ApiOperation(value = "获取${table.entityPath}根据id",notes="")
    @ApiImplicitParam(name = "id", value = "id", required = true, dataType = "<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list>")
    @GetMapping("/getById")
    public ResultBean ${table.entityPath}(@RequestParam(value = "id") <#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {

        ${entity} ${table.entityPath} = ${table.entityPath}Service.get${entity}ById(id);
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(${table.entityPath});
        return resultBean;
    }

    @ApiOperation(value = "获取${table.entityPath}列表",notes="")
    @ApiImplicitParam(name = "map", value = "${table.entityPath}实体中的参数", dataType ="Map")
    @GetMapping("")
    public ResultBean ${table.entityPath}List(@RequestParam(required = false) Map<String, Object> map) throws Exception {

        List<${entity}> ${table.entityPath}List = ${table.entityPath}Service.list${entity}(map);
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(${table.entityPath}List);
        return resultBean;
    }

    @ApiOperation(value = "分页获取${table.entityPath}列表",notes="")
    @ApiImplicitParams({
        @ApiImplicitParam(name = "map", value = "${table.entityPath}实体中的参数", dataType="Map"),
        @ApiImplicitParam(name = "pageNo", value = "当前页", dataType = "String"),
        @ApiImplicitParam(name = "pageSize", value = "每页数据条数", dataType = "String"),
    })
    @GetMapping("/page")
    public ResultBean ${table.entityPath}Page(@RequestParam(required = false) Map<String, Object> map,
                                        @RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
                                        @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize) throws Exception {

        List<${entity}> ${table.entityPath}List = ${table.entityPath}Service.page${entity}(map, pageNo, pageSize);
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(${table.entityPath}List);
        return resultBean;
    }

    @ApiOperation(value = "添加${table.entityPath}",notes="新增一条${table.entityPath}")
    @ApiImplicitParam(name = "${table.entityPath}", value = "${table.entityPath}实体中的参数", required = true, dataType = "${entity}")
    @PostMapping("")
    public ResultBean ${table.entityPath}Add(@RequestBody ${entity} ${table.entityPath}) throws Exception {

        Integer flag = ${table.entityPath}Service.add${entity}(${table.entityPath});
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(flag);
        return resultBean;
    }

    @ApiOperation(value = "修改${table.entityPath}",notes="根据id修改${table.name}")
    @ApiImplicitParam(name = "${table.entityPath}", value = "${table.entityPath}实体", required = true, dataType = "${entity}")
    @PutMapping("")
    public ResultBean ${table.entityPath}Update(@RequestBody ${entity} ${table.entityPath}) throws Exception {

        Integer flag = ${table.entityPath}Service.update${entity}(${table.entityPath});
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(flag);
        return resultBean;
    }
    @ApiOperation(value = "物理删除${table.entityPath}",notes="根据id物理删除${table.entityPath}")
    @ApiImplicitParam(name = "id", value = "id", required = true, dataType = "<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list>")
    @DeleteMapping("/{id}")
    public ResultBean ${table.entityPath}Delete(@PathVariable(name = "id") <#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {

        Integer flag = ${table.entityPath}Service.delete${entity}ById(id);
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(flag);
        return resultBean;
    }

    @ApiOperation(value = "逻辑删除${table.entityPath}",notes="根据id逻辑删除${table.entityPath}")
    @ApiImplicitParam(name = "id", value = "id", required = true, dataType = "<#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list>")
    @PostMapping("/removeById")
    public ResultBean ${table.entityPath}Remove(@RequestParam(value = "id") <#list table.fields as field><#if field.keyFlag == true>${field.columnType?lower_case?cap_first}</#if></#list> id) throws Exception {

        Integer flag = ${table.entityPath}Service.remove${entity}ById(id);
        ResultBean resultBean = new ResultBean();
        resultBean.fillData(flag);
        return resultBean;
    }
}
</#if>
