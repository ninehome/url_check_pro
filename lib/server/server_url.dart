
class ServerUrl {
  /// 登录
  static String login= "/api/account/login"; // 登录
  static String register = '/api/register'; // 注册
  static String logOut = "/api/logout"; // 登出
  static String wechatLogin = "/api/wx/login"; // 微信登录
  static String getUploadToken = "/api/upload/token"; // 获取上传token
  static String getUserInfo = "/api/member/info"; // 获取用户信息
  static String userVerify = "/api/member/authentication"; // 身份认证
  static String idCardVerify = "/api/member/security/verifyIdCard"; // 安全中心-身份验证
  static String smsVerify = "/api/member/security/smsVerify"; // 安全中心-短信验证\
  static String sendSms = "/api/sms/send"; // 发送验证码 短信行为类型:login,closeShop,securityCenter
  static String checkAuth = "/api/member/authComplete"; // 认证完成，确认是否提示认证
  static String sendLoginSms = "/api/sms/send/login"; // 发送登录短信
  static String SMSsend = "/api/sms/send"; // 非注册 登录短信

  static String appDownload = "/api/download"; // 落地页
  static String appVersion = "/api/version"; // 版本号
  static String changeUserAvatar = "/api/member/bind/avatar"; // 修改用户头像
  static String vipConfig = "/api/level/getLevelConfig"; // vip等级配置
  static String captchaGet = "/api/system/captcha/get"; // 获得行为验证码信息
  static String captchaCheck = "/api/system/captcha/check"; // 检查
  static String countryList = "/api/common-config/phoneRegionCode"; // 获取国家列表区域码

  /// 首页
  static String getHomeConfig = "/api/home/config"; // 获取首页配置信息
  static String getHomeStoreList = "/api/shop/queryList"; // 获取首页店铺列表
  static String getH5Config = "/api/home/introduction"; // 根据key获取对应H5

  /// 品牌合作
  static String getCoBrandingNewsList = "/api/merchant/news"; // 品牌合作新闻列表
  static String getCoBrandingNewsDetail = "/api/merchant/news/detail"; // 品牌合作新闻详情

  /// 任务
  static String userSign = "/api/task/sign"; // 签到
  static String getTaskScore = "/api/task/get/score"; // 领取任务积分
  static String getPointsMallQuestionList = "/api/task/queryAll"; // 查看积分任务
  static String getUnReceivedTask = "/api/task/not/received"; // 查看未领取的积分任务

  /// 积分商城
  static String getPointsGoodsList = "/api/score/goods/list"; // 积分商品列表
  static String getPointsMallCategory = "/api/goodsCategory/scoreShop"; // 获取积分商城分类
  static String getPointsGoodDetail = "/api/score/goods/info"; // 积分商品详情
  static String exchangePointsMallGoods = "/api/score/exchange"; // 兑换积分商品
  static String exchangePointsMallRecord = "/api/score/exchange/record"; // 兑换积分商品记录
  static String getScoreChangeRecord = "/api/score/change/record"; // 积分明细列表
  static String getPointsMallOrderInfo = "/api/score/order/info"; // 积分商城订单详情
  static String payPointsMallOrder = "/api/score/order/pay"; // 支付商品订单
  static String getUserAddress = "/api/member/address/list"; // 获取用户收货地址列表
  static String deleteUserAddress = "/api/member/address/del"; // 删除用户收货地址
  static String editUserAddress = "/api/member/address/edit"; // 修改用户收货地址
  static String bindUserAddress = "/api/member/address/bind"; // 绑定用户收货地址
  static String cancelPointsMallOrder = "/api/score/cancel/order"; // 取消订单
  static String orderExpress = "/api/score/order/express"; // 订单物流

  /// 商铺
  static String applyShop = "/api/shop_info/create"; // 申请店铺
  static String shopDetail = "/api/shop_info/info"; // 店铺详情
  static String userShopDetail = "/api/shop_info/user/info"; // 当前用户店铺详情
  static String shopRegionConfig = "/api/shop/regionConfig"; // 获取国家配置

