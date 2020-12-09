document.querySelectorAll(".training .save").forEach((e) =>
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
    training = {
      id,
      title,
      desc,
      date_from,
      date_to,
      max_participants,
      min_participants,
    };

    fetch("/api/training/update", {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(training),
    });
  })
);
