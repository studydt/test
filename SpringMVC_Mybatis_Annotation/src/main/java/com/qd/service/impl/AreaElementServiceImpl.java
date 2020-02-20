package com.qd.service.impl;

import com.qd.mapper.AreaElementMapper;
import com.qd.model.AreaElement;
import com.qd.service.AreaElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public class AreaElementServiceImpl implements AreaElementService {
    @Autowired
    private AreaElementMapper areaElementMapper;


    @Override
    public List<AreaElement> getDataByAreaName(String areaName) {
        Example example=new Example(AreaElement.class);
        Example.Criteria criteria=example.createCriteria();
        criteria.andLike("areaName",areaName);
        List<AreaElement> list=areaElementMapper.selectByExample(example);
        return list;
    }

    @Override
    public Integer updateOneData(AreaElement areaElement) {
        Integer result=areaElementMapper.updateByPrimaryKey(areaElement);
        return result;
    }
}
