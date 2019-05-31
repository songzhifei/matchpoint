
var getGovernmentGenre = function () {
    return [
        { "Value": 0, "Text": "" },
        { "Value": 1, "Text": "政府" },
        { "Value": 2, "Text": "公安" },
        { "Value": 3, "Text": "交通" },
        { "Value": 4, "Text": "医疗" },
        { "Value": 5, "Text": "市政" },
        { "Value": 6, "Text": "司法" },
        { "Value": 7, "Text": "工商税务" },
        { "Value": 8, "Text": "团委" },
        { "Value": 9, "Text": "招商" },
        { "Value": 10, "Text": "涉外" },
        { "Value": 11, "Text": "旅游机构" },
        { "Value": 12, "Text": "部队" },
        { "Value": 99, "Text": "其他" }
    ]
};

var getGovernmentLevel = function () {
    return [
        { "Value": 0, "Text": "" },
        { "Value": 1, "Text": "省部级" },
        { "Value": 2, "Text": "厅局级" },
        { "Value": 3, "Text": "县处级" },
        { "Value": 4, "Text": "县处级以下" }
    ];
};

var getSchoolGenre = function () {
    return [
        { "Value": 0, "Text": "" },
        { "Value": 1, "Text": "学前" },
        { "Value": 2, "Text": "小学" },
        { "Value": 3, "Text": "初中" },
        { "Value": 4, "Text": "高中" },
        { "Value": 5, "Text": "高校" },
        { "Value": 6, "Text": "出国留学" },
        { "Value": 7, "Text": "教育培训" },
        { "Value": 8, "Text": "项目活动" },
        { "Value": 9, "Text": "校友会" },
         { "Value": 99, "Text": "其他" }
    ];
};

var getOthersGenre = function () {
    return [
         { "Value": 0, "Text": "" },
         { "Value": 1, "Text": "公益组织" },
         {
             "Value": 2,
             "Text": "媒体组织",
             "ChildNodes": [
                { "Value": 0, "Text": "" },
                { "Value": 1, "Text": "报纸" },
                { "Value": 2, "Text": "杂志" },
                { "Value": 3, "Text": "新媒体" },
                { "Value": 4, "Text": "媒体网站" },
                { "Value": 5, "Text": "通讯社" },
                { "Value": 6, "Text": "电视电台" },
                { "Value": 7, "Text": "机构自媒体" },
                { "Value": 8, "Text": "影视娱乐" },
                { "Value": 9, "Text": "博客" },
                { "Value": 99, "Text": "其他" }
             ]
         },
         { "Value": 99, "Text": "其他组织团体" }
    ];
};

