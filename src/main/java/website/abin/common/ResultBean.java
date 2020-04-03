package website.abin.common;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
* @ClassName: ResultBean
* @Description: 接口数据返回封装
* @Author: zhbin
* @CreateDate: 2020/4/2 14:36
* @Version: 1.0
*/
@ApiModel(description= "接口响应结果")
public class ResultBean implements Serializable {
	

	private static final long serialVersionUID = 7711286170331714067L;
	
	@ApiModelProperty(value = "状态码：0成功，其它失败")
	private int code;
	@ApiModelProperty(value = "描述信息")
	private String msg;
	
	@ApiModelProperty(value = "返回数据")
	private Object data = null;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}
	
	/**
	 * 放入响应码并返回自己
	 */
	public ResultBean fillCode(CodeEnum codeEnum){
		this.setCode(codeEnum.getCode());
		this.setMsg(codeEnum.getDescription());
		return this;
	}
	
	/**
	 * 放入响应码并返回自己
	 */
	public ResultBean fillCode(int code, String msg){
		this.setCode(code);
		this.setMsg(msg);
		return this;
	}

	/**
	 * 放入自定义业务数据集合并返回自己
	 */
	public ResultBean fillData(Object data) {
		this.data = data;
		return this;
	}
	
	/**
	 * 放入单个自定义业务数据并返回自己
	 * @throws Exception 
	 */
	public ResultBean putRecord(String key, Object value) {
		if (this.data == null) {
			Map<String, Object> map = new HashMap<>();
			map.put(key, value);
			this.data = map;
		} else if (this.data instanceof Map) {
			Map<String, Object> map = (Map<String, Object>)this.data;
			map.put(key, value);
		}
		return this;
	}
	
}
