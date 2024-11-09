package com.test.hike.mapper;

import com.test.hike.dto.ClubDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ClubMapper {

	List<ClubDTO> clubList();
	ClubDTO clubView(String club_id);
	ClubDTO clubScheduler(String club_id);
}

