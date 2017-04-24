package com.lth.kaoqinsys.dao;

import com.lth.kaoqinsys.pojo.T_C_S;

public interface T_C_SMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(T_C_S record);

    int insertSelective(T_C_S record);

    T_C_S selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(T_C_S record);

    int updateByPrimaryKey(T_C_S record);
}