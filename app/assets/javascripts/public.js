//movie_show
$(".backdrop_image").click(function(){
  $(".hidden_div")[0].style.display="block";
  $(".full_screen_inside").html("<img src='https://image.tmdb.org/t/p/w"+this.attributes.data_width.value+"/"+this.id+"'>");
});
$(".trailer").click(function(){
  $(".hidden_div")[0].style.display="block";
  $(".full_screen_inside").html("<iframe width='700' height='400' src='https://www.youtube.com/embed/"+this.id+"' frameborder'0' allowfullscreen></iframe>");
});
$(".full_screen_center").click(function(){
  $(".hidden_div")[0].style.display="none";
});

$(".flash").click(function(){
  $(this).slideUp();
});
$(".available").click(function(){
  if($(this).hasClass("selected")){
    $(this).removeClass("selected");
    array=$("#selected_seats")[0].innerHTML;
    array=array.split(",");
    index=array.indexOf(this.id);
    if (index > -1) {
      array.splice(index, 1);
    }
    array.pop();
    if(array.length>0){
      $("#selected_seats")[0].innerHTML=array.toString()+",";
    } else{
      $("#selected_seats")[0].innerHTML=array.toString();
    }
    $("#total_num")[0].innerHTML=Number($("#total_num")[0].innerHTML)-1;
  } else {
    $(this).addClass("selected");
    $("#selected_seats").append(this.id+",");
    $("#total_num")[0].innerHTML=Number($("#total_num")[0].innerHTML)+1;
  }
    $("#form_array")[0].value=$("#selected_seats")[0].innerHTML;
});
