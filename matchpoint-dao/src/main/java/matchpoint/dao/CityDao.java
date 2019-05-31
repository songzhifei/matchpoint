package matchpoint.dao;

import matchpoint.bean.City;
import matchpoint.mapper.CityMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CityDao extends CityMapper {
    /**
     * 根据城市名称，查询城市信息
     *
     * @param cityName 城市名
     */
    City findByName(@Param("cityName") String cityName);
    /**
     * 获取所有内容
     */
    List<City> findAll();
}
