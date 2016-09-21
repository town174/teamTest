﻿<% @ Page Language="C#" Inherits="PageAdmin.data_add"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="data_add"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><a href="javascript:location.reload()" title="点击刷新"><b><%=PostType=="edit"?"修改信息":"增加信息"%></b></a></td></tr>
 <tr><td height=10></td></tr>
</table>

<table border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr>
<td valign=top  align="left">
<div id="tabdiv">
<ul>
<li id="tab" name="tab"  onclick="showtab(0)" style="font-weight:bold">信息详情</li>
<li id="tab" name="tab"  onclick="showtab(1)">其他属性</li>
<li id="tab" name="tab"  onclick="showtab(2)">关联信息</li>
<li id="tab" name="tab"  onclick="showtab(3)">文件签收</li>
</ul>
</div>
<table border=0 cellpadding=5 cellspacing=0 width=100% align=center class=table_style2>
<tr>
  <td valign=top>
<table border=0 cellpadding=2 cellspacing=0 width=95% align=center>
<tr>
  <td  height=25><b>所属表：</b><%=Request.QueryString["name"]%></td>
 </tr>
</table>
<iframe name="post_iframe" id="post_iframe" src="" frameborder=0 scroling=no height=1px width=1px marginwidth=0 marginheight=0 style="display:none"></iframe>
<form name='<%=The_Table%>' method='post' Enctype='multipart/form-data' target="post_iframe">
<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=5 cellspacing=0 align=center width="96%">
<asp:PlaceHolder id="P_Sort" Runat="server">
<tr>
<td align=right class="tdhead">所属类别<span style='color:#ff0000'>*</span></td>
<td>
<select name="s_sort" id="s_sort" onchange="c_sort(<%=Request.Cookies["SiteId"].Value%>,1,'<%=The_Table%>','admin')">
<option  value="0">---请选择所属类别---</option>
<%=Sort_List%>
</select>
<input type="hidden" name="sort" id="sort" value="<%=Sort_Id%>">
<script type="text/javascript">
var Sort_Type="onlyone";
Write_Select(<%=Request.Cookies["SiteId"].Value%>,'<%=The_Table%>');
</script>
</td>
</tr></asp:PlaceHolder><asp:PlaceHolder id="P_Form" Runat="server"/></table>
</div>
<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=0  align=center width=96%>
   <tr>
        <td  width="100px">文件路径</td>
        <td>
<ul style="clear:both">
 <li style="float:left;width:160px;padding-left:60px">文件目录</li>
 <li style="float:left;">文件名</li>
 <li style="clear:both;font-size:0px;height:0px;line-height:0px;width:0px;margin:0 0 0 0;padding:0 0 0 0;overflow:hidden"></li>
 <li style="float:left;">/站点目录/<input type="text" name="static_dir" id="static_dir" Maxlength="50" style="width:150px" value="<%=Static_Dir%>" title="{default}表示继承数据表设置中(或分类设置)的目录格式设置">/</li>
 <li style="float:left;"><input type="text" name="static_file" id="static_file" Maxlength="50" style="width:150px" value="<%=Static_File%>" title="留空表示继承数据表设置中(或分类设置)的文件名格式设置"> 注：文件名留空则由系统默认</li>
</ul><input type="hidden" value="<%=Table_Static_Dir%>" name="table_static_dir">

</td>
 </tr>

 <tr>
      <td align=left >SEO标题</td>
          <td><input type="text" name="zdy_title" Maxlength="150" size=50 value="<%=Zdy_Title%>">
        </td>
      </tr>

      <tr>
          <td>SEO关键字</td>
          <td><input type="text" name="zdy_keywords" Maxlength="150" size=50 value="<%=Zdy_Keywords%>">
        </td>
      </tr>

      <tr>
          <td>SEO描述</td>
          <td><textarea name="zdy_description" Cols="65" rows="4" onkeyup="if(this.value.length>250){this.value=this.value.substring(0,250)}"><%=Zdy_Description%></textarea>
        </td>
      </tr>
<tr>
     <td align=left>自定义url</td>
     <td><input type="text" name="zdy_Url" Maxlength="150" size=50 value="<%=zdy_Url%>"></td>
