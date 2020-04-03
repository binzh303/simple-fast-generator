package ${package.Entity};

import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
<#list table.fields as field>
    <#if field.columnType == 'LOCAL_DATE_TIME' || field.columnType =='LOCAL_DATE'>
import java.util.Date;
    </#if>
</#list>

/**
 * <p>
 * ${table.comment!}
 *</p>
 *
 * @author ${author}
 * @date ${date}
 */
@ApiModel(description = "${table.comment!}")
public class ${entity} implements Serializable {

<#if entitySerialVersionUID>
    private static final long serialVersionUID = 1L;
</#if>
<#-- ----------  BEGIN 字段循环遍历  ---------->
<#list table.fields as field>

    <#--<#if field.comment!?length gt 0>-->
    <#--/**-->
     <#--* ${field.comment}-->
     <#--*/-->
    <#--</#if>-->
    @ApiModelProperty("${field.comment}")
    <#--@Column(name = "${field.name}")-->
    private <#if field.columnType == 'LOCAL_DATE_TIME' || field.columnType == 'LOCAL_DATE'>Date<#else>${field
.propertyType}</#if> ${field.propertyName};
</#list>

<#------------  END 字段循环遍历  ---------->
<#list table.fields as field>

    public void set${field.capitalName} (<#if field.columnType == 'LOCAL_DATE_TIME' || field.columnType ==
'LOCAL_DATE'>Date<#else>${field.propertyType}</#if>  ${field.propertyName}){
        this.${field.propertyName}=${field.propertyName};
    }
    public <#if field.columnType == 'LOCAL_DATE_TIME' || field.columnType == 'LOCAL_DATE'>Date<#else>${field
.propertyType}</#if> get${field.capitalName}(){
        return this.${field.propertyName};
    }
</#list>
}