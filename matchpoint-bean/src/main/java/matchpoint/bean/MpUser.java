package matchpoint.bean;

import java.util.Date;

public class MpUser {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserID
     *
     * @mbggenerated
     */
    private Long userid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserGUID
     *
     * @mbggenerated
     */
    private String userguid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserName
     *
     * @mbggenerated
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserNick
     *
     * @mbggenerated
     */
    private String usernick;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserType
     *
     * @mbggenerated
     */
    private Integer usertype;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.RealName
     *
     * @mbggenerated
     */
    private String realname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.Tel
     *
     * @mbggenerated
     */
    private String tel;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserAvatar
     *
     * @mbggenerated
     */
    private String useravatar;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.IsVerifyTel
     *
     * @mbggenerated
     */
    private Integer isverifytel;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserSex
     *
     * @mbggenerated
     */
    private Integer usersex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserJob
     *
     * @mbggenerated
     */
    private String userjob;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserCompany
     *
     * @mbggenerated
     */
    private String usercompany;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.Birthday
     *
     * @mbggenerated
     */
    private Date birthday;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.UserNameInstitution
     *
     * @mbggenerated
     */
    private String usernameinstitution;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.InstitutionName
     *
     * @mbggenerated
     */
    private String institutionname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.TotalIntegral
     *
     * @mbggenerated
     */
    private Long totalintegral;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.IsInstituAuthentication
     *
     * @mbggenerated
     */
    private Integer isinstituauthentication;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.BriefIntroduction
     *
     * @mbggenerated
     */
    private String briefintroduction;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.IsRegisterHere
     *
     * @mbggenerated
     */
    private Integer isregisterhere;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.AddressProvince
     *
     * @mbggenerated
     */
    private String addressprovince;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.AddressCity
     *
     * @mbggenerated
     */
    private String addresscity;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.AddressArea
     *
     * @mbggenerated
     */
    private String addressarea;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.AddressDetailed
     *
     * @mbggenerated
     */
    private String addressdetailed;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.IsBlackListUser
     *
     * @mbggenerated
     */
    private Integer isblacklistuser;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.Note
     *
     * @mbggenerated
     */
    private String note;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.CreateOn
     *
     * @mbggenerated
     */
    private Date createon;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column mp_user.LatestUpdate
     *
     * @mbggenerated
     */
    private Date latestupdate;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table mp_user
     *
     * @mbggenerated
     */
    public MpUser(Long userid, String userguid, String username, String usernick, Integer usertype, String realname, String tel, String useravatar, Integer isverifytel, Integer usersex, String userjob, String usercompany, Date birthday, String usernameinstitution, String institutionname, Long totalintegral, Integer isinstituauthentication, String briefintroduction, Integer isregisterhere, String addressprovince, String addresscity, String addressarea, String addressdetailed, Integer isblacklistuser, String note, Date createon, Date latestupdate) {
        this.userid = userid;
        this.userguid = userguid;
        this.username = username;
        this.usernick = usernick;
        this.usertype = usertype;
        this.realname = realname;
        this.tel = tel;
        this.useravatar = useravatar;
        this.isverifytel = isverifytel;
        this.usersex = usersex;
        this.userjob = userjob;
        this.usercompany = usercompany;
        this.birthday = birthday;
        this.usernameinstitution = usernameinstitution;
        this.institutionname = institutionname;
        this.totalintegral = totalintegral;
        this.isinstituauthentication = isinstituauthentication;
        this.briefintroduction = briefintroduction;
        this.isregisterhere = isregisterhere;
        this.addressprovince = addressprovince;
        this.addresscity = addresscity;
        this.addressarea = addressarea;
        this.addressdetailed = addressdetailed;
        this.isblacklistuser = isblacklistuser;
        this.note = note;
        this.createon = createon;
        this.latestupdate = latestupdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserID
     *
     * @return the value of mp_user.UserID
     *
     * @mbggenerated
     */
    public Long getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserGUID
     *
     * @return the value of mp_user.UserGUID
     *
     * @mbggenerated
     */
    public String getUserguid() {
        return userguid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserName
     *
     * @return the value of mp_user.UserName
     *
     * @mbggenerated
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserNick
     *
     * @return the value of mp_user.UserNick
     *
     * @mbggenerated
     */
    public String getUsernick() {
        return usernick;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserType
     *
     * @return the value of mp_user.UserType
     *
     * @mbggenerated
     */
    public Integer getUsertype() {
        return usertype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.RealName
     *
     * @return the value of mp_user.RealName
     *
     * @mbggenerated
     */
    public String getRealname() {
        return realname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.Tel
     *
     * @return the value of mp_user.Tel
     *
     * @mbggenerated
     */
    public String getTel() {
        return tel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserAvatar
     *
     * @return the value of mp_user.UserAvatar
     *
     * @mbggenerated
     */
    public String getUseravatar() {
        return useravatar;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.IsVerifyTel
     *
     * @return the value of mp_user.IsVerifyTel
     *
     * @mbggenerated
     */
    public Integer getIsverifytel() {
        return isverifytel;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserSex
     *
     * @return the value of mp_user.UserSex
     *
     * @mbggenerated
     */
    public Integer getUsersex() {
        return usersex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserJob
     *
     * @return the value of mp_user.UserJob
     *
     * @mbggenerated
     */
    public String getUserjob() {
        return userjob;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserCompany
     *
     * @return the value of mp_user.UserCompany
     *
     * @mbggenerated
     */
    public String getUsercompany() {
        return usercompany;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.Birthday
     *
     * @return the value of mp_user.Birthday
     *
     * @mbggenerated
     */
    public Date getBirthday() {
        return birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.UserNameInstitution
     *
     * @return the value of mp_user.UserNameInstitution
     *
     * @mbggenerated
     */
    public String getUsernameinstitution() {
        return usernameinstitution;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.InstitutionName
     *
     * @return the value of mp_user.InstitutionName
     *
     * @mbggenerated
     */
    public String getInstitutionname() {
        return institutionname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.TotalIntegral
     *
     * @return the value of mp_user.TotalIntegral
     *
     * @mbggenerated
     */
    public Long getTotalintegral() {
        return totalintegral;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.IsInstituAuthentication
     *
     * @return the value of mp_user.IsInstituAuthentication
     *
     * @mbggenerated
     */
    public Integer getIsinstituauthentication() {
        return isinstituauthentication;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.BriefIntroduction
     *
     * @return the value of mp_user.BriefIntroduction
     *
     * @mbggenerated
     */
    public String getBriefintroduction() {
        return briefintroduction;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.IsRegisterHere
     *
     * @return the value of mp_user.IsRegisterHere
     *
     * @mbggenerated
     */
    public Integer getIsregisterhere() {
        return isregisterhere;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.AddressProvince
     *
     * @return the value of mp_user.AddressProvince
     *
     * @mbggenerated
     */
    public String getAddressprovince() {
        return addressprovince;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.AddressCity
     *
     * @return the value of mp_user.AddressCity
     *
     * @mbggenerated
     */
    public String getAddresscity() {
        return addresscity;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.AddressArea
     *
     * @return the value of mp_user.AddressArea
     *
     * @mbggenerated
     */
    public String getAddressarea() {
        return addressarea;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.AddressDetailed
     *
     * @return the value of mp_user.AddressDetailed
     *
     * @mbggenerated
     */
    public String getAddressdetailed() {
        return addressdetailed;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.IsBlackListUser
     *
     * @return the value of mp_user.IsBlackListUser
     *
     * @mbggenerated
     */
    public Integer getIsblacklistuser() {
        return isblacklistuser;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.Note
     *
     * @return the value of mp_user.Note
     *
     * @mbggenerated
     */
    public String getNote() {
        return note;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.CreateOn
     *
     * @return the value of mp_user.CreateOn
     *
     * @mbggenerated
     */
    public Date getCreateon() {
        return createon;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column mp_user.LatestUpdate
     *
     * @return the value of mp_user.LatestUpdate
     *
     * @mbggenerated
     */
    public Date getLatestupdate() {
        return latestupdate;
    }
}