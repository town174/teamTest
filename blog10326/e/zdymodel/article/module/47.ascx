<% @ Control Language="C#" Inherits="PageAdmin.module_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%if(Zdy_Tag==0){%><%=Module_StartHtml%>
<%if(Layout!="-1"){%><div id="module_<%=Module_Id%>" <%=Module_box_style%>class="module_box<%=Layout%><%=Module_ClassName%>">
<div <%=Module_box_inner%>class="module_box_inner">
<%if(Title_Show=="1"){%>
<div <%=Module_titlebox_style%>class="module_title"><span <%=Module_title_style%>class="module_sign"><%=Module_Title%></span><span <%=Module_more_style%>class="module_more"><%=More_Url%></span></div>
<%}if(Module_Header!=""){%><%=Module_Header%><%}%>
<div id="module_content_<%=Module_Id%>" <%=Module_content_style%>class="module_content">
<%}%><%}%><%conn.Open();%><ul class="tw_article">
<%
string author,pic="";
DataTable dt=Get_Data();
DataRow dr;
for(int i=0;i<dt.Rows.Count;i++)
 {
  dr=dt.Rows[i];
  pic=dr["titlepic"].ToString();
  author=dr["pa_author"].ToString();
  if(author==""){author="佚名";}
%>
<li><%if(pic!=""){%><span class="pic"><a href="<%=Detail_Url(dr)%>" target="<%=Target%>"><img src="<%=dr["titlepic"]%>"></a></span><%}%><span class="title"><a href="<%=Detail_Url(dr)%>" target="<%=Target%>" title="<%=Server.HtmlEncode(dr["title"].ToString())%>"><%=SubStr(dr["title"].ToString(),Title_Num,true)%></a></span>
<span class="info"> <%=((DateTime)dr["thedate"]).ToString("yy.MM.dd")%> &nbsp;-&nbsp; <%=author%> &nbsp;-&nbsp; 阅 <%=dr["clicks"].ToString()%></span>
<span class="introduction"><%=SubStr(dr["pa_introduct"].ToString(),250,true)%></span>
</li>
<%
 }
%>
</ul>
<%conn.Close();%>
<%if(Zdy_Tag==0){%><%if(Layout!="-1"){%></div><div class="module_footer"><span class="l"></span><span class="r"></span></div>
</div>
</div><%}%><%=Module_EndHtml%><%}%>