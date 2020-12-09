document.querySelectorAll(".save").forEach((e) =>
  e.addEventListener("click", function (e) {
    const id = document.querySelector('[name="id"]').value;
    const title = document.querySelector('[name="title"]').value;
    const desc = document.querySelector('[name="desc"]').value;
    const date_from = document.querySelector('[name="date_from"]').value;
    const date_to = document.querySelector('[name="date_to"]').value;
    const min_participants = document.querySelector('[name="min_participants"]')
      .value;
    const max_participants = document.querySelector('[name="max_participants"]')
      .value;
    const certificate_id = document.querySelector('[name="certificate"]')
      .value;

    training = {
      id,
      title,
      desc,
      date_from,
      date_to,
      max_participants,
      min_participants,
      certificate_id
    };

    fetch("/api/training/update", {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(training),
    });
  })
);
document.querySelector(".add").addEventListener("click", function (e) {
  const qualification_id = document.querySelector('[name="qualification"]')
    .value;
  const training_id = document.querySelector('[name="id"]').value;
  if (
    document.querySelector('[data-qualification-id="' + qualification_id + '"]')
  ) {
    alert("Qualtifikation ist schon zugewiesen!");
    return;
  }

  fetch("/api/training/add-qualification", {
    method: "post",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ qualification_id, training_id }),
  }).then(() => {
    location.reload();
  });
});
document.querySelectorAll(".actions .delete").forEach((e) =>
  e.addEventListener("click", function (e) {
    const trainingId = document.querySelector('[name="id"]').value;
    const row = this.parentElement.parentElement;
    const qualificationId = row.dataset.qualificationId;
    if (confirm("Soll der Eintrag wirklich gelöscht werden?")) {
      row.remove();
      fetch(
        "/api/training/remove-qualification/" +
          trainingId +
          "/" +
          qualificationId
      );
    }
  })
);
