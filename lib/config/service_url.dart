const serviceUrl = 'https://wxmini.baixingliangfan.cn/baixing/';
const servicePath = {
  'homePageContext': serviceUrl + 'wxmini/homePageContent',
  'categoryPageContext': serviceUrl + 'wxmini/categoryPageContent',
  'memberPageContext': serviceUrl + 'wxmini/memberPageContent',
  'cartPage': serviceUrl + 'wxmini/cartPageContent',

  'homePageBelowConten': serviceUrl + 'wxmini/homePageBelowConten', //商城首页热卖商品拉取
  'getCategory': serviceUrl + 'wxmini/getCategory', //获得商品类别信息
  'getMallGoods': serviceUrl + 'wxmini/getMallGoods', //分类商品列表获取
  "getGoodDetailById": serviceUrl + "wxmini/getGoodDetailById/", //商品详情
  'searachGoods': serviceUrl+ "wxmini/searchGoods", //商品搜索接口
  'integralGoodsShops':serviceUrl+'wxmini/integralGoodsShops',//门店信息列表接口
  'shopInfoDetail':serviceUrl + "wxmini/integralGoods",//门店信息详情接口
  'ada':serviceUrl+'wxmini/getHomePageTip',//广告页
  'aboutUs':serviceUrl+'wxmini/aboutUs',//关于商城
  'fujiCouponsPic':serviceUrl+'wxmini/fujiCouponsPic',//优惠券图片接口
};
