package com.lth.kaoqinsys.enump;

public class normalenum {
	public enum TCSTYPE
	{
	    TEACHER(0), STUDENT(1);

	    private int _value;

	    private TCSTYPE(int value)
	    {
	        _value = value;
	    }

	    public int value()
	    {
	        return _value;
	    }
	}
	
	public enum TCSSTATE
	{
		ABSEBT(0), ATTEND(1);

	    private int _value;

	    private TCSSTATE(int value)
	    {
	        _value = value;
	    }

	    public int value()
	    {
	        return _value;
	    }
	}
}
