package com.qd.service;

import com.qd.model.AreaElement;

import java.util.ArrayList;
import java.util.List;

public interface AreaElementService {
    List<AreaElement> getDataByAreaName(String areaName);

    Integer updateOneData(AreaElement areaElement);


}
