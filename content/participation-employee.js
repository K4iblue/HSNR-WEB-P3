document.querySelectorAll(".actions .add").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const employee_id = document.querySelector('[name="id"]').value;
    const training_id = row.dataset.trainingId;

    fetch("/api/participation/insert", {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ employee_id, training_id, status: 1 }),
    }).then(() => window.location.reload());
  })
);
document.querySelectorAll("select").forEach((e) =>
  e.addEventListener("change", function (e) {
    const row = this.parentElement;
    const employee_id = document.querySelector('[name="id"]').value;
    const training_id = row.dataset.trainingId;
    const status = this.value;

    fetch("/api/participation/update", {
      method: "post",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ employee_id, training_id, status }),
    }).then(() => window.location.reload());
  })
);
