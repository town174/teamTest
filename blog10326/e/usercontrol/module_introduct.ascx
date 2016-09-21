<% @ Control Language="C#" Inherits="PageAdmin.module_introduct" %>
<%=Module_StartHtml%>
<%if(Layout!="-1"){%><div id="module_<%=Module_Id%>" <%=Module_box_style%>class="module_box<%=Layout%><%=Module_ClassName%>">
<div <%=Module_box_inner%>class="module_box_inner">
<%if(Title_Show=="1"){%>
<div <%=Module_titlebox_style%>class="module_title"><span <%=Module_title_style%>class="module_sign"><%=Module_Title%></span><span <%=Module_more_style%>class="module_more"><%=More_Url%></span></div>
<%}if(Module_Header!=""){%><%=Module_Header%><%}%>
<div id="module_content_<%=Module_Id%>" <%=Module_content_style%>class="module_content">
<%}%><%=Module_Content%><asp:PlaceHolder id="P_Zdy" runat="server"/>
<%if(Layout!="-1"){%></div><div class="module_footer"><span class="l"></span><span class="r"></span></div>
</div>
</div><%}%><%=Module_EndHtml%>

