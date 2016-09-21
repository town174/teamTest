<% @ Control  Language="C#" Inherits="PageAdmin.patag"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<%Start();%>
<div class="s_bar">
<input type="text" id="s_kw" class="s_tb" value="请输入关键词" onfocus="if(this.value=='请输入关键词')this.value=''"/><input type="button" class="s_bt" onclick="sitesearch()"/>
</div>
<script type="text/javascript">
function sitesearch()
 {
   var s_kw=Id("s_kw");
   if(s_kw.value=="" || s_kw.value=="请输入关键词")
    {
     alert("请输入搜索关键词!");
     s_kw.focus();
     return;
    }
  location.href="/index.aspx?modelid=49&lanmuid=61&sublanmuid=642&kw="+encodeURI(s_kw.value);
 }
</script>
<%End();%>