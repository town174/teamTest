<% @ Control Language="C#" Inherits="PageAdmin.nav_menu" %>
<div id="nav_<%=Nav_Id%>" <%=Nav_box_style%> class="nav_box nav_box_menu">
<%if(Title_Show=="1"){%>
<div <%=Nav_titlebox_style%> class="nav_title"><span <%=Nav_title_style%> class="nav_sign"><%=Nav_title%></span><span <%=Nav_more_style%> class="nav_more"><%=More_Url%></span></div>
<%}if(Nav_Header!=""){Response.Write(Nav_Header);}%><div id="nav_menu_<%=Nav_Id%>" <%=Nav_content_style%> class="nav_menu">
<ul id="rootul_<%=Nav_Id%>"><%=NavMenuList%></ul>
</div></div>
<script type="text/javascript">
shut_allsubnav("rootul_<%=Nav_Id%>");
expand_subnav("sl<%=Sublanmu_Id%>","<%=ParentSublanmu%>");
</script>