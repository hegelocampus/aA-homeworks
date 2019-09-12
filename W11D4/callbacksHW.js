function setTimeout() {
  alert('HAMMERTIME', 5000);
}

window.setTimeout();

function hammerTime(time) {
  window.setTimout(function() {
    alert(`${ time } is hammertime!`);
  });
}
