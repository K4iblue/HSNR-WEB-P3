window.editing = -1;
document.querySelectorAll(".actions .delete").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.certificateId;
    if (confirm("Soll der Eintrag wirklich gelöscht werden?")) {
      row.remove();
      fetch("/api/certificate/delete?index=" + id);
    }
  })
);
document.querySelectorAll(".actions .edit").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.certificateId;
    if (window.editing == -1) {
      this.hidden = true;
      window.editing = id;
      row.classList.add("active");
      row.querySelector(".save").hidden = false;
      row.querySelector(".cancel").hidden = false;
      row.querySelectorAll("input").forEach((e) => (e.disabled = false));
    }
  })
);
document.querySelectorAll(".actions .save").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.certificateId;
    if (window.editing == id) {
      this.hidden = true;
      window.editing = -1;
      row.classList.remove("active");
      row.querySelector(".cancel").hidden = true;
      row.querySelector(".edit").hidden = false;
      row.querySelectorAll("input").forEach((e) => (e.disabled = true));
      const title = row.querySelector('[name="title"]');
      const desc = row.querySelector('[name="desc"]');
      const qualifies = row.querySelector('[name="qualifies"]');
      certificate = {};
      certificate.id = id;
      certificate.title = title.value;
      certificate.desc = desc.value;
      certificate.qualifies = qualifies.value;

      title.dataset.initValue = title.value;
      desc.dataset.initValue = desc.value;
      qualifies.dataset.initValue = qualifies.value;

      fetch("/api/certificate/update", {
        method: "post",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(certificate),
      });
    }
  })
);
document.querySelectorAll(".actions .cancel").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.certificateId;
    if (window.editing == id) {
      this.hidden = true;
      window.editing = -1;
      row.classList.remove("active");
      row.querySelector(".save").hidden = true;
      row.querySelector(".edit").hidden = false;
      row.querySelectorAll("input").forEach((e) => (e.disabled = true));
      const title = row.querySelector('[name="title"]');
      const desc = row.querySelector('[name="desc"]');
      const qualifies = row.querySelector('[name="qualifies"]');
      title.value = title.dataset.initValue;
      desc.value = desc.dataset.initValue;
      qualifies.value = qualifies.dataset.initValue;
    }
  })
);
document.querySelectorAll(".actions .add").forEach((e) =>
  e.addEventListener("click", function (e) {
    if (window.editing == -1) {
      const row = this.parentElement.parentElement;
      const title = row.querySelector('[name="title"]');
      const desc = row.querySelector('[name="desc"]');
      const qualifies = row.querySelector('[name="qualifies"]');
      certificate = {};
      certificate.title = title.value;
      certificate.desc = desc.value;
      certificate.qualifies = qualifies.value;

      fetch("/api/certificate/insert", {
        method: "post",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(certificate),
      });
      window.reload();
    } else {
      alert("Sie bearbeitet gerade noch einen Eintrag!");
    }
  })
);
