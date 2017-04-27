package com.lth.kaoqinsys.utils;

/**
 * @author duoyi
 *
 */
public class ActionResult {
    private int code;
    private String message;
    private Object data;
    public  ActionResult() {
		this.code=1;
		this.message="成功";
	}
    public  ActionResult(int code) {
		this.code=code;
		this.message="成功";
	}
    public  ActionResult(int code,String message) {
		this.code=code;
		this.message=message;
	}
    
    public  ActionResult(int code,String message,Object data) {
		this.code=code;
		this.message=message;
		this.data=data;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
    
}