</tr>

      <tr>
          <td>所属专题<br><span style="color:#999999">双击删除</span></td>
          <td>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>
<select id="zt_list" name="zt_list" multiple style='width:430px;height:80px' ondblclick="clear_select('zt_list')"></select>

</td>
<td>&nbsp;<input type="button" value="选择专题" class="bt" onclick="open_ztlist(1)"></td></tr>
</table>
    </td>
      </tr>

      <tr>
          <td>信息推送<br><span style="color:#999999">双击删除</span></td>
          <td>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>
<select id="push_list" name="push_list" multiple style='width:430px;height:80px' ondblclick="clear_select('push_list');"></select>
</td>
<td>&nbsp;<input type="button" value="选择分类" class="bt" onclick="sort_Select();"></td></tr>
</table>
    </td>
      </tr>


<tr>
<td align=left>浏览权限</td>
<td>
  <input type="checkbox" name="Visiter_all" id="Visiter_0" value="0"  onclick="select_all()">所有来访者(<input type="checkbox" name='Visiter_sortset_first' value="1" <%=PostType=="add"?"checked":""%>>分类设置优先)<br>
        <asp:Repeater id="P_permissions" runat="server">
         <ItemTemplate>
           <input type="checkbox" name="Visiter" id="Visiter_<%#DataBinder.Eval(Container.DataItem,"id")%>" value="<%#DataBinder.Eval(Container.DataItem,"id")%>" ><%#DataBinder.Eval(Container.DataItem,"name")%>&nbsp;
         </ItemTemplate>
        </asp:Repeater>
      </td>
</tr>

<tr>
<td align=left></td>
<td><span style="display:<%=Work_Id=="0"?"":"none"%>"><input type="checkbox" name='ischecked' id='ischecked' value="1" checked <%if(Can_Check=="0"){%>onclick="alert('对不起，你没有操作这个属性的权限');return false"<%}%>>已审核</span>
<span style="display:<%=Work_Id=="0"?"none":""%>"><input type="checkbox" value="1" disabled>审核中(工作流)</span>
<input type="checkbox" name='isgood' id='isgood' value="1">推荐
<input type="checkbox" name='isnew' id='isnew' value="1">最新
<input type="checkbox" name='ishot' id='ishot' value="1">热门
<input type="checkbox" name='istop' id='istop' value="1">置顶(置顶结束日期<input type="text" name='actdate' id='actdate' value="<%=ActDate%>" maxlength="19" size="15"><a href="javascript:open_calendar('actdate',1)"><img src=/e/images/icon/date.gif border=0 hspace=2 align=absbottom></a>)
</td>
</tr>
<tr style="display:<%=Mprice_Show%>">
  <td  height=25 >会员价</td>
  <td><table id="M_Table" border=0 cellpadding=0 cellspacing=0 width=100%> 
   <asp:Repeater id="P_Member" runat="server">
     <ItemTemplate>
     <tr title="<%#DataBinder.Eval(Container.DataItem,"name")%>价格">
      <td>
        <input type="hidden" name="TBMtypeid"   value="<%#DataBinder.Eval(Container.DataItem,"id")%>">
        <input type="text" name="TBMprice"  Maxlength=15 size=10 onkeyup="if(isNaN(value))execCommand('undo')" value="<%#Get_Price(DataBinder.Eval(Container.DataItem,"id").ToString())%>"> <%#DataBinder.Eval(Container.DataItem,"name")%>
     </td>
     </tr>
     </ItemTemplate>
    </asp:Repeater>
    </table>
         </td>
      </tr>  

<tr  style="display:<%=Mprice_Show%>">
<td align=left width='100px'>兑换积分</td>
<td><input type=text name='point' id='point' Maxlength='10'  size='5' value="<%=Point==null?"0":Point%>" onkeyup="if(isNaN(value))execCommand('undo')"> 注：可兑换产品的积分</td>
</tr>

<tr  style="display:<%=Mprice_Show%>">
<td align=left width='100px'>购买赠送积分</td>
<td><input type=text name='sendpoint' id='sendpoint' Maxlength='10'  size='5' value="<%=SendPoint==null?"0":SendPoint%>" onkeyup="if(isNaN(value))execCommand('undo')"> 注：购买每单位产品的赠送积分</td>
</tr>

