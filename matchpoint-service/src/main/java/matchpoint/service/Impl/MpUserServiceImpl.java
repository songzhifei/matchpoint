package matchpoint.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import matchpoint.bean.MpUser;
import matchpoint.dao.MpUserDao;
import matchpoint.service.MpUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MpUserServiceImpl implements MpUserService {
    @Autowired
    private MpUserDao mpUserDao;
    @Override
    public PageInfo GetList(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        List<MpUser> list = mpUserDao.findAll();
        PageInfo<MpUser> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }
}
