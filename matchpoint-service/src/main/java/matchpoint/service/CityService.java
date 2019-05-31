package matchpoint.service;


import matchpoint.bean.City;

import java.util.List;

/**
 * 城市业务逻辑接口类
 *
 * Created by bysocket on 07/02/2017.
 */
public interface CityService {

    City findCityById(Integer id);

    List<City> findAll();
}