  /// 订单
  static String createOrder = "/api/order/create"; // 创建订单
  static String cancelOrder = "/api/order/cancel"; // 取消订单
  static String extReceipt = "/api/order/extReceipt"; // 延长收货
  static String orderDetail = "/api/order/info"; // 获取订单详情
  static String orderList = "/api/order/page"; // 获取订单列表
  static String refundOrder = "/api/order/refund/Create"; // 申请售后
  static String cancelRefund = "/api/order/refund/cancel"; // 取消售后
  static String refundOrderDetail = "/api/order/refund/get"; // 获取订单售后信息
  static String postRefundExpressInfo = "api/order/refund/inputExpressInfo"; // 上传退货快递订单号
  static String remindOrderDelivery = "/api/order/remDelivery"; // 提醒发货
  static String confirmOrder = "/api/order/takeOverOrder"; // 确认收货


  //商品采购
  static String goodsCategoryMemberShop = "/api/goodsCategory/memberShop"; //商品采购tab 分类
  static String purchaseGoodsQueryList = "/api/purchaseGoods/queryList"; //商品采购列表
  static String purchaseGoodsDetail = "/api/purchaseGoods/detail";//商品采购详情
  static String shoppingCartSave = "/api/purchase/shoppingCart/save";//商品采购 添加购物车

 //店铺申请 相关
  static String memberShopApply = "/api/memberShop/apply";// 店铺申请
  static String memberIndustry = "/api/memberShop/industry";// 行业分类
  static String memberStarRatingConfig= "/api/memberShop/starRatingConfig";// 店铺星等级配置参数
  // static String memberGoodsList= "/api/memberShop/goodsList";// 店铺在售商品列表
  static String memberShopInfo  = "/api/memberShop/applyInfo";// 查询 当用户申请店铺状态
  static String userShopInfo  = "/api/memberShop/info";// 查询 当用户店铺详情
  static String modifyShopUpdate  = "/api/memberShop/modify";// 店铺信息修改
  static String applyCloseReasons  = "/api/memberShop/applyCloseReasons";// 获取关店 原因列表
  static String applyCloseStepOne  = "/api/memberShop/applyClose";// 关店 第一步提交信息
  static String applyCloseCheck  = "/api/memberShop/applyCloseCheck";// 申请关闭店铺第二步:关店校验
  static String applyCloseCancel = "/api/memberShop/applyCloseCancel"; //撤销申请
  static String shopOverview  = "/api/memberShop/overview";// 店铺数据
  static String applyCloseInfo  = "/api/memberShop/applyCloseInfo";// 获取店铺申请信息

  static String shoppingCartList  = "/api/purchase/shoppingCart/list";// 获取采购购物车列表
  static String shopCartSettle  = "/api/purchase/shoppingCart/settle";// 购物车结算上架
  static String upgradeStar  = "/api/memberShop/upgradeStar";// 店铺升级
  static String shopCartDel  = "/api/purchase/shoppingCart/del";// 购物车删除
  static String shopEdit = "/api/purchase/shoppingCart/edit";//修改购物车商铺数量
  static String goodsStockList  = "/api/memberShop/goodsList";// 获取库存管理


  //投资广场
  static String investmentHallList  = "/api/shop/invest/shopList";// 查询店铺列表,投资广场
  static String investmentBalance  = "/api/shop/invest/balance";// 资产信息
  static String investmentConfig  = "/api/shop/invest/config";// 投资配置表
  static String investmentInvest  = "/api/shop/invest/invest";// 投资
  static String investmentInvestList  = "/api/shop/invest/investList";// 投资记录
  static String investmentDetail  = "/api/shop/invest/investDetail";// 投资详情

  //投资广场店铺相关
  static String shopCollect  = "/api/shop/collect";// 收藏店铺
  static String shopCollectList  = "/api/shop/collect/queryList";// 收藏店铺列表
  static String shopOverviewInfo  = "/api/shop/overview";// 店铺详情数据
  static String shopQueryFilterOptions  = "/api/shop/queryFilterOptions";// 查询店铺列表选项
  static String shopRecentSale  = "/api/shop/recentSale";// 店铺近期数据

