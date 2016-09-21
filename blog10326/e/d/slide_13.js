
var Image_13=new Array();
var Pics="/e/upload/s1/article/image/2012-08/tpic_t_17145811.jpg|/e/upload/s1/article/image/2012-08/tpic_t_17121638.jpg|/e/upload/s1/article/image/2012-08/tpic_t_17002421.jpg";
var Links="/index.aspx?lanmuid=62&sublanmuid=625&id=469|/index.aspx?lanmuid=62&sublanmuid=625&id=468|/index.aspx?lanmuid=62&sublanmuid=625&id=467";
var Titles="加工车间|办公一角|美丽风景";
var Alts="加工车间|办公一角|美丽风景";
var Apic13=Pics.split('|');
var ALink13=Links.split('|');
var ATitle13=Titles.split('|');
var AAlts13=Alts.split('|');
var Show_Text=1;
var Total_Item=Apic13.length;
for(i=0;i<Total_Item;i++)
  {
   Image_13.src = Apic13[i]; 
  }







 var speed_13=3500;
 var slide_currentitem_13=0; 
 var Title="",Link="";
 var slide_Time_13;
function LoadSlideBox_13()
{
SlideHtml='<a href="#" id="slide_link_13" target="_self"><img class="slide_image" style="display:block;filter:revealTrans(duration=1,transition=20);display:none;border:0px solid ;width:290px;height:160px"  name="slide_pic_13" id="slide_pic_13"></a>';
SlideHtml+='<ul  class="slide_item" style="display:">';
for(i=0;i<Total_Item;i++)
  {
    SlideHtml+='<li id="slide_num_13_'+i+'" onclick="Change_Num_13('+i+')">'+(i+1)+'</li>';
  }
SlideHtml+='</ul>';
document.write("<div id='slide_box_13' class='slide_box' style='width:290px;height:160px'>"+SlideHtml+"</div><div style='width:290px;text-align:center;display:none' id='slide_title_13'></div>");
document.images["slide_pic_13"].src=Apic13[0];
document.images["slide_pic_13"].alt=AAlts13[0];
document.images["slide_pic_13"].style.display="inline";


Title="<a href='"+ALink13[0]+"' class='slide_title' target='_self'>"+ATitle13[0]+"</a>";
document.getElementById("slide_link_13").href=ALink13[0];
if(Show_Text=="1")
 {
  document.getElementById("slide_title_13").style.display="";
  document.getElementById("slide_title_13").innerHTML=Title;
 }


document.getElementById("slide_num_13_0").className="current";
slide_Time_13=setInterval(nextAd_13,speed_13);
document.getElementById("slide_box_13").onmouseover=function() {clearInterval(slide_Time_13)}
document.getElementById("slide_box_13").onmouseout=function() {slide_Time_13=setInterval(nextAd_13,speed_13)}

}

function setTransition_13()
{
  if (document.all)
   {
     document.images["slide_pic_13"].filters.revealTrans.Transition=23;
     document.images["slide_pic_13"].filters.revealTrans.apply();
   }
}


function playTransition_13()
{
  if(document.all)
  document.images["slide_pic_13"].filters.revealTrans.play()
}


function Control_Num_13(Currentnum)
 {
  for(i=0;i<Apic13.length;i++)
  {
   document.getElementById("slide_num_13_"+i).className="";
  }
  document.getElementById("slide_num_13_"+Currentnum).className="current";
 }

function Change_Num_13(Currentnum)
 {
  for(i=0;i<Total_Item;i++)
  {
   document.getElementById("slide_num_13_"+i).className="";
  }
  document.getElementById("slide_num_13_"+Currentnum).className="current";
  slide_currentitem_13=Currentnum;
  ShowFocus_13(Currentnum);
 }

function nextAd_13()
{
  if(Apic13.length<=1)
   {
     clearInterval(slide_Time_13);
     return;
   }

  if(slide_currentitem_13<Apic13.length-1)
    {
      slide_currentitem_13++;
    }
  else 
   {
     slide_currentitem_13=0;
   }
 ShowFocus_13(slide_currentitem_13);
}


function ShowFocus_13(slide_currentitem_13)
 {
  if(ATitle13.length>slide_currentitem_13)
   {
     if(ALink13.length>slide_currentitem_13)
      {
       Title="<a href='"+ALink13[slide_currentitem_13]+"' class='slide_title' target='_self'>"+ATitle13[slide_currentitem_13]+"</a>";
      }
     else
      {
       Title=ATitle13[slide_currentitem_13]; 
      }
   }
  else
   {
       Title=""; 
   }

  if(ALink13.length>slide_currentitem_13)
   {
      Link=ALink13[slide_currentitem_13];
   }
  else
   {
      Link="#";
   }

  document.getElementById("slide_link_13").href=Link;
  document.getElementById("slide_title_13").innerHTML=Title;

  setTransition_13();
  document.images["slide_pic_13"].src=Apic13[slide_currentitem_13];
  document.images["slide_pic_13"].alt=AAlts13[slide_currentitem_13];
  document.getElementById("slide_title_13").innerHTML=Title;
  playTransition_13();
  Control_Num_13(slide_currentitem_13);
 }

LoadSlideBox_13();