﻿<%@ WebHandler Language="C#" Class="OALogin" %>
using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Collections.Generic;
using Newtonsoft.Json;
public class OALogin : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{
    public int LoginCount
    {
        get
        {
            if (HttpContext.Current.Session["ValidateCount"] == null)
            {
                HttpContext.Current.Session["ValidateCount"] = 0;
            }
            return Convert.ToInt32(HttpContext.Current.Session["ValidateCount"]);
        }
        set
        {
            HttpContext.Current.Session["ValidateCount"] = value;
        }
    }
    B_User buser = new B_User();
    B_User_Friend friendBll = new B_User_Friend();
    B_Group gpBll = new B_Group();
    B_Ucenter ucBll = new B_Ucenter();
    M_APIResult retMod =new M_APIResult();
    public void ProcessRequest(HttpContext context)
    {
        string action = context.Request.Params["action"];
        M_AJAXUser ajaxUser = new M_AJAXUser();
        M_UserInfo mu = new M_UserInfo();
        retMod.retcode = M_APIResult.Success;
        switch (action)
        {
            case "HasLogged":
                mu = buser.GetLogin();
                if (mu != null && !mu.IsNull)
                {
                    ajaxUser.Copy(mu);
                    context.Response.Write(ajaxUser.ToJson());
                }
                else { context.Response.Write("-1"); }
                break;
            case "GetBarUInfo":
                {
                    int uid = Convert.ToInt32(context.Request["uid"]);
                    mu = buser.GetUserByUserID(uid);
                    M_Uinfo ubMod = buser.GetUserBaseByuserid(uid);
                    string result = "{\"UserFace\":\"" + ubMod.UserFace + "\",\"UserExp\":\"" + mu.UserExp + "\",\"UserSex\":\"" + (ubMod.UserSex ? "男" : "女") + "\",\"GroupName\":\"" + gpBll.GetByID(DataConverter.CLng(mu.GroupID)).GroupName + "\",\"UserBirth\":\"" + ubMod.BirthDay + "\",\"RegTime\":\"" + mu.RegTime + "\",\"UserID\":\"" + mu.UserID + "\",\"UserName\":\"" + mu.UserName + "\"}";
                    context.Response.Write(result);
                }
                break;
            case "CheckKey":
                string chkUname= context.Request.Form["uname"];
                M_UserInfo usermod = buser.GetUserByName(chkUname);
                if (usermod != null && !string.IsNullOrEmpty(usermod.ZnPassword))
                    context.Response.Write("1");
                else
                    context.Response.Write("-1");
                break;
            case "UserLogin"://不开启验证码登录,需要使用key
                {
                    string key = context.Request["key"];
                    string uname = context.Request["uname"];
                    string upwd = context.Request["upwd"];
                    CheckKey(key);
                    mu = buser.AuthenticateUser(uname, upwd);
                    if (mu.IsNull)
                    {
                        retMod.retcode = M_APIResult.Failed; retMod.retmsg = "登录失败,用户名或密码错误";
                    }
                    else
                    {
                        ajaxUser.Copy(mu);
                        retMod.result = ajaxUser.ToJson();
                    }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "GetUserAnswer":
                {
                    M_UserInfo answermod = null;
                    string useremail = context.Request["email"];
                    string userpwd = context.Request["pwd"];
                    if (!string.IsNullOrEmpty(useremail) && !string.IsNullOrEmpty(userpwd))
                    {
                        if (useremail.Contains("@"))
                        {
                            answermod = buser.AuthenticateEmail(useremail, userpwd);
                        }
                        else
                        {
                            answermod = buser.LoginUser(useremail, userpwd);
                        }
                    }
                    else
                    {
                        answermod = buser.GetLogin();
                    }
                    context.Response.Write(answermod.Email + ":" + answermod.Answer);
                }
                break;
            case "GetUser"://用于远程登录等,返回基本用户信息
                {
                    string uname = context.Request["uname"];
                    string upwd = context.Request["upwd"];//未加密的
                    mu = buser.AuthenticateUser(uname, upwd);
                    if (mu.IsNull)
                    {
                        retMod.retcode = M_APIResult.Failed; retMod.retmsg = "用户不存在";
                    }
                    else
                    {
                        ajaxUser.Copy(mu);
                        retMod.retmsg = ajaxUser.ToJson();
                    }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "ExistEmail":
                {
                    string email = context.Request["email"];
                    if (buser.IsExistMail(email)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "邮箱已存在!"; }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "ExistUName":
                {
                    string uname = context.Request["uname"];
                    if (buser.IsExistUName(uname)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "用户名已存在"; }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "ExistMobile":
                {
                    string mobile = context.Request["mobile"];
                    if (buser.IsExist("mobile", mobile)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "手机号已存在"; }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "exist_ue"://检测用户名与邮箱(选填)
                {
                    string email = context.Request["email"];
                    string uname = context.Request["uname"];
                    if (buser.IsExistUName(uname)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "用户名已存在"; }
                    if (!string.IsNullOrEmpty(email))
                    {
                        if (buser.IsExistMail(email)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "邮箱已存在!"; }
                    }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "exist_um"://用户名与手机号(选填)
                {
                    string uname = context.Request["uname"];
                    string mobile = context.Request["mobile"];
                    if (buser.IsExistUName(uname)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "用户名已存在"; }
                    if (!string.IsNullOrEmpty(mobile))
                    {
                        if (buser.IsExist("mobile", mobile)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "手机号已存在"; }
                    }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "exist_ume":
                {
                    string uname = context.Request["uname"];
                    if (buser.IsExist("ume", uname)) { retMod.retcode = M_APIResult.Failed; retMod.retmsg = "用户名已存在"; }
                    context.Response.Write(retMod.ToString());
                }
                break;
            case "Login":
            default://Login
                #region -1登录失败,-2验证码失败,-10启用验证码
                {
                    string value = context.Request["value"];
                    string uname = value.Split(':')[0], upwd = value.Split(':')[1], key = "", code = "";
                    if (LoginCount >= 3)//验证码
                    {
                        key = value.Split(':')[2]; code = value.Split(':')[3];
                        //context.Response.Write(value + ":" + key + ":" + code);
                        if (!ZoomlaSecurityCenter.VCodeCheck(key, code))
                        {
                            context.Response.Write("-2");
                            return;
                        }
                    }
                    mu = buser.AuthenticateUser(uname, upwd);
                    if (mu == null || mu.IsNull)
                    {
                        LoginCount++;
                        if (LoginCount >= 3)
                        {
                            context.Response.Write("-10");
                        }
                        else
                        {
                            context.Response.Write("-1");
                        }
                    }
                    else
                    {
                        LoginCount = 0;
                        buser.SetLoginState(mu, "Day");
                        ajaxUser.Copy(mu);
                        context.Response.Write(ajaxUser.ToJson());
                    }
                }
                #endregion
                break;
        }
        context.Response.Flush();
        context.Response.End();
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
    //得到云通讯返回结果处理
    private string getDictionaryData(Dictionary<string, object> data)
    {
        string ret = null;
        foreach (KeyValuePair<string, object> item in data)
        {
            if (item.Value != null && item.Value.GetType() == typeof(Dictionary<string, object>))
            {
                ret += item.Key.ToString() + "={";
                ret += getDictionaryData((Dictionary<string, object>)item.Value);
                ret += "};";
            }
            else
            {
                ret += item.Key.ToString() + "=" + (item.Value == null ? "null" : item.Value.ToString()) + ";";
            }
        }
        return ret;
    }
    private M_Ucenter CheckKey(string key)
    {
        M_Ucenter ucMod = ucBll.SelByKey(key);
        if (ucMod == null)
        {
            retMod = new M_APIResult() { retcode = -1, retmsg = "Key验证失败" };
            HttpContext.Current.Response.Write(retMod.ToString()); HttpContext.Current.Response.Flush(); HttpContext.Current.Response.End();
        }
        return ucMod;
    }
}