<tr style="display:<%=Mprice_Show%>">
<td align=left width='100px'>库存</td>
<td><input type=text name='reserves' id='reserves' Maxlength='10'  size='5' value="<%=Reserves==null?"0":Reserves%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
</tr>

<tr>
<td align=left width='100px'>点击数</td>
<td><input type=text name='clicks' id='clicks' Maxlength='10'  size='5' value="<%=Clicks==null?"0":Clicks%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
</tr>

<tr>
<td align=left width='100px'>下载数</td>
<td><input type=text name='downloads' id='downloads' Maxlength='10'  size='5' value="<%=Downloads==null?"0":Downloads%>" onkeyup="if(isNaN(value))execCommand('undo')"></td>
</tr>

<tr>
<td align=left width='100px'>评论数</td>
<td><input type=text name='comments' id='comments' Maxlength='10'  size='5' value="<%=Comments==null?"0":Comments%>" onkeyup="if(isNaN(value))execCommand('undo')"> <a href="comments_list.aspx?table=<%=The_Table%>&name=<%=Server.UrlEncode(Request.QueryString["name"])%>&detailid=<%=Request.QueryString["id"]%>"><img src="images/sign_detail.gif" border="0"></a></td>
</tr>

<tr><td align=left width='100px'>评论功能</td>
<td>
<input type="radio" name='comment_open' value="0" checked>关闭
<input type="radio" name='comment_open' id='comment_open_1' value="1">开启&nbsp;
<input type="checkbox" name='comment_check' id='comment_check' value="1" checked>评论需审核
<input type="checkbox" name='comment_anonymous' id='comment_anonymous' value="1" checked>允许匿名评论
(<input type="checkbox" name='comment_sortset_first' value="1" <%=PostType=="add"?"checked":""%>>分类设置优先)
</td>
</tr>

<tr style="display:<%=TableType=="feedback"?"":"none"%>">
<td align=left width='100px'>回复用户</td>
<td><input type="text" name='reply_username' id='reply_username' size=20 value="<%=Reply_UserName%>">(<input type="checkbox" name='reply_sortset_first' value="1" <%=PostType=="add"?"checked":""%>>分类设置优先)</td>
</tr>

<%if(PostType=="edit")
 {
%>
<tr>
<td align=left width='100px'>提交ip</td>
<td><input type="text" id="Ip" size=20 value="<%=Ip%>" readonly style="color:#999999"> <a href="javascript:GetIPAdd('<%=Ip%>')"><img src=images/sign_detail.gif border=0></a></td>
</tr>

<tr>
<td align=left width='100px'>信息编号</td>
<td><input type="text" size=20  name="code" value="<%=TheCode%>" readonly style="color:#999999"></td>
</tr>
<%}%>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=0  align=center width=96%>
<tr>
<td align=left>关联信息<b>Tags：</b><input type=text name='tags' id='tags' Maxlength='50'  size='40' value="<%=Tags%>"><input type=radio id='from_title' name="xg"  checked>根据标题 <input type=radio id='from_tags' name="xg">根据信息Tags <input type="button" value="查找相关信息" class="bt" onclick="return get_xglist()"> 多个关键字用","号分开</td>
</tr>
<tr>
<td align=left>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>待选信息(双击选中)</td><td style="padding-left:20px">相关信息(双击取消)</td></tr>
<tr><td><select id="dx_list" name="dx_list"  multiple style='width:280px;height:300px' ondblclick="dx_click()"></select></td><td style="padding-left:20px"><select id="related_list"  multiple style='width:280px;height:300px'  ondblclick="related_click()"></select><input type="hidden" id="related_id" name="related_id" value="<%=Related_Ids%>"></td></tr>
<tr><td><input type="button" value=" 删除 " class='bt' onclick="clear_select('dx_list')"></td><td style="padding-left:20px"><input type="button" value=" 删除 " class='bt' onclick="clear_select('related_list');get_relatedids()"></td></tr>
</table>
</td>
</tr>
</table>
</div>

<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=5 cellspacing=0  align=center width=96%>

<tr><td align=left width='100px'>签收功能</td>
<td>
<input type="radio" name='qs_open' id="sign_open_1" value="1" onclick="Qs_Set(1)">开启&nbsp;
<input type="radio" name='qs_open' value="0" checked onclick="Qs_Set(0)">关闭
</td>
</tr>

<tr id="tr_qs" name="tr_qs"><td align=left width='100px'>指定签收部门</td>
<td>
<select id="qs_department" name="qs_department" size="10" multiple style="width:300px" title="按住Ctrl可多选或取消选中状态" ondblclick="unselect('qs_department')">
<%=DepartmentList%>
</select>
</td>
</tr>

<tr id="tr_qs" name="tr_qs"><td align=left width='100px'>指定签收用户</td>
<td>
<table border=0 cellpadding=0 cellspacing=0>
<tr><td>
<select id="qs_list" name="qs_list" multiple style='width:300px;height:250px' ondblclick="clear_select('qs_list');" title="双击可以删除选定用户"></select>
</td>
<td>&nbsp;&nbsp;<input type="button" value="选择用户" class="bt" onclick="open_departmentuser('select','qs_list','','选择签收用户')"></td></tr>
</table>
</td>
</tr>

<tr id="tr_qs" name="tr_qs"><td align=left width='100px'>签收截止日期</td>
<td><input type=text name='qs_enddate' id='qs_enddate' Maxlength='20' size='15' value="<%=Sign_Enddate%>"><a href="javascript:open_calendar('qs_enddate',1)"><img src=/e/images/icon/date.gif border=0 height=20 hspace=2 align=absbottom></a>
</td>
</tr>
</table>
</div>

<div align=center style="padding:10px 0 5px 0">
<input type='hidden' name="post" value="<%=PostType%>">
<input type='hidden' name="workid" value="<%=Work_Id%>">
<input type='hidden' name="dbtype" value="<%=TableType%>">
<input type='hidden' name="tg_workid" value="<%=Tg_WorkId%>">
<input type='hidden' name="edit_check" value="<%=Edit_Check%>">
<span id="post_area">
<%if(Work_Id!="0" && Current_Work_Node=="0"){%>
<input type="checkbox" name="rechecked" value="1" checked>重新送审
<%}%>
<input type='button' class='button' value='提交' onclick="return Check_ZdyForm('<%=The_Table%>')" onmouseover="Set_Selected('select-all','zt_list');Set_Selected('select-all','push_list');Set_Selected('select-all','qs_list')"> 
<%if(PostType=="add"){%>
<input type='button' value='返回' class='button' onclick="location.href='data_list.aspx?table=<%=The_Table%>&name=<%=Server.UrlEncode(Request.QueryString["name"])%><%=Sort_Id=="0"?"":"&sortid="+Sort_Id%>'">
<%}else{%>
<input type="button" class=button  value="关闭"  onclick="parent.CloseDialog()">
<%}%>
</span>
<span id="post_loading" style="display:none"><img src=images/loading.gif vspace="5" align=absmiddle>Loading...</span>  
</div>
</form>
</td>
</tr>
</table>
<br>
</center>
</body>
<script language="javascript">
var Current_Id="<%=Request.QueryString["id"]%>";
var Sorts="<%=Parent_Ids%>,<%=Sort_Id%>";
var Visitor="<%=Permissions%>";
var AVisitor=Visitor.split(',');
if(Visitor=="" || Visitor=="0") //初始权限checkbox
 {
   document.getElementById("Visiter_0").checked=true;
   lock_mem_check();
 }
else
 {
   for(i=0;i<AVisitor.length;i++)
    {
      try{
         document.getElementById("Visiter_"+AVisitor[i]).checked=true;
         }
       catch(ex)
         {
         }
    }
 }
var Department="<%=Sign_Department%>";
var ADepartment=Department.split(',');
var qs_department=document.getElementById("qs_department");
if(Department!="") //初始签收部门checkbox
 {
     for(i=0;i<qs_department.length;i++)
     {
      for(k=0;k<ADepartment.length;k++)
      {
        if(qs_department[i].value==ADepartment[k])
         {
          qs_department[i].selected=true;
         }
      }
    }
 }

