document.querySelectorAll(".actions .delete").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.trainingId;
    if (confirm("Soll der Eintrag wirklich gelöscht werden?")) {
      row.remove();
      fetch("/api/training/delete?index=" + id);
    }
  })
);
