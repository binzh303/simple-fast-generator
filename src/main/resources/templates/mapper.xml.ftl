<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package.Mapper}.${table.mapperName}">

    <select id="get${entity}ById" resultType="${package.Entity}.${entity}">
        select
        <#list table.fields as field>
            <#if field_has_next>
                ${field.name} as ${field.propertyName},
            <#else>
                ${field.name} as ${field.propertyName}
            </#if>
        </#list>
        from ${table.name}
        <trim prefix="where" prefixOverrides="and | or">
             <#list table.fields as field>
                 <#if field.keyFlag>
                   <if test="${field.propertyName} != null">
                       and ${field.name}=${r"#{"}${field.propertyName}}
                   </if>
                 </#if>
             </#list>
        </trim>
    </select>

    <select id="list${entity}" resultType="${package.Entity}.${entity}" parameterType="java.util.Map">
        select
         <#list table.fields as field>
             <#if field_has_next>
                 ${field.name} as ${field.propertyName},
             <#else>
                 ${field.name} as ${field.propertyName}
             </#if>
         </#list>
        from ${table.name}
        <trim prefix="where" prefixOverrides="and | or">
            <#list table.fields as field>
                <#if field.columnType=='STRING'>
                <if test="${field.propertyName} != null and ${field.propertyName}!=''">
                    and ${field.name}=${r"#{"}${field.propertyName}}
                </if>
                <#else>
                <if test="${field.propertyName} != null ">
                    and ${field.name}=${r"#{"}${field.propertyName}}
                </if>
                </#if>
            </#list>
        </trim>
    </select>

    <select id="page${entity}" resultType="${package.Entity}.${entity}" parameterType="java.util.Map">
        select
         <#list table.fields as field>
             <#if field_has_next>
                 ${field.name} as ${field.propertyName},
             <#else>
                 ${field.name} as ${field.propertyName}
             </#if>
         </#list>
        from ${table.name}
        <trim prefix="where" prefixOverrides="and | or">
            <#list table.fields as field>
                <#if field.columnType=='STRING'>
                <if test="${field.propertyName} != null and ${field.propertyName}!=''">
                    and ${field.name}=${r"#{"}${field.propertyName}}
                </if>
                <#else>
                <if test="${field.propertyName} != null ">
                    and ${field.name}=${r"#{"}${field.propertyName}}
                </if>
                </#if>
            </#list>
        </trim>
    </select>

    <insert id="add${entity}" parameterType="${package.Entity}.${entity}">
        insert into ${table.name}(
        <#list table.fields as field>
            <#if field_has_next>
                ${field.name},
            <#else>
                ${field.name})
            </#if>
        </#list>
        values(
        <#list table.fields as field>
            <#if field_has_next>
                ${r"#{"}${field.propertyName}},
            <#else>
                ${r"#{"}${field.propertyName}})
            </#if>
        </#list>
    </insert>

    <update id="update${entity}" parameterType="${package.Entity}.${entity}">
        update ${table.name}
        <trim prefix="set" suffixOverrides="," suffix="where id=${r"#{"}id}">
        <#list table.fields as field>
                <#--<#if field_has_next>-->
                    <#if !field.keyFlag>
                        <#if field.columnType=='STRING'>
                        <if test="${field.propertyName} != null and ${field.propertyName}!=''">
                            ${field.name}=${r"#{"}${field.propertyName}},
                        </if>
                        <#else>
                        <if test="${field.propertyName} != null ">
                            ${field.name}=${r"#{"}${field.propertyName}},
                        </if>
                        </#if>
                    </#if>
                <#--<#else>-->
                    <#--<#if !field.keyFlag>-->
                        <#--<#if field.columnType=='STRING'>-->
                        <#--<if test="${field.propertyName} != null and ${field.propertyName}!=''">-->
                            <#--${field.name}=${r"#{"}${field.propertyName}}-->
                        <#--</if>-->
                        <#--<#else>-->
                        <#--<if test="${field.propertyName} != null ">-->
                            <#--${field.name}=${r"#{"}${field.propertyName}}-->
                        <#--</if>-->
                        <#--</#if>-->
                    <#--</#if>-->
                <#--</#if>-->
        </#list>
        </trim>
    </update>

    <update id="remove${entity}ById">
        update ${table.name} set status = -1
        <trim prefix="where" prefixOverrides="and | or">
             <#list table.fields as field>
                 <#if field.keyFlag>
                   <if test="${field.propertyName} != null">
                       and ${field.name}=${r"#{"}${field.propertyName}}
                   </if>
                 </#if>
             </#list>
        </trim>
    </update>

    <delete id="delete${entity}ById" >
        delete from ${table.name}
        <trim prefix="where" prefixOverrides="and | or">
             <#list table.fields as field>
                 <#if field.keyFlag>
                   <if test="${field.propertyName} != null">
                       and ${field.name}=${r"#{"}${field.propertyName}}
                   </if>
                 </#if>
             </#list>
        </trim>
    </delete>
</mapper>