// tema.js
let tema = localStorage.getItem("tema");

function updateTheme() {
  if (tema === "dark") {
    document.body.classList.add("dark");
    document.getElementById("schimba_tema").innerHTML = '<i class="fas fa-moon"></i> Schimba tema';
  } else {
    document.body.classList.remove("dark");
    document.getElementById("schimba_tema").innerHTML = '<i class="fas fa-sun"></i> Schimba tema';
  }
}

if (tema) {
  document.body.classList.add("dark");
}

window.addEventListener("DOMContentLoaded", function() {
  updateTheme();

  document.getElementById("schimba_tema").onclick = function() {
    if (document.body.classList.contains("dark")) {
      document.body.classList.remove("dark");
      localStorage.removeItem("tema");
      tema = null;
    } else {
      document.body.classList.add("dark");
      localStorage.setItem("tema", "dark");
      tema = "dark";
    }
    updateTheme();
  }
});