  //收益相关
  static String shopIncome  = "/api/income/memberShopSummary";// 店铺收益汇总
  static String shopIncomeDetail  = "/api/memberShop/shopSaleDetail";// 店铺收益明细
  static String investIncome  = "/api/income/investSummary";// 投资收益汇总
  static String investIncomeDetail  = "/api/shop/invest/investIncomeDetail";// 投资收益明细
  static String teamIncome  = "/api/income/teamSummary";// 团队收益汇总
  static String teamIncomeDetail  = "/api/shop/invest/teamIncomeDetail";// 团队收益明细
  static String teamReward  = "/api/income/teamRewardSummary";// 团队奖励汇总
  static String teamRewardDetail  = "/api/income/teamRewardDetail";// 团队奖励明细


  static String purchaseOrderList  = "/api/purchaseOrder/orderList";// 查询订单列表


  /// 我的
  static String setUserPayPassword = "/api/member/set/payPawPassword"; // 设置支付密码
  static String changeUserPayPassword = "/api/member/modify/payPawPassword"; // 修改支付密码
  static String findUserPayPassword = "/api/member/reset/payPawPassword"; // 找回支付密码
  static String checkUserPayPassword = "/api/member/check/payPawPassword"; // 验证支付密码
  static String purchaseOrderDetail = "/api/purchaseOrder/detail"; // 采购订单详情
  static String purchaseOrderPay = "/api/purchaseOrder/pay"; // 待支付订单支付
  static String meSafeCenterProgress = "/api/member/safetyIndex"; // 获取安全验证指数信息
  static String bankList = "/api/wallet/bankCard/bankList"; // 获取银行配置
  static String bindBank = "/api/wallet/bankCard/add"; // 绑定银行卡
  static String bindusdt = "/api/wallet/usdt/bind_withdraw_address"; // 绑定usdt
  static String vipInfo = "/api/member/levelInfo"; // 用户会员信息

  // 团队
  static String myTeamDataInfo = "/api/myteam/overview"; // 我的团队数据总览
  static String myTeamDirectRecommendList = "/api/myteam/directFriends"; // 直接推荐列表
  static String myTeamIndirectRecommendList = "/api/myteam/indirectFriends"; // 间接推荐列表

  // 消息中心
  static String messageList = "/api/message/queryAll"; // 站内信息列表
  static String unreadMessageCount = "/api/message/unread/count"; // 未读站内信息数量
  static String readMessage = "/api/message/read"; // 读取消息


 // 资产相关
  static String myWallet = "/api/wallet/my"; // 我的钱包

 //充值
  static String rechargeBankAmountList = "/api/wallet/recharge/amountList"; // 我的钱包
  static String rechargeApply = "/api/wallet/recharge/apply"; // 提交yhk充值
  static String usdt_bind_address = "/api/wallet/usdt/bind_address"; // 获取usdt绑定地址
  static String partnerConfig = "/api/myteam/parterConfig"; //
  static String messageQueryAll = "/api/message/queryAll"; // 查询消息
  static String rechargeList = "/api/wallet/recharge/list"; // 充值记录
  static String currencies = "/api/wallet/currencies"; // 返回货币汇率

  static String withdrawUSDT = "/api/wallet/withdraw/by_usdt"; // usdt 提现usdt

  static String myWithdrawAddress = "/api/wallet/usdt/my_withdraw_address"; //获取绑定的 usdt地址

  static String sysConfig = "/api/common-config/sysConfig"; //获取系统配置信息
  static String withdrawListHistory = "/api/wallet/withdraw/list"; //获取提现记录
  static String walletHistory = "/api/wallet/history"; //账变记录


  // 我店铺已经有的 流量包
  static String trafficPackageList = "/api/memberShop/trafficPackageList";


  //可购买的流量包，没有分页
  static String trafficPackageConfig = "/api/memberShop/trafficPackageConfig";

  static String buyTrafficPackage = "/api/memberShop/buyTrafficPackage";
  static String buyBack = "/api/purchaseOrder/buyBack"; //立即结算
  static String purchaseOrderReNew = "/api/purchaseOrder/renew"; //订单继续委托
  static String memberShopExposureChart = "/api/memberShop/exposureChart"; //店铺曝光统计柱状图
  static String refreshToken = "/api/refreshToken"; //店铺曝光统计柱状图

  static String clientReportPush = "/api/clientReport/push"; //api 错误上报
  static String withdrawLimit = "/api/wallet/withdrawLimit"; //可提现余额

  static String switchConfiguration = "/api/switchConfiguration/list"; //开关配置 返回集合



}