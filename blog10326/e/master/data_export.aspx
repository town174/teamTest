<% @ Page Language="C#"%>
<% @ Import NameSpace="System.Data"%>
<% @ Import NameSpace="System.Data.OleDb"%>
<% @ Import NameSpace="System.Net"%>
<% @ Import NameSpace="System.IO"%>
<% @ Import NameSpace="PageAdmin"%>
<script Language="c#" runat="server">
string uid,SiteId,TheTable,IDS,Sql,Error;
OleDbConnection conn;
protected void Page_Load(Object src,EventArgs e)
   {
   if(!Page.IsPostBack)
    {
     ///公共区域==========================================================
       Conn myconn=new Conn();
       conn=new OleDbConnection(myconn.Constr());
       Error="";
     ///公共区域==========================================================
       SiteId=Request.QueryString["siteid"];
       TheTable=Request.QueryString["table"];
       IDS=Request.QueryString["ids"];
       Sql=Request.QueryString["sql"];
       uid="0";
       if(IsNum(SiteId) && IsStr(TheTable))
       {
       if(Request.QueryString["act"]=="buildfile")
        {
         Master_Check();
         Build_File();
        }
       else
        {
         conn.Open();
           Http_Master_Check();
           if(Error=="")
            {
             Get_Data();
            }
         conn.Close();
        }
       }
    }
  }

protected void Get_Data()
 {
   if(!string.IsNullOrEmpty(IDS) || !string.IsNullOrEmpty(Sql))
    {
     DataSet ds=new DataSet();
     if(!string.IsNullOrEmpty(IDS) && IDS!="0")
      {
        if(TheTable=="pa_member")
         {
           Sql="select * from "+TheTable+" where id in("+IDS+")";
         }
        else
         {
           Sql="select * from "+TheTable+" where site_id="+SiteId+" and id in("+IDS+")";
         }
      }
     else
      {
        Sql=Sql.Replace("select id from","select * from");
      }
     OleDbDataAdapter myadapter=new OleDbDataAdapter(Sql,conn);
     myadapter.Fill(ds,"list");
     DL_1.DataSource=ds.Tables["list"].DefaultView;
     DL_1.DataBind();
   }
 }


private void Build_File()
 {
  string Url="http://"+Request.ServerVariables["SERVER_NAME"]+":"+Request.ServerVariables["SERVER_PORT"]+"/e/zdyform/"+Request.QueryString["table"]+"/master/data_export.aspx?siteid="+SiteId+"&table="+TheTable+"&ids="+IDS+"&sql="+Server.UrlEncode(Sql);
  Response.Write(Url);
  string path1="/e/temp/"+Request.QueryString["table"]+"_"+uid+DateTime.Now.ToString("yyMMddHHmmss")+".xls";
  try
  {
   Encoding encoding=System.Text.Encoding.GetEncoding("UTF-8"); 
   HttpWebRequest MyReq=(HttpWebRequest)WebRequest.Create(Url);

   MyReq.ContentType = "application/x-www-form-urlencoded";  
   MyReq.Headers.Add(HttpRequestHeader.Cookie,Request.Cookies["Master"].Value);
   HttpWebResponse MyRes=(HttpWebResponse)MyReq.GetResponse();
   Stream ReStream=MyRes.GetResponseStream();
   ReStream.ReadTimeout=50000;
   StreamReader Reader=new StreamReader(ReStream,encoding);
   string F_Content=Reader.ReadToEnd();
   //F_Content=Error;
   //F_Content=Request.Headers["Cookie"].ToString();
   Reader.Close();
   ReStream.Close();
   FileStream fs;
   StreamWriter rw;
   string FilePath;
   //Response.Write(F_Content);

   if(!string.IsNullOrEmpty(path1))
   {
    FilePath=Server.MapPath(path1);
    fs=new FileStream(FilePath,FileMode.Create,FileAccess.Write);
    rw=new StreamWriter(fs,encoding);
    rw.Write(F_Content);
    rw.Flush();
    rw.Close();
    fs.Close();
    //Response.Clear();
    Response.ContentType="application/x-zip-compressed";
    Response.Charset="utf-8";
    Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");
    Response.AddHeader("Content-Disposition", "attachment;filename="+Server.UrlEncode(Path.GetFileName(FilePath)));
    Response.TransmitFile(FilePath);
    Response.End();
   }
  }
 catch (Exception ex)
   {
     Response.Write(ex.Message);
   }
 }

