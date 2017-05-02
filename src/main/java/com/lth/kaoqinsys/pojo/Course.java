package com.lth.kaoqinsys.pojo;

public class Course {
    private Integer id;

    private String name;

    private String classroom;
    
    private  int maxweek;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom == null ? null : classroom.trim();
    }

	public int getMaxweek() {
		return maxweek;
	}

	public void setMaxweek(int maxweek) {
		this.maxweek = maxweek;
	}
}