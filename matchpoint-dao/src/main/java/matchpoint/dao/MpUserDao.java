package matchpoint.dao;



import matchpoint.bean.MpUser;
import matchpoint.mapper.MpUserMapper;

import java.util.List;

public interface MpUserDao extends MpUserMapper {
    /**
     * 获取所有内容
     */
    List<MpUser> findAll();
}
