package com.qd.controller;
import com.qd.mapper.AllAvgMapper;
import com.qd.model.AllAvg;
import com.qd.service.AllAvgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("allAvg")
public class AllAvgController{

        @Autowired
        private AllAvgService allAvgService;


        @CrossOrigin//跨域注解
        @ResponseBody
        @RequestMapping("getData")
        public List<AllAvg> getData(){
            List<AllAvg> list=allAvgService.getData();
            return list;
        }



}
