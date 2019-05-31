package matchpoint.common;

import java.util.List;

public class jqGridResult<T> {
    private long state;
    private String message;
    private List<T> rows;
    private long total;
    private long records;
    private int page;
    private String keyword;

    public jqGridResult() {
    }

    public jqGridResult(long state, String message, List<T> rows, long total, long records, int page, String keyword) {
        this.state = state;
        this.message = message;
        this.rows = rows;
        this.total = total;
        this.records = records;
        this.page = page;
        this.keyword = keyword;
    }


    public static <T> jqGridResult<T> success(List<T> rows,long total, long records, int page, String keyword) {
        return new jqGridResult<T>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), rows,total,records,page,keyword);
    }

    public static <T> jqGridResult<T> failed(String message) {
        return new jqGridResult<T>(ResultCode.FAILED.getCode(), message, null,0,0,0,"");
    }
    public static <T> jqGridResult<T> failed() {
        return new jqGridResult<T>(ResultCode.FAILED.getCode(), ResultCode.FAILED.getMessage(), null,0,0,0,"");
    }

    public long getState() {
        return state;
    }

    public void setState(long state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public List<T> getRows() {
        return rows;
    }

    public void setRows(List<T> rows) {
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getRecords() {
        return records;
    }

    public void setRecords(long records) {
        this.records = records;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
