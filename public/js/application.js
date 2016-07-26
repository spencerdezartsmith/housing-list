var form;
var listingButton;
var allListings;
var confirmListing;

$(document).ready(function() {
  console.log('ready')
  form = $('.form')
  listingButton = $('a.btn.btn-info')
  confirmListing = $('button.btn.btn-primary')
  showListingForm();
});

function showListingForm(){
  listingButton.on('click', function(event){
    event.preventDefault();

    $.ajax({
      url: '/listings/new',
      method: 'GET'
    })
    .done(function(form){
      hideListingButton();
      hideListingsList();
      // postListing();
      $('.form').append(form);
      postListing();
    })
    .fail(function(){
      console.log("Keep trying")
    })
  })
}

function hideListingButton(){
  listingButton.hide();
}

function hideListingsList(){
  $('.all-listings').hide();
}

function showListingsList(){
  $('.all-listings').show();
  listingButton.show();
}

function postListing(){
  confirmListing.on('click', function(event){
    event.preventDefault();
    formData = $('form').serialize()

    $.ajax({
      url: '/listings',
      method: 'POST',
      data: formData
    })
    .done(function(listing){
      form.hide();
      showListingsList()
      $('.all-listings').append(listing)
    })
    .fail(function(){
      console.log("Try again")
    })
  })
}
