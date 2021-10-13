// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import '../js/bootstrap_js_files.js' 

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.addEventListener("load", () => {
  const element = document.querySelector(".random-quote");
  element.addEventListener("ajax:success", (event) => {
    const [data, _status, _xhr] = event.detail;
    let quoteElement = document.getElementById('show-quote')
    quoteElement.innerText = data.quote.title
    let rating = data.rating
    showRating(rating);
    showAverage(data.average_rating);
    let rating_div = document.querySelector(".rating-div");
    if (rating_div.style.display === 'none') {
      rating_div.style.display = 'block'
    }
  });

  const links = document.querySelectorAll(".rating-link");
  links.forEach((element) => {
    element.addEventListener("ajax:success", (event) => {
      const [data, _status, _xhr] = event.detail;
      let rating = data.rating
      showRating(rating);
      showAverage(data.average_rating);
    });
  });
});

function showRating(rating) {
  const stars = document.querySelectorAll(".fa-star");
  stars.forEach((element) => {

    let rating_link = element.closest(".rating-link")
    let star_number = element.dataset.position 
    rating_link.dataset.params = "rating_id=" + rating.id
    rating_link.href = "/apis/quotes/" + rating.quote_id + "/ratings/" + rating.id + "?rating=" + star_number
    element.classList.remove("active")
    if (star_number <= rating.stars) {
      element.classList.add("active")
    } 
  });
}

function showAverage(quote_average) {
  const element = document.querySelector(".average");
  element.innerHTML = "Average rating: " + quote_average;
}