private void Http_Master_Check()
    {
      string strcookie=Request.Headers["Cookie"];
      if(string.IsNullOrEmpty(strcookie))
        {
          Error="error1";
          return;
        }
       else
        {
          string Uid=Request_Paras("UID",strcookie);
          string Valicate=Request_Paras("Valicate",strcookie);
          if(string.IsNullOrEmpty(Uid) || string.IsNullOrEmpty(Valicate))
           {
             Error="error2";
             return;
           }
           if(!IsNum(Uid))
            {
              Error="error3";
              return;
            }
           PageAdmin.Md5 Jm=new PageAdmin.Md5();
           string str_LoginDate=Get_LoginKey(Uid);
           if(Jm.Get_Md5(str_LoginDate)!=Valicate || str_LoginDate=="")
            {
              Error="error4";
              return;
            }
 
        }
    }

 private void Master_Check()
    {
      if(Request.Cookies["Master"]==null)
        {
          Response.End();
          return;
        }
       else
        {
          if(Request.Cookies["Master"].Values["UID"]==null || Request.Cookies["Master"].Values["Valicate"]==null)
           {
              Response.End();
              return;
           }

           string str_uid=Request.Cookies["Master"].Values["UID"].ToString();
           uid=str_uid;
           if(!IsNum(str_uid))
            {
             Response.End();
             return;
            }
           PageAdmin.Md5 Jm=new PageAdmin.Md5();
           string str_LoginDate=Get_LoginKey(str_uid);
           string str_valicate=Request.Cookies["Master"].Values["Valicate"].ToString();
           if(Jm.Get_Md5(str_LoginDate)!=str_valicate || str_LoginDate=="")
            {
              Response.End();
              return;
            }
 
        }
    }

private string Request_Paras(string paras,string str) //获取url中参数
 { 
  string rv="";
  if(string.IsNullOrEmpty(str)){return rv;}
  string[] Astr = str.Split('&'); 
  string[] A_Astr;
  for(int i=0;i<Astr.Length; i++)
   { 
    A_Astr=Astr[i].Split('=');
    if(A_Astr[0]==paras)
      {
       rv=A_Astr[1];
      }
   } 
   return rv; 
} 

private string Get_LoginKey(string UID)
 {
    string RV="";
    PageAdmin.Conn Myconn=new PageAdmin.Conn();
    string constr=Myconn.Constr();
    OleDbConnection conn=new OleDbConnection(constr);
    conn.Open();
    string sql="select login_key,m_group from pa_member where id="+UID;
    OleDbCommand comm=new OleDbCommand(sql,conn);
    OleDbDataReader dr=comm.ExecuteReader();
    if(dr.Read())
     {  
       if(dr["m_group"].ToString()=="admin")
        {
          RV=dr["login_key"].ToString();
        }
     } 
    dr.Close();
    conn.Close();
    return RV;
 }


private bool IsStr(string str)
 { 
  if(string.IsNullOrEmpty(str)){return false;}
  string str1="0123456789abcdefghijklmnopqrstuvwxyz_";
  string str2=str.ToLower();
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }

private bool IsNum(string str)
 {
  if(string.IsNullOrEmpty(str)){return false;}
  string str1="0123456789";
  string str2=str.ToLower();;
  for(int i=0;i<str2.Length;i++)
   {
    if(str1.IndexOf(str2[i])==-1)
     {
       return false;
     }
   }
  return true;
 }
</script><!DOCTYPE html><html><head><!--<xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>数据列表</x:Name><x:WorksheetOptions><x:print><x:ValidPrinterInfo /></x:print></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><style type="text/css">br{mso-data-placement:same-cell;}</style></head>
<asp:Repeater id="DL_1"  runat="server">
   <HeaderTemplate>
     <table border=1>
      <tr>{pa:FieldHead}</tr>
   </HeaderTemplate>
   <ItemTemplate>  
      <tr>{pa:FieldContent}</tr>
    </ItemTemplate> 
   <FooterTemplate>
     </table>
   </FooterTemplate>
 </asp:Repeater>
</html>
