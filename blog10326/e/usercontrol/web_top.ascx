<% @ Control Language="C#" Inherits="PageAdmin.web_top"%><!DOCTYPE html>
<html>
<head>
<title><%=PaTitle%><%=(!string.IsNullOrEmpty(PaTitle) && !string.IsNullOrEmpty(PaName))?"-":""%><%=PaName%><%=TC%></title><%=string.IsNullOrEmpty(PaKeyWords)?"":"\r\n<meta name=\"keywords\" content=\""+Server.HtmlEncode(PaKeyWords)+"\" />"%><%=string.IsNullOrEmpty(PaDescription)?"":"\r\n<meta name=\"description\" content=\""+Server.HtmlEncode(PaDescription)+"\" />"%>
<meta name="Author" content="PageAdmin CMS" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<link href="<%=CssPath%>" type="text/css" rel="stylesheet" />
<script src="/e/js/comm.js" type="text/javascript"></script><%if(Is_Member==1){%><LINK href="/e/member/member.css" type="text/css" rel="stylesheet" /><script src="/e/js/member.js" type="text/javascript"></script><%}%><%=Zdy_Head%>
</head>
<body>
<div class="page_style <%=LanmuType%> page_l<%=Lanmu_Id%><%=Sublanmu_Id==0?"":"_sl"+Sublanmu_Id%>">
<div class="top_box"><div class="top_box_inner"><%if(Wz_Logo!="" && Logo_Site=="0"){%><div class="logo"><a href="<%=Url_Prefix%>"><img src="<%=Wz_Logo%>" border=0></a></div><%}%>
<div class="topcontent"><%=Wz_Top%></div><%if(Wz_Logo!="" && Logo_Site=="0"){%><div class="clear"></div><%}%>
<%=Zdy_Lanmu%><%if(Wz_Logo!="" && Logo_Site=="1"){%><div class="logo"><a href="<%=Url_Prefix%>"><img src="<%=Wz_Logo%>" border=0></a></div><%}%>
<%if(zdy_lanmu_open=="0"){%><div class="menu_box<%if(Wz_Logo!="" && Logo_Site=="1"){%> right<%}%>" id="Menu"><%=LanmuList%></div><%}%>
</div><script type="text/javascript">var IsPageHome="<%=PageHome%>";var Lanmu_Id="<%=Lanmu_Id%>";var Sublanmu_Id="<%=Sublanmu_Id%>";ShowSubMenu(Lanmu_Id);</script>
</div>