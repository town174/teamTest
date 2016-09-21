<% @ Page Language="C#" Inherits="PageAdmin.get_form"%>
<% @ Register TagPrefix="aspcn" TagName="uc_head" src="head.ascx" %>
<aspcn:uc_head runat="server" Type="zdytable_list"/> 
<body topmargin=0 bottommargin=0 leftmargin=0  rightmargin=0>
<center>
<table  border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr><td height=10></td></tr>
 <tr><td class=table_style1><a href="javascript:location.reload()" title="点击刷新"><b>获取表单(<%=Request.QueryString["tablename"]%>)</b></a></td></tr>
 <tr><td height=10></td></tr>
</table>
<table border=0 cellpadding=0 cellspacing=0 width=95% >
 <tr>
<td valign=top align="left">
<form runat="server" >
<div id="tabdiv">
<ul>
<li id="tab" name="tab" onclick="showtab(0)" style="font-weight:bold">发布表单</li>
<li id="tab" name="tab" onclick="showtab(1)">搜索表单</li>
</ul>
</div>
<div name="tabcontent" id="tabcontent">
<table border=0 cellpadding=10 cellspacing=0 width=100% align=center class=table_style2>
<tr>
  <td><asp:TextBox id="Content" TextMode="MultiLine"  runat="server" style="width:90%;height:400px"/>
  </td>
 </tr>
 <tr><td>注：以上为系统自动生成的html提交表单，使用时可自行对html代码进行修改或重新排版。</td></tr>
</table>
</div>
<div name="tabcontent" id="tabcontent" style="display:none">
<table border=0 cellpadding=10 cellspacing=0 width=100% align=center class=table_style2>
 <tr>
  <td ><asp:TextBox id="Search" TextMode="MultiLine"  runat="server" style="width:90%;height:400px"/>
  </td>
   </tr>
 <tr><td>注：以上为根据搜索字段自动生成的html搜索表单，使用时可自行对html代码进行修改或重新排版<br>如果需要设置搜索模型，找到name="modelid"的input表单，value值改为你要使用的搜索模型的ID值即可。</td></tr>
</table>
</div>
<div align=center style="padding:10px"><input type="button" class=button value="关闭"  onclick="parent.CloseDialog()"></div>
</td>
</tr>
</table>
<br>
</td>
</tr>
</table>
</form>
</center>
</body>
</html>

