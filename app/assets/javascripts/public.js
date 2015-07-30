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
  console.log("test");
  $(this).slideUp();
});
