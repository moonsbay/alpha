package com.example.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Country {
	String code;
	String name;
	String continent;
	String region;
	String surfaceArea;   //자바에서 surface_area같은 언더바스콥의 변수명은 쓰지 않는다
	Integer indepYear;
	Long population;
	Double lifeExpectancy;
	Double gnp;
	Double gnpOld;
	String localName;
	String governmentForm;  //테이블에서 데이터타입을 varchar로 바꾸고 테이블 재생성
	String heatOfState;
	Long   capital;
	String code2;
}