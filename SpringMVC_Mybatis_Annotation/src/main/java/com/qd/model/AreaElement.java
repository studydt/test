package com.qd.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AreaElement {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer pointId;
    @Id
    private String areaName;
    private Double waterElement;
    private Double saltElement;
    private Double nElement;

	public Integer getPointId() {
		return pointId;
	}
	public String getAreaName() {
		return areaName;
	}
	public Double getWaterElement() {
		return waterElement;
	}
	public Double getSaltElement() {
		return saltElement;
	}
	public Double getNElement() {
		return nElement;
	}


	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public void setnElement(Double nElement) {
		this.nElement = nElement;
	}

	public void setPointId(Integer pointId) {
		this.pointId = pointId;
	}

	public void setSaltElement(Double saltElement) {
		this.saltElement = saltElement;
	}

	public void setWaterElement(Double waterElement) {
		this.waterElement = waterElement;
	}
}
