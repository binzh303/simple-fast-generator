package website.abin.common;

/**
* @ClassName: CodeEnum
* @Description: 响应结果枚举类
* @Author: zhbin
* @CreateDate: 2020/4/2 14:35
* @Version: 1.0
*/
public enum CodeEnum {
//	用户根据自己的需求完善此枚举类
	
	SUCCESS("success", 0),
	ERROR("请求异常", 10001),
	;
	
	private String description;
	private int code;

	 CodeEnum(String description, int code) {
		this.description = description;
		this.code = code;
	}

	public static String getName(int code) {
		for (CodeEnum c : CodeEnum.values()) {
			if (c.getCode() == code) {
				return c.description;
			}
		}
		return null;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
}
