<% @ Control  Language="C#" Inherits="PageAdmin.patag"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<% @ Register TagPrefix="ascx" TagName="M_0" src="/e/zdymodel/article/module/47.ascx"%><ascx:M_0 runat="server" TagSiteId=1 SiteId=1 ZdyTag=1 ModuleId="174_0" TagTable="article" TagSortId=0 SqlOrder="order by " SqlCondition="" ShowNum=8 TagZtId=0 TitleNum=80 TitlePicWidth=150 TitlePicHeight=150 TheTarget="_self"/>
<%
 string counts=Get_Data("co","select count(id) as co from article where checked=1 and source_id=0"); 
 if(int.Parse(counts)>8)
 {
%>
<a class="more_article" href="/index.aspx?lanmuid=61&sublanmuid=637&page=2">更多文章&gt;&gt;</a>
<%}%>
<%End();%>