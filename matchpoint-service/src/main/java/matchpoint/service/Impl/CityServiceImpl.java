package matchpoint.service.Impl;
import matchpoint.bean.City;
import matchpoint.dao.CityDao;
import matchpoint.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 城市业务逻辑实现类
 *
 * Created by bysocket on 07/02/2017.
 */
@Service
public class CityServiceImpl implements CityService {

    @Autowired(required = true)
    private CityDao cityDao;


    @Override
    public City findCityById(Integer id) {
        return cityDao.selectByPrimaryKey(id);
    }


    @Override
    public List<City> findAll() {
        return  cityDao.findAll();
    }

}
