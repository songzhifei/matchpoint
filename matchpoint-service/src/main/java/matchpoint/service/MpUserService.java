package matchpoint.service;

import com.github.pagehelper.PageInfo;

public interface MpUserService {
    PageInfo GetList(int pageNum, int pageSize);
}
