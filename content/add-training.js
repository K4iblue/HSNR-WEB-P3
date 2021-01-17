document.querySelectorAll(".add").forEach((e) =>
  e.addEventListener("click", function (e) {
    const title = document.querySelector('[name="title"]');
    const desc = document.querySelector('[name="desc"]');
    const date_from = document.querySelector('[name="date_from"]');
    const date_to = document.querySelector('[name="date_to"]');
    const min_participants = document.querySelector(
      '[name="min_participants"]'
    );
    const max_participants = document.querySelector(
      '[name="max_participants"]'
    );
    const certificate_id = document.querySelector(
      '[name="certificate_id"]'
    );
    training = {};
    training.title = title.value;
    training.desc = desc.value;
    training.date_from = date_from.value;
    training.date_to = date_to.value;
    training.min_participants = min_participants.value;
    training.max_participants = max_participants.value;
    training.certificate_id = certificate_id.value;

    fetch("/api/training/insert", {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(training),
    }).then((r) => window.reload());
  })
);
