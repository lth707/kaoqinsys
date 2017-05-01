package com.lth.kaoqinsys.pojo;

public class KaoqinReacord {
    private Integer id;

    private Integer teacherId;

    private Integer courseId;

    private Integer timeMap;

    private Integer studentId;

    private Integer state;

    private Integer week;

    private Integer year;

    private Byte term;

    public KaoqinReacord(){};
			
    public KaoqinReacord(Integer teacherId, Integer courseId,
			Integer timeMap, Integer studentId, Integer state, Integer week,
			Integer year, Byte term) {
		super();
		this.teacherId = teacherId;
		this.courseId = courseId;
		this.timeMap = timeMap;
		this.studentId = studentId;
		this.state = state;
		this.week = week;
		this.year = year;
		this.term = term;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getTimeMap() {
        return timeMap;
    }

    public void setTimeMap(Integer timeMap) {
        this.timeMap = timeMap;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getWeek() {
        return week;
    }

    public void setWeek(Integer week) {
        this.week = week;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Byte getTerm() {
        return term;
    }

    public void setTerm(Byte term) {
        this.term = term;
    }
}