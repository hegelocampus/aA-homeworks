document.addEventListener("DOMContentLoaded", function(){
});
const canvas = document.getElementById('mycanvas')
const ctx = canvas.getContext('2d');
ctx.fillStyle = "#7f00ff";
ctx.fillRect(20, 10, 150, 100);

ctx.lineWidth = 30;
ctx.strokeStyle = "blue";
ctx.beginPath();
ctx.arc(95, 60, 35, 0, 2 * Math.PI);
ctx.stroke();
ctx.fillStyle = "#007fff";
ctx.fill();

ctx.transform(1, .1, .5, 1, 0, 0);
ctx.rotate(50);
ctx.fillRect(0, 200, 100, 100);
