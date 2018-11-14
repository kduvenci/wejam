
const connect = document.getElementById("connect-btn");
console.log("hello")
connect.addEventListener("click", (event) => {
// event.target.classList.add("disabled");
event.target.innerText = "Bingo!";
});