var getCompanyCategory = function (parentId) {
    var nodeList = 
    [
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "100001",
                "Icon": null,
                "Value": "100001",
                "Text": "电子商务",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100002",
                "Icon": null,
                "Value": "100002",
                "Text": "社交媒体",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100003",
                "Icon": null,
                "Value": "100003",
                "Text": "APP应用",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100004",
                "Icon": null,
                "Value": "100004",
                "Text": "软件",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100005",
                "Icon": null,
                "Value": "100005",
                "Text": "网络产品",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100006",
                "Icon": null,
                "Value": "100006",
                "Text": "互联网技术",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100007",
                "Icon": null,
                "Value": "100007",
                "Text": "游戏",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100008",
                "Icon": null,
                "Value": "100008",
                "Text": "内容资讯",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100009",
                "Icon": null,
                "Value": "100009",
                "Text": "团购/导购返利",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100010",
                "Icon": null,
                "Value": "100010",
                "Text": "打印机及耗材",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100011",
                "Icon": null,
                "Value": "100011",
                "Text": "笔记本",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100012",
                "Icon": null,
                "Value": "100012",
                "Text": "台式机",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100013",
                "Icon": null,
                "Value": "100013",
                "Text": "电脑配件",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100014",
                "Icon": null,
                "Value": "100014",
                "Text": "平板电脑",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100015",
                "Icon": null,
                "Value": "100015",
                "Text": "大家电/生活电器",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100016",
                "Icon": null,
                "Value": "100016",
                "Text": "数码产品",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100017",
                "Icon": null,
                "Value": "100017",
                "Text": "数码产品周边/配件",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100018",
                "Icon": null,
                "Value": "100018",
                "Text": "照相机",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100019",
                "Icon": null,
                "Value": "100019",
                "Text": "手机厂商",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100020",
                "Icon": null,
                "Value": "100020",
                "Text": "运营商/电信服务",
                "SortCode": null,
                "ParentId": "100000"
            },
            {
                "ChildNodes": null,
                "Id": "100021",
                "Icon": null,
                "Value": "100021",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "100000"
            }
          ],
          "Id": "100000",
          "Icon": null,
          "Value": "100000",
          "Text": "IT/互联网/电子产品",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "200001",
                "Icon": null,
                "Value": "200001",
                "Text": "法律咨询",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200002",
                "Icon": null,
                "Value": "200002",
                "Text": "财务会计/评估",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200003",
                "Icon": null,
                "Value": "200003",
                "Text": "广告公关",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200004",
                "Icon": null,
                "Value": "200004",
                "Text": "人力资源",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200005",
                "Icon": null,
                "Value": "200005",
                "Text": "网站建设/推广",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200006",
                "Icon": null,
                "Value": "200006",
                "Text": "翻译/速记",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200007",
                "Icon": null,
                "Value": "200007",
                "Text": "咨询顾问",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200008",
                "Icon": null,
                "Value": "200008",
                "Text": "办公耗材/设备",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200009",
                "Icon": null,
                "Value": "200009",
                "Text": "印刷包装",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200010",
                "Icon": null,
                "Value": "200010",
                "Text": "招商加盟",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200011",
                "Icon": null,
                "Value": "200011",
                "Text": "互联网营销",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200012",
                "Icon": null,
                "Value": "200012",
                "Text": "礼品制定",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200013",
                "Icon": null,
                "Value": "200013",
                "Text": "网络解决方案",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200014",
                "Icon": null,
                "Value": "200014",
                "Text": "展会服务",
                "SortCode": null,
                "ParentId": "200000"
            },
            {
                "ChildNodes": null,
                "Id": "200015",
                "Icon": null,
                "Value": "200015",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "200000"
            }
          ],
          "Id": "200000",
          "Icon": null,
          "Value": "200000",
          "Text": "商务服务",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "300001",
                "Icon": null,
                "Value": "300001",
                "Text": "文化活动/演出/票务",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300002",
                "Icon": null,
                "Value": "300002",
                "Text": "体育户外",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300003",
                "Icon": null,
                "Value": "300003",
                "Text": "文化出版",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300004",
                "Icon": null,
                "Value": "300004",
                "Text": "影视传播",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300005",
                "Icon": null,
                "Value": "300005",
                "Text": "体育场馆",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300006",
                "Icon": null,
                "Value": "300006",
                "Text": "书店/图书馆",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300007",
                "Icon": null,
                "Value": "300007",
                "Text": "比赛",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300008",
                "Icon": null,
                "Value": "300008",
                "Text": "展览",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300009",
                "Icon": null,
                "Value": "300009",
                "Text": "博物馆",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300010",
                "Icon": null,
                "Value": "300010",
                "Text": "唱片/娱乐公司",
                "SortCode": null,
                "ParentId": "300000"
            },
            {
                "ChildNodes": null,
                "Id": "300011",
                "Icon": null,
                "Value": "300011",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "300000"
            }
          ],
          "Id": "300000",
          "Icon": null,
          "Value": "300000",
          "Text": "文化体育",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "400001",
                "Icon": null,
                "Value": "400001",
                "Text": "职业技能培训",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400002",
                "Icon": null,
                "Value": "400002",
                "Text": "高考/中考/小升初",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400003",
                "Icon": null,
                "Value": "400003",
                "Text": "留学出国",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400004",
                "Icon": null,
                "Value": "400004",
                "Text": "胎教/母婴教育/亲子",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400005",
                "Icon": null,
                "Value": "400005",
                "Text": "外语培训",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400006",
                "Icon": null,
                "Value": "400006",
                "Text": "在线教育",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400007",
                "Icon": null,
                "Value": "400007",
                "Text": "家教",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400008",
                "Icon": null,
                "Value": "400008",
                "Text": "IT培训",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400009",
                "Icon": null,
                "Value": "400009",
                "Text": "MBA管理培训",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400010",
                "Icon": null,
                "Value": "400010",
                "Text": "少儿英语",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400011",
                "Icon": null,
                "Value": "400011",
                "Text": "考研",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400012",
                "Icon": null,
                "Value": "400012",
                "Text": "公务员考试",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400013",
                "Icon": null,
                "Value": "400013",
                "Text": "司法考试",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400014",
                "Icon": null,
                "Value": "400014",
                "Text": "心理教育",
                "SortCode": null,
                "ParentId": "400000"
            },
            {
                "ChildNodes": null,
                "Id": "400015",
                "Icon": null,
                "Value": "400015",
                "Text": "艺术培训",
                "SortCode": null,
                "ParentId": "400000"
            }
          ],
          "Id": "400000",
          "Icon": null,
          "Value": "400000",
          "Text": "教育出国",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "500001",
                "Icon": null,
                "Value": "500001",
                "Text": "基金证券",
                "SortCode": null,
                "ParentId": "500000"
            },
            {
                "ChildNodes": null,
                "Id": "500002",
                "Icon": null,
                "Value": "500002",
                "Text": "银行",
                "SortCode": null,
                "ParentId": "500000"
            },
            {
                "ChildNodes": null,
                "Id": "500003",
                "Icon": null,
                "Value": "500003",
                "Text": "保险",
                "SortCode": null,
                "ParentId": "500000"
            },
            {
                "ChildNodes": null,
                "Id": "500004",
                "Icon": null,
                "Value": "500004",
                "Text": "金融理财",
                "SortCode": null,
                "ParentId": "500000"
            },
            {
                "ChildNodes": null,
                "Id": "500005",
                "Icon": null,
                "Value": "500005",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "500000"
            }
          ],
          "Id": "500000",
          "Icon": null,
          "Value": "500000",
          "Text": "金融服务",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "600001",
                "Icon": null,
                "Value": "600001",
                "Text": "药品",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600002",
                "Icon": null,
                "Value": "600002",
                "Text": "医疗器材",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600003",
                "Icon": null,
                "Value": "600003",
                "Text": "医院",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600004",
                "Icon": null,
                "Value": "600004",
                "Text": "诊所/出诊",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600005",
                "Icon": null,
                "Value": "600005",
                "Text": "整容整形",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600006",
                "Icon": null,
                "Value": "600006",
                "Text": "康复/疗养",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600007",
                "Icon": null,
                "Value": "600007",
                "Text": "保健养生",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600008",
                "Icon": null,
                "Value": "600008",
                "Text": "心理健康",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600009",
                "Icon": null,
                "Value": "600009",
                "Text": "体检中心",
                "SortCode": null,
                "ParentId": "600000"
            },
            {
                "ChildNodes": null,
                "Id": "600010",
                "Icon": null,
                "Value": "600010",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "600000"
            }
          ],
          "Id": "600000",
          "Icon": null,
          "Value": "600000",
          "Text": "医疗健康企业",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "700001",
                "Icon": null,
                "Value": "700001",
                "Text": "宽带/电信服务",
                "SortCode": null,
                "ParentId": "700000"
            },
            {
                "ChildNodes": null,
                "Id": "700002",
                "Icon": null,
                "Value": "700002",
                "Text": "通讯器材",
                "SortCode": null,
                "ParentId": "700000"
            },
            {
                "ChildNodes": null,
                "Id": "700003",
                "Icon": null,
                "Value": "700003",
                "Text": "运营商",
                "SortCode": null,
                "ParentId": "700000"
            },
            {
                "ChildNodes": null,
                "Id": "700004",
                "Icon": null,
                "Value": "700004",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "700000"
            }
          ],
          "Id": "700000",
          "Icon": null,
          "Value": "700000",
          "Text": "通讯服务",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "800001",
                "Icon": null,
                "Value": "800001",
                "Text": "工业用品",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800002",
                "Icon": null,
                "Value": "800002",
                "Text": "能源",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800003",
                "Icon": null,
                "Value": "800003",
                "Text": "化工",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800004",
                "Icon": null,
                "Value": "800004",
                "Text": "农林牧渔业",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800005",
                "Icon": null,
                "Value": "800005",
                "Text": "制造业",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800006",
                "Icon": null,
                "Value": "800006",
                "Text": "贸易公司",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800007",
                "Icon": null,
                "Value": "800007",
                "Text": "农副产品",
                "SortCode": null,
                "ParentId": "800000"
            },
            {
                "ChildNodes": null,
                "Id": "800008",
                "Icon": null,
                "Value": "800008",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "800000"
            }
          ],
          "Id": "800000",
          "Icon": null,
          "Value": "800000",
          "Text": "工商农贸",
          "SortCode": null,
          "ParentId": "0"
      },
      {
          "ChildNodes": [
            {
                "ChildNodes": null,
                "Id": "900001",
                "Icon": null,
                "Value": "900001",
                "Text": "餐饮服务",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900002",
                "Icon": null,
                "Value": "900002",
                "Text": "食品饮料",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900003",
                "Icon": null,
                "Value": "900003",
                "Text": "美容美发/彩妆卫浴",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900004",
                "Icon": null,
                "Value": "900004",
                "Text": "休闲娱乐",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900005",
                "Icon": null,
                "Value": "900005",
                "Text": "服饰/箱包/运动户外",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900006",
                "Icon": null,
                "Value": "900006",
                "Text": "生活服务",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900007",
                "Icon": null,
                "Value": "900007",
                "Text": "旅游酒店",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900008",
                "Icon": null,
                "Value": "900008",
                "Text": "汽车交通",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900009",
                "Icon": null,
                "Value": "900009",
                "Text": "商场购物",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900010",
                "Icon": null,
                "Value": "900010",
                "Text": "房产家居/装饰",
                "SortCode": null,
                "ParentId": "900000"
            },
            {
                "ChildNodes": null,
                "Id": "900011",
                "Icon": null,
                "Value": "900011",
                "Text": "其他",
                "SortCode": null,
                "ParentId": "900000"
            }
          ],
          "Id": "900000",
          "Icon": null,
          "Value": "900000",
          "Text": "其他",
          "SortCode": null,
          "ParentId": "0"
      }
    ];
    if (!parentId || parentId == 0) { return nodeList; }
    for (var i = 0; i < nodeList.length; i++) {
        var node = nodeList[i];
        if (node.Id == parentId)
        {
            return node.ChildNodes;
        }
    }
};