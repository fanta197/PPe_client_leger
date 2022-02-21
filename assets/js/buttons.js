/***************** buttons ******************/
$('.button_moins').click(function(){
    var text=$(".function_button").text()
    if(text > 1){
        $(".function_button").text(text-1)
    }
   console.log("moins")
    })
    $('.button_plus').click(function(){
   var text=$(".function_button").text()
    $(".function_button").text(text-(-1))
    console.log("plus")
   })
   
