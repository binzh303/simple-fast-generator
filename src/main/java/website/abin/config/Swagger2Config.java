package website.abin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * @Author zhbin
 * @Description
 * @Date 2020-04-02 14:23
 */
@Configuration
@EnableSwagger2
@Profile({"dev","test"}) // 在开发和测试环境中开启
public class Swagger2Config {

    @Bean
    public Docket createRestApi() {
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("website.abin.project"))
                .paths(PathSelectors.any())
                .build();
    }

    private ApiInfo apiInfo() {

        return new ApiInfoBuilder().title("simple-fast-generator接口API")
                .description("使用simple-fast-generator生成的代码接口，欢迎关注微信公众号：字节传说")
                .termsOfServiceUrl("http://abin.website")
                .contact(new Contact("b哥","http://abin.website","binzh303@163.com"))
                .version("1.0.0")
                .build();
    }
}
