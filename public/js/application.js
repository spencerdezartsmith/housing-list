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
      hideListingButton()
      hideListingsList()
      $('div.list-group').first().before(form)
    })
    .fail(function(){
      console.log("Keep trying")
    })
  })

}

function hideListingButton(){
  $('a.btn.btn-info').hide()
}

function hideListingsList(){
  $('div.list-group').hide()
  $('h3').hide()
}
