<% @ Control Language="C#" Inherits="PageAdmin.sublanmu_introduct" %>
<div class="current_location current_location_<%=Sublanmu_Id%>" id="current_location"><ul><li class="current_location_1"><%=Current_Location%></li><li class="current_location_2"><%=Current_Name%></li></ul></div>
<div class="sublanmu_box sublanmu_box_<%=Sublanmu_Id%>" id="sublanmu_box">
<div class="sublanmu_content sublanmu_content_introduct" id="Content"><%=TheContent%><asp:PlaceHolder id="P_Zdy" runat="server"/></div><%=TheContent==""?"":"<script src=\"/e/js/internal_page.js\" type=\"text/javascript\"></script>"%>
</div>