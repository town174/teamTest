<% @ Control Language="C#" Inherits="PageAdmin.search_zdymodel"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<asp:PlaceHolder id="P_Head" runat="server"><div class="main_box main_box_style"><div class="main_box_inner">
<div class="current_location" id="current_location"><ul><li class="current_location_1"><%=Current_Location%>  &gt; <%=Current_Name%></li><li class="current_location_2"><%=Current_Name%></li></ul></div>
<div class="sublanmu_box">
<div class="sublanmu_content"></asp:PlaceHolder>
<%conn.Open();%><script language="c#" runat="server">
string Sql_Format(string str,bool isFuzzyQuery)
 {
    if(string.IsNullOrEmpty(str)){return string.Empty;}
    str=Server.UrlDecode(Server.UrlEncode(str).Replace("%00",""));
    str=str.Replace("'","''");
    str=str.Replace("\"","\"");
    if(isFuzzyQuery)
     {
      str=str.Replace("[]","[[]]");
      str=str.Replace("[","[[]");
      str=str.Replace("]","[]]");
      str=str.Replace("_","[_]");
      str=str.Replace("%","[%]");
      str=str.Replace("^","[^]");
     }
    return str;
 }
</script>
<div id="search_result"></div>
<ul class="tw_article">
<%
string kw=Request.QueryString["kw"];
if(!string.IsNullOrEmpty(kw))
 {
   if(kw.Length>15)
    {
      kw=kw.Substring(0,15);
    }
   Sql_Condition+=" and title like '%"+Sql_Format(kw.Trim(),true)+"%'";
 }
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
<li><%if(pic!=""){%><span class="pic"><a href="<%=Detail_Url(dr)%>" target="_blank"><img src="<%=dr["titlepic"]%>"></a></span><%}%><span class="title"><a href="<%=Detail_Url(dr)%>" target="_blank" title="<%=Server.HtmlEncode(dr["title"].ToString())%>"><%=SubStr(dr["title"].ToString(),80,true)%></a></span>
<span class="info"> <%=((DateTime)dr["thedate"]).ToString("yy.MM.dd")%> &nbsp;-&nbsp; <%=author%> &nbsp;-&nbsp; 阅 <%=dr["clicks"].ToString()%></span>
<span class="introduction"><%=SubStr(dr["pa_introduct"].ToString(),250,true)%></span>
</li>
<%
 }
%>
</ul>
<script type="text/javascript">
Id("search_result").innerHTML="搜索关键字：<span style=\"color:#ff6600\"><%=Server.HtmlEncode(kw)%></span>，搜索到 <span style=\"color:#ff6600\"><%=RecordCount%></span>条结果";
window.onload=function(){
Id("s_kw").value="<%=Server.HtmlEncode(kw)%>";
}
</script>

<%conn.Close();
if(PageCount>1)
{
 string PageHtml="<div class=\"sublanmu_page search_zdymodel_page\">";
 if(CurrentPage==1)
 {
 if(APage_LinkText[0]!=""){PageHtml+="<span class=\"firstpage\">"+APage_LinkText[0]+"</span>";} //首页
 }
 else if(CurrentPage>1)
 {
  if(APage_LinkText[0]!=""){PageHtml+="<a href=\""+GoPage(1)+"\" class=\"firstpage\">"+APage_LinkText[0]+"</a>";} //首页
  if(APage_LinkText[1]!=""){PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\" class=\"prevpage\">"+APage_LinkText[1]+"</a>";} //上一页
 }
 int p=8; //表示开始时显示的页码总数
 int M=4; //超过p页后左右两边显示页码数
 int LastPage=1;
 if(CurrentPage<p)
  {
    LastPage=p;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=1;i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }
  }
 else
  {
    //PageHtml+=" <a href=\""+GoPage(CurrentPage-1)+"\">1...</a>";
    LastPage=CurrentPage+M;
    if(LastPage>PageCount)
     {
       LastPage=PageCount;
     }
    for(int i=(CurrentPage-M);i<=LastPage;i++)
    {
     if(CurrentPage==i)
      {
        PageHtml+=" <span class=\"c\">"+i.ToString()+"</span>";
      }
    else
      {
       PageHtml+=" <a href=\""+GoPage(i)+"\">"+i.ToString()+"</a>";
      }
    }

  }

if(CurrentPage<PageCount)
 {
  if(LastPage<PageCount)
   {
     PageHtml+=" <a href=\""+GoPage(LastPage+1)+"\">...</a>";
   }
  if(APage_LinkText[2]!=""){PageHtml+=" <a href=\""+GoPage(CurrentPage+1)+"\" class=\"nextpage\">"+APage_LinkText[2]+"</a>";}  //下一页
  if(APage_LinkText[3]!=""){PageHtml+=" <a href=\""+GoPage(PageCount)+"\" class=\"lastpage\">"+APage_LinkText[3]+"</a>";}     //尾页
 }
else if(CurrentPage==PageCount)
 {
 if(APage_LinkText[3]!=""){PageHtml+=" <span class=\"lastpage\">"+APage_LinkText[3]+"</span>";}     //尾页
 }
 if(Page_LinkInfo!=""){PageHtml+=" <span class=\"pageinfo\">"+String.Format(Page_LinkInfo,CurrentPage,PageCount,RecordCount)+"</span>";} //记录页次
 PageHtml+="</div>";
 Response.Write(PageHtml);
}%>
<asp:PlaceHolder id="P_Footer" runat="server"></div></div></div></div></asp:PlaceHolder>