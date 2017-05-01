package com.lth.kaoqinsys.dao;

import java.util.ArrayList;

import com.lth.kaoqinsys.pojo.KaoqinReacord;

public interface KaoqinReacordMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(KaoqinReacord record);

    int insertSelective(KaoqinReacord record);

    KaoqinReacord selectByPrimaryKey(Integer id);
    
    ArrayList<KaoqinReacord> selectKaoqinRecordBySomeCondition(int teacher_id,int course_id,int time_map,int student_id,int week,int year,int term);

    int updateByPrimaryKeySelective(KaoqinReacord record);

    int updateByPrimaryKey(KaoqinReacord record);
    
    int selectMaxId();
}