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
public class AllAvg {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String areaName;
    private Double waterAvg;
    private Double saltAvg;
    private Double nAvg;

	public Double getNAvg() {
		return nAvg;
	}

	public Double getSaltAvg() {
		return saltAvg;
	}

	public Double getWaterAvg() {
		return waterAvg;
	}

	public String getAreaName() {
		return areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public void setNAvg(Double nAvg) {
		this.nAvg = nAvg;
	}

	public void setSaltAvg(Double saltAvg) {
		this.saltAvg = saltAvg;
	}

	public void setWaterAvg(Double waterAvg) {
		this.waterAvg = waterAvg;
	}
}
