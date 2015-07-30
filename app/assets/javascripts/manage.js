console.log("JS is running");
  $(function(){
    $(".movie").click(function(){
      if ($("#update"+this.id)[0].style.display == "block"){
        $("#update"+this.id).slideToggle("slow", function(){});
      } else {
        $(".hidden_div").slideUp("slow", function(){});
          $("#update"+this.id).slideToggle("slow", function(){});
      }
    });
    $("#add_movie").click(function(){
      if ($("#new_movie")[0].style.display == "block"){
        $("#new_movie").slideToggle("slow", function(){});
      } else {
        $(".hidden_div").slideUp("slow", function(){});
        $("#new_movie").slideToggle("slow", function(){});
      }
    });
    //show_times
    $(".add_show_times_movie").click(function(){
      $("#new_show_times_movie"+this.id).slideToggle("slow", function(){});
    });
    $(".new_show_times_get_dates").click(function(event){
      console.log($("#theater_option"+this.id).val());
      if($("#show_times_from"+this.id)[0].value&&$("#show_times_to"+this.id)[0].value&&new Date($("#show_times_to"+this.id)[0].value)&&new Date($("#show_times_to"+this.id)[0].value)>=new Date($("#show_times_from"+this.id)[0].value)&&$("#theater_option"+this.id).val()!="Select"){
        $("#form_show_times_movie"+this.id).html("");
        var date_to = new Date($("#show_times_to"+this.id)[0].value);
        var date_from = new Date($("#show_times_from"+this.id)[0].value);
        // console.log($("#show_times_to"+this.id)[0].value);
        var date_temp = new Date($("#show_times_from"+this.id)[0].value);
        var date_array = [];
        var getDay=["SUN","MON","TUE","WED","THU","FRI","SAT"];
        $("#form_show_times_movie"+this.id).append("<table class='form_date' id='dates_table"+this.id+"'></table>");
        for(i=0;date_temp<=date_to;i++){
          date_temp.setDate(date_temp.getDate()+1);
          var mon_string =((date_temp.getMonth()+1)%12).toString();
          var dat_string =date_temp.getDate().toString();
          if (mon_string.length === 1){
            mon_string="0"+mon_string;
          }
          if (dat_string.length === 1){
            dat_string="0"+dat_string;
          }
          var date_string=date_temp.getFullYear()+"-"+mon_string+"-"+dat_string;
          var example="";
          if(i===0){
            example="placeholder='example 9:00, 11:25, 13:50, 16:15, 18:40'";
          }
          $("#dates_table"+this.id).append("<tr><td>("+
          getDay[date_temp.getDay()]+
          ")</td><td>"+
          date_string+
          "</td><td>"+
          "<input type='textarea' class='times' name='"+date_string+"' "+example+">"+
          "</td></tr>");
          date_array.push(date_string);
        }
        console.log(date_array.toString());
        $("#form_show_times_movie"+this.id).append("<input type='hidden' name='dates' value="+date_array.toString()+">");
        $("#form_show_times_movie"+this.id).append("<input type='hidden' name='theater' value="+$("#theater_option"+this.id).val()+">");
        $("#form_show_times_movie"+this.id).append("<div class='form_button'><input type='submit' value='CHECK SCHEDULE'></div>");

      }else{
        alert("Error: Invaild form");
      }
    });
  });