var TWidth=document.getElementById("thumbnail_width"); //初始缩略图尺寸
var THeight=document.getElementById("thumbnail_height");
if(TWidth!=null && THeight!=null)
 {
   TWidth.value="<%=Thumbnail_MinWidth%>";
   THeight.value="<%=Thumbnail_MinHeight%>";
 }

function lock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       document.forms[0].Visiter[i].checked=true;
       document.forms[0].Visiter[i].disabled=true;
    }
 }

function unlock_mem_check()
 {
  for(i=0;i<document.forms[0].Visiter.length;i++)
     {
       //document.forms[0].Visiter[i].checked=false;
       document.forms[0].Visiter[i].disabled=false;
    }
 }
function select_all()
 {
   var obj=document.getElementById("Visiter_0");
   if(obj.checked)
    {
      lock_mem_check();
    }
   else
    {
     unlock_mem_check()
    }
 }

function Qs_Set(open)
 {
   var Tr_Qs=document.getElementsByName("tr_qs");
   if(open==1)
    {
     Tr_Qs[0].style.display="";
     Tr_Qs[1].style.display="";
     Tr_Qs[2].style.display="";
    }
   else 
    {
     Tr_Qs[0].style.display="none";
     Tr_Qs[1].style.display="none";
     Tr_Qs[2].style.display="none";
    }
 }

  <%if(PostType=="add"){%>
    if("<%=Add_Check%>"=="1")
     {
      document.getElementById("ischecked").checked=false;
     }
   <%}
     else
   {%>
    if("<%=IsChecked%>"=="0")
     {
      document.getElementById("ischecked").checked=false;
     }
  <%}%>
  if("<%=IsTop%>"=="1")
   {
     document.getElementById("istop").checked=true;
   }
  if("<%=IsGood%>"=="1")
   {
     document.getElementById("isgood").checked=true;
   }
  if("<%=IsNew%>"=="1")
   {
     document.getElementById("isnew").checked=true;
   }
  if("<%=IsHot%>"=="1")
   {
     document.getElementById("ishot").checked=true;
   }
  if("<%=Comment_Open%>"=="1")
   {
     document.getElementById("comment_open_1").checked=true;
   }
  if("<%=Comment_Check%>"=="0")
   {
     document.getElementById("comment_check").checked=false;
   }
  if("<%=Comment_Anonymous%>"=="0")
   {
     document.getElementById("comment_anonymous").checked=false;
   }
  if("<%=Sign_Open%>"=="1")
   {
     document.getElementById("sign_open_1").checked=true;
   }
   Qs_Set(<%=Sign_Open%>);
<%if(PostType=="edit")
 {
%>
  load_list("<%=The_Table%>","<%=Related_Ids%>","related_list");//相关信息
  load_list("pa_lanmu","<%=Zt_Ids%>","zt_list");//专题列表
  load_list("pa_sort","<%=Push_SortIds%>","push_list");//推送分类
  load_list("pa_member","<%=Sign_Users%>","qs_list");//签收用户
<%}else{%>
  var saveimage=document.forms[0].saveimage;
  var autotitlepic=document.forms[0].autotitlepic;
  if(saveimage!=null){saveimage.checked=false}
  if(autotitlepic!=null){autotitlepic.checked=false}
<%}%>
<%if(Sort_Id!="0"){%>
Load_Sort(<%=Request.Cookies["SiteId"].Value%>,Sorts,'<%=The_Table%>');
<%}%>
function load_list(Table,Ids,InsertObj) //通过ajax查找专题，相关信息和签收用户列表,post=edit时加载
 {
   if(Ids=="" && InsertObj!="related_list"){return;}
   var R=Math.random();
   var x=new PAAjax();
   x.setarg("get",true);
   x.send("data_add_info.aspx","table="+Table+"&ids="+Ids+"&loadtype="+InsertObj+"&r="+R,function(v){write_list(v,InsertObj,"load")});
 }

function get_xglist() //通过ajax查找tags相关信息，鼠标点击查找触发
 {
   var Type="1";
   var tags=document.getElementById("tags");
   if(tags.value=="")
    {
      alert("请设置好Tags!");
      return false;
    }
   var by_title=document.getElementById("from_title");
   if(by_title.checked)
    {
     Type="2";
    }
   var Table="<%=The_Table%>";
   var R=Math.random();
   var x=new PAAjax();
   x.setarg("get",true);
   x.send("data_add_info.aspx","table="+Table+"&type="+Type+"&notid="+Current_Id+"&tags="+escape(tags.value)+"&loadtype=find_list&r="+R,function(v){write_list(v,"dx_list","find")});
 }

