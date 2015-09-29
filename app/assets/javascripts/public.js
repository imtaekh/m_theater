var banners=null;
$(document).on('ready page:load', function () {
  console.log("public.js");
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

  if($(".banner_frame").length){
    console.log("banner");

    $(".banner_frame").each(function(index){
      var frame = this;
      var images = $(frame).find(".banner_image");

      // images.css("transition","right 0.5s");
      images.css("right","0px");

      frame.WIDTH = $(frame).attr("width");
      frame.HEIGHT = $(frame).attr("height");
      $(frame).bind('resize', function () {
        console.log("changed");
      });
      $(frame).width("100%");
      var width = $(frame).width();
      $(frame).find(".banner_container").width("200%");
      $(frame).height(width*frame.HEIGHT/frame.WIDTH);
      images.width(width);
    });
    clearInterval(banners);
    banners=setInterval(bannerRotatorRight, 5000);
  }
  // $(window).resize(function () {
  //   $(".container").width(Math.floor(document.body.clientWidth/400)*400);
  // });


});

function bannerRotatorRight() {
  $(".banner_frame").each(function(index){
    var frame = this;
    var images = $(frame).find(".banner_image");
    var right = parseInt(images.css("right"));

    if($(frame).width() > right){ //before rotating -> start ratating
      console.log("if");
      images.css("transition","right 0.5s");
      images.css("right","100%");
    } else { //after ratating -> rearrange banners
      console.log("else");
      images.css("transition","");
      var banner_div = $(frame).find(".banner_div");
      $(banner_div.first()).insertAfter(banner_div.last());
      images.css("right","0");
      bannerRotatorRight();
    }
  });
}

function bannerRotatorLeft() {
  $(".banner_frame").each(function(index){
    var frame = this;
    var images = $(frame).find(".banner_image");
    var right = parseInt(images.css("right"));

    if($(frame).width() == right){ //before rotating -> start ratating
      console.log("if");

      images.css("transition","right 0.5s");
      images.css("right","0");
    } else {
      console.log("else");
      images.css("transition","");
      var banner_div = $(frame).find(".banner_div");
      $(banner_div.last()).insertBefore(banner_div.first());
      images.css("right","100%");
      bannerRotatorLeft();
    }
  });
}
