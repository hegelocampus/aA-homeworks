document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  // adding SF places as list items

  const placeFormEl = document.getElementsByClassName("favorite-submit")[0];
  placeFormEl.addEventListener("click", event => {
    event.preventDefault();

    const placeNameInputEl = document.getElementsByClassName("favorite-input")[0];
    const placeName = placeNameInputEl.value;
    placeNameInputEl.value = "";

    const li = document.createElement("li");
    li.textContent = placeName;
    document.getElementById("sf-places").appendChild(li);
  });

  // adding new photos

  const newPhotoButtonEl = document.getElementsByClassName("photo-show-button")[0];
  newPhotoButtonEl.addEventListener("click", event => {
    event.preventDefault();

    const photoFormContainerEl = document.getElementsByClassName("photo-form-container")[0];

    photoFormContainerEl.classList.toggle("hidden");

    const photoForm = document.getElementsByClassName("photo-url-submit")[0];
    photoForm.addEventListener("click", event => {
      event.preventDefault();

      const photoUrlInputEl = document.getElementsByClassName("photo-url-input")[0];
      const photoUrl = photoUrlInputEl.value;
      photoUrlInputEl.value = "";

      const photoLi = document.createElement("li");
      const photoImg = document.createElement("img");
      photoImg.setAttribute("src", photoUrl);
      photoLi.appendChild(photoImg);
      document.getElementsByClassName("dog-photos")[0].appendChild(photoLi);
    });
  });

});
