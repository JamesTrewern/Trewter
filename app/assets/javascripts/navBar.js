$( document ).ready(function() {
    $(".navBarDescription").hide();

    for(i = 0; i < 3; i++){
      $("#nav" + i).click(function(){
        $(this).children(".navBarDescription").slideToggle();
      })
    }
});
