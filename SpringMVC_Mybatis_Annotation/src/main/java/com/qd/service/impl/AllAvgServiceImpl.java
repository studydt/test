package com.qd.service.impl;

import com.qd.mapper.AllAvgMapper;
import com.qd.model.AllAvg;
import com.qd.service.AllAvgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AllAvgServiceImpl implements AllAvgService {

    @Autowired
    private AllAvgMapper allAvgMapper;

    @Override
    public List<AllAvg> getData() {
        return allAvgMapper.selectAll();
    }

    @Override
    public Integer updateByAreanName(AllAvg allAvg) {
        Integer result=allAvgMapper.updateByPrimaryKey(allAvg);
        return result;
    }
}