function write_list(v,Id,type) //ajax回调
 {
  if(v=="")
   {
     if(type=="find"){alert("未查到任何相关信息!");}
     return;
   }
  var obj=document.getElementById(Id);
  //obj.options.length=0;
  var item;
  var id,title;
  var Av=v.split('"');
  for(i=0;i<Av.length;i++)
   {
    if(Av[i]!="")
     {
      id=(Av[i].split(','))[0];
      title=(Av[i].split(','))[1];
      item=new Option(title,id);
      obj.options.add(item);
    }
   }
 }

function dx_click()
 {
  var obj1=document.getElementById("dx_list");
  var obj2=document.getElementById("related_list");
  if(obj1.options.length==0){return;}
  var I=obj1.selectedIndex;
  if(I==-1){return;}
  var id=obj1.options[I].value; 
  if(!IsExists("related_list",id))
   {
    var title=obj1.options[I].text; 
    var item=new Option(title,id);
    obj2.options.add(item);
    obj1.remove(I);
   }
  else
   {
     alert("相关信息列表中已经存在此记录!");
     obj1.remove(I);
   }
  get_relatedids();
 }

function related_click()
 {
  var obj1=document.getElementById("related_list");
  var obj2=document.getElementById("dx_list");
  if(obj1.options.length==0){return;}
  var I=obj1.selectedIndex;
  if(I==-1){return;}
  var id=obj1.options[I].value; 
  if(!IsExists("dx_list",id))
   {
    var title=obj1.options[I].text; 
    var item=new Option(title,id);
    obj2.options.add(item);
    obj1.remove(I);
   }
  else
   {
     obj1.remove(I);
   }
  get_relatedids();
 }

function IsExists(Id,id)
 {
   var obj=document.getElementById(Id);
   if(obj.options.length==0){return false;}
   for(i=0;i<obj.options.length;i++)
   {
     if(obj.options[i].value==id)
      {
        return true;
      }
   }
  return false;
 }

function clear_select(Id)
 {
  var obj=document.getElementById(Id);
  if(obj.options.length==0){return;}
  for(i=0;i<obj.options.length;i++)
   {
    if(obj.options[i].selected)
     {
       obj.remove(i);
       clear_select(Id);
     }
   }
 }


function get_relatedids()
 {
  var obj=document.getElementById("related_list")
  var obj1=document.getElementById("related_id")
  var Ids="";
  if(obj.options.length==0)
   {
     obj1.value="";
     return;
   }
  for(i=0;i<obj.options.length;i++)
   {
     if(Ids=="")
      {
       Ids+=obj.options[i].value;
      }
    else
      {
       Ids+=","+obj.options[i].value;
      }
   }
  obj1.value=Ids;
 }

function AddSelect(txt,value,id)
 {
   var obj=document.getElementById(id);
   obj.options.add(new Option(txt,value));
 }

var IP=document.getElementById("Ip");
function ShowIp()
  {
   GetIPAdd(IP.value);
  }
if(IP!=null)
{
 IP.ondbclick=ShowIp;
}

function ShowTab()
 {
  if(GetCookie("tab")!="")
  {
   showtab(GetCookie("tab"));
  }
 }

function sort_Select()
 {
  IDialog("推送分类","sort_select.aspx?table=<%=The_Table%>",700,400);
 }

//自定义选择数据
function Data_Select(SourceTable,field,ismultiple,title,Width,Height)
 {
  if(typeof(ismultiple)=="undefined"){ismultiple="0";}
  if(typeof(title)=="undefined"){title="请选择数据";}
  if(typeof(Width)=="undefined"){Width=800;}
  if(typeof(Height)=="undefined"){Height=400;}
  IDialog(title,"/e/aspx/data_select.aspx?siteid=<%=Request.Cookies["SiteId"].Value%>&table="+SourceTable+"&field="+field+"&multiple="+ismultiple,800,400);
 }
</script>
</html>