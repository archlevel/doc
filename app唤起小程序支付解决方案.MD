# 支付宝APP跳转小程序支付
采用schema 方式进行跳转

# 微信APP跳转小程序支付

参考地址：https://developers.weixin.qq.com/doc/oplatform/Mobile_App/Launching_a_Mini_Program/Launching_a_Mini_Program.html

移动应用拉起小程序是指用户可以通过接入该功能的第三方移动应用（APP）跳转至某一微信小程序的指定页面，完成服务后跳回至原移动应用（APP）。
移动应用拉起小程序功能已向全体开发者开放，开发者在微信开放平台帐号下申请移动应用并通过审核后，即可获得移动应用拉起小程序功能权限。
可在**“管理中心-移动应用-应用详情-关联小程序信息”**，为通过审核的移动应用发起关联小程序操作。
在同一开放平台账号下的移动应用及小程序无需关联即可完成跳转，非同一开放平台账号下的小程序需与移动应用（APP）成功关联后才支持跳转。
一个移动应用只能最多同时绑定3个小程序，每月支持绑定3次。同一个小程序可被500个移动应用关联。
# Android 开发示例
开发前需下载Android开发工具包（SDK），可在**“资源中心-开发资源-资源下载-Android资源下载”**按照指引操作。
调用接口：WXLaunchMiniProgram 移动应用跳转到小程序示例：
String appId = "wxd930ea5d5a258f4f"; // 填应用AppId
IWXAPI api = WXAPIFactory.createWXAPI(context, appId);

WXLaunchMiniProgram.Req req = new WXLaunchMiniProgram.Req();
req.userName = "gh_d43f693ca31f"; // 填小程序原始id
req.path = path;                  ////拉起小程序页面的可带参路径，不填默认拉起小程序首页，对于小游戏，可以只传入 query 部分，来实现传参效果，如：传入 "?foo=bar"。
req.miniprogramType = WXLaunchMiniProgram.Req.MINIPTOGRAM_TYPE_RELEASE;// 可选打开 开发版，体验版和正式版
api.sendReq(req);
回调说明
WXEntryActivity中
public void onResp(BaseResp resp) {
    if (resp.getType() == ConstantsAPI.COMMAND_LAUNCH_WX_MINIPROGRAM) {
        WXLaunchMiniProgram.Resp launchMiniProResp = (WXLaunchMiniProgram.Resp) resp;
        String extraData =launchMiniProResp.extMsg; //对应小程序组件 <button open-type="launchApp"> 中的 app-parameter 属性
    }
}
详细demo请参考官网上的Sample工程。
小程序跳转回移动应用请参考<a href="https://developers.weixin.qq.com/miniprogram/dev/api/launchApp.html"target="_blank">《小程序开发文档》

# IOS 开发示例

开发前需下载iOS开发工具包（SDK），可在**“资源中心-开发资源-资源下载-iOS资源下载”**按照指引操作。
移动应用跳转到小程序示例：
WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
launchMiniProgramReq.userName = userName;  //拉起的小程序的username
launchMiniProgramReq.path = path;    ////拉起小程序页面的可带参路径，不填默认拉起小程序首页，对于小游戏，可以只传入 query 部分，来实现传参效果，如：传入 "?foo=bar"。
launchMiniProgramReq.miniProgramType = miniProgramType; //拉起小程序的类型
return  [WXApi sendReq:launchMiniProgramReq];
回调说明
-(void)onResp:(BaseResp *)resp 
{
     if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]])
     {
          NSString *string = resp.extMsg;
          // 对应JsApi navigateBackApplication中的extraData字段数据
     }
}
小程序跳转回移动应用请参考<a href="https://developers.weixin.qq.com/miniprogram/dev/api/launchApp.html"target="_blank">《小程序开发文档》

