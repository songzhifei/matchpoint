package matchpoint.dao;

import matchpoint.bean.User;
import matchpoint.mapper.UserMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao extends UserMapper {
    /**
     * 根据城市名称，查询城市信息
     *
     * @param userName 用户名
     */
    User findByName(@Param("userName") String userName);
    /**
     * 获取所有内容
     */
    List<User> findAll();
}
