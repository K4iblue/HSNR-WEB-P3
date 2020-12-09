window.setTimeout(() => document.querySelectorAll(".counter").forEach((e) => {
  let goal = e.dataset.goal;
  e.setAttribute("style", "--num: " + goal);
}), 100);
