package com.qd.service;

import com.qd.model.AllAvg;
import org.springframework.stereotype.Service;

import java.util.List;


public interface AllAvgService {
    List<AllAvg> getData();


    Integer updateByAreanName(AllAvg allAvg);
}
