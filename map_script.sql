-- 산림청 등산로&구간 데이터, GRS80 타원체를 사용하고 한국 중부원점을 기준으로 잡은 ITRF2000 기반의 TM 좌표계
/* 
SELECT * FROM V$VERSION;
SELECT * FROM mr;
SELECT geometry FROM MountainRoad where pmntn_sn = 27058;
select comp_name, version, status from dba_registry;
SELECT * FROM v$option WHERE parameter = 'Spatial';
SELECT * FROM user_sdo_geom_metadata;
SELECT comp_id, version, status FROM dba_registry WHERE comp_id IN ('JAVAVM', 'ORDIM', 'XDB');
SELECT * FROM all_objects WHERE object_name IN ('SDO_GEOMETRY', 'SDO_UTIL');
*/

/*
desc ms;
desc mr;
desc HikingRoadSpot;
desc HikingRoadInfo;
desc HikingRoadCoord;
*/

--rename MountainRoad to mr;
--rename MountainSpot to ms;

/*
SELECT * FROM ms, TABLE(SDO_UTIL.GETVERTICES(ms.GEOMETRY)) t;
SELECT * FROM mr, TABLE(SDO_UTIL.GETVERTICES(mr.GEOMETRY)) t;
*/

/*
SELECT t.X, t.Y FROM ms, TABLE(SDO_UTIL.GETVERTICES(ms.GEOMETRY)) t WHERE detail_spo = '시종점';
SELECT t.X, t.Y FROM ms, TABLE(SDO_UTIL.GETVERTICES(ms.GEOMETRY)) t WHERE pmntn_spot = 44700;
*/

-- HikingRoadSpot(등산로 지점) 테이블 생성용 Query
--SELECT pmntn_spot, mntn_code, detail_spo, mntn_nm, t.X, t.Y FROM ms, TABLE(SDO_UTIL.GETVERTICES(ms.GEOMETRY)) t ORDER BY pmntn_spot ASC;

-- HikingRoadInfo(등산로 구간) 테이블 생성용 Query, 구간별 좌표 정보는 제외
--SELECT DISTINCT pmntn_sn, mntn_code, mntn_nm, pmntn_lt, pmntn_dffl, pmntn_uppl, pmntn_godn FROM mr, TABLE(SDO_UTIL.GETVERTICES(mr.GEOMETRY)) t ORDER BY pmntn_sn ASC;

-- HikingRoadCoord(등산로 구간) 테이블 생성용 Query, 구간별 좌표 정보만 포함
--SELECT pmntn_sn, id, mntn_code, t.X, t.Y FROM mr, TABLE(SDO_UTIL.GETVERTICES(mr.GEOMETRY)) t;

-- 등산로 지점 테이블
CREATE TABLE HikingRoadSpot (
    spot_id number PRIMARY KEY NOT NULL,
    mt_id varchar2(9),
    spot_type varchar2(200),
    mt_name varchar2(50),
    spot_x number,
    spot_y number
    --,FOREIGN KEY (mt_id) REFERENCES MountainList(mt_id)
);

INSERT INTO HikingRoadSpot SELECT pmntn_spot, mntn_code, detail_spo, mntn_nm, t.X, t.Y FROM ms, TABLE(SDO_UTIL.GETVERTICES(ms.GEOMETRY)) t ORDER BY pmntn_spot ASC;

SELECT * FROM HikingRoadSpot;

-- 등산로 구간-정보 테이블
CREATE TABLE HikingRoadInfo (
    road_id number PRIMARY KEY NOT NULL,
    mt_id varchar2(9),
    mt_name varchar2(50),
    road_km number,
    road_level varchar2(8),
    road_time_up number,
    road_time_down number
    --,FOREIGN KEY (mt_id) REFERENCES MountainList(mt_id)
);

INSERT INTO HikingRoadInfo SELECT DISTINCT pmntn_sn, mntn_code, mntn_nm, pmntn_lt, pmntn_dffl, pmntn_uppl, pmntn_godn FROM mr, TABLE(SDO_UTIL.GETVERTICES(mr.GEOMETRY)) t ORDER BY pmntn_sn ASC;

SELECT * FROM HikingRoadInfo;

-- 등산로 구간-좌표 테이블
CREATE TABLE HikingRoadCoord (
    coord_id number PRIMARY KEY NOT NULL,
    road_id number,
    road_seq number,
    mt_code varchar2(9),
    road_x number,
    road_y number,
    FOREIGN KEY (road_id) REFERENCES HikingRoadInfo(road_id)
);

CREATE Sequence seqHikingRoadCoord START WITH 1 INCREMENT BY 1;

INSERT INTO HikingRoadCoord SELECT seqHikingRoadCoord.nextVal, pmntn_sn, id, mntn_code, t.X, t.Y FROM mr, TABLE(SDO_UTIL.GETVERTICES(mr.GEOMETRY)) t;

SELECT * FROM HikingRoadCoord;
