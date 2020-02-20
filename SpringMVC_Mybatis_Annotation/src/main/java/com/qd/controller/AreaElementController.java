package com.qd.controller;

import com.qd.model.AllAvg;
import com.qd.model.AreaElement;
import com.qd.service.AllAvgService;
import com.qd.service.AreaElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("AreaElement")
public class AreaElementController {

    @Autowired
    private AreaElementService areaElementService;
    @Autowired
    private AllAvgService allAvgService;


    @CrossOrigin//跨域注解
    @ResponseBody
    @RequestMapping("getData")
    public List<AreaElement> getData(String areaName){
        List<AreaElement> areaElements=areaElementService.getDataByAreaName(areaName);
        return areaElements;
    }

    @ResponseBody
    @RequestMapping("postDataTest")
    public AreaElement postDataTest(@RequestBody AreaElement areaElement){

        return areaElement;
    }

    @ResponseBody
    @RequestMapping("postData")
    public AreaElement postData(@RequestBody AreaElement areaElement){
        Integer result= areaElementService.updateOneData(areaElement);
        ArrayList<AreaElement> areaElements= (ArrayList<AreaElement>) areaElementService.getDataByAreaName(areaElement.getAreaName());
        AllAvg allAvg=handlePoints(areaElement.getAreaName(),areaElements);
        Integer result2=allAvgService.updateByAreanName(allAvg);
        if(result>0&&result2>0){
            return areaElement;
        }

        return new AreaElement();
    }

    private AllAvg handlePoints(String areaName, ArrayList<AreaElement> areaElements) {
        AllAvg allAvg=new AllAvg();
        allAvg.setAreaName(areaName);
        //各个属性值
        double waterAvg=0,nAvg=0,saltAvg=0;
        //点的个数
        double ans=0;
        for(AreaElement areaElement:areaElements){
            waterAvg+=areaElement.getWaterElement();
            nAvg+=areaElement.getNElement();
            saltAvg+=areaElement.getSaltElement();
            ans+=1;
        }
        allAvg.setWaterAvg(waterAvg/ans);
        allAvg.setNAvg(nAvg/ans);
        allAvg.setSaltAvg(saltAvg/ans);
        return allAvg;
    }


}
