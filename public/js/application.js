$(document).ready(function() {
  console.log('ready')
  showListingForm();
});

function showListingForm(){
  $('a.btn.btn-info').on('click', function(event){
    event.preventDefault();

    $.ajax({
      url: '/listings/new',
      method: 'GET'
    })
    .done(function(form){
      console.log('good job homie')
      console.log(form)
    })
    .fail(function(){
      console.log("Keep trying")
    })
  })

}
