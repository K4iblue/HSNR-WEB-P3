window.editing = -1;
document.querySelectorAll(".actions .delete").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.employeeId;
    if (confirm("Soll der Eintrag wirklich gelöscht werden?")) {
      row.remove();
      fetch("/api/employee/delete?index=" + id);
    }
  })
);
document.querySelectorAll(".actions .edit").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.employeeId;
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
    const id = row.dataset.employeeId;
    if (window.editing == id) {
      this.hidden = true;
      window.editing = -1;
      row.classList.remove("active");
      row.querySelector(".cancel").hidden = true;
      row.querySelector(".edit").hidden = false;
      row.querySelectorAll("input").forEach((e) => (e.disabled = true));
      const name = row.querySelector('[name="name"]');
      const surname = row.querySelector('[name="surname"]');
      const degree = row.querySelector('[name="degree"]');
      const occupation = row.querySelector('[name="occupation"]');
      employee = {};
      employee.id = id;
      employee.name = name.value;
      employee.surname = surname.value;
      employee.degree = degree.value;
      employee.occupation = occupation.value;

      name.dataset.initValue = name.value;
      surname.dataset.initValue = surname.value;
      degree.dataset.initValue = degree.value;
      occupation.dataset.initValue = occupation.value;

      fetch("/api/employee/update", {
        method: "post",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(employee),
      });
    }
  })
);
document.querySelectorAll(".actions .cancel").forEach((e) =>
  e.addEventListener("click", function (e) {
    const row = this.parentElement.parentElement;
    const id = row.dataset.employeeId;
    if (window.editing == id) {
      this.hidden = true;
      window.editing = -1;
      row.classList.remove("active");
      row.querySelector(".save").hidden = true;
      row.querySelector(".edit").hidden = false;
      row.querySelectorAll("input").forEach((e) => (e.disabled = true));
      const name = row.querySelector('[name="name"]');
      const surname = row.querySelector('[name="surname"]');
      const degree = row.querySelector('[name="degree"]');
      const occupation = row.querySelector('[name="occupation"]');
      name.value = name.dataset.initValue;
      surname.value = surname.dataset.initValue;
      degree.value = degree.dataset.initValue;
      occupation.value = occupation.dataset.initValue;
    }
  })
);
document.querySelectorAll(".actions .add").forEach((e) =>
  e.addEventListener("click", function (e) {
    if (window.editing == -1) {
      const row = this.parentElement.parentElement;
      const name = row.querySelector('[name="name"]');
      const surname = row.querySelector('[name="surname"]');
      const degree = row.querySelector('[name="degree"]');
      const occupation = row.querySelector('[name="occupation"]');
      employee = {};
      employee.name = name.value;
      employee.surname = surname.value;
      employee.degree = degree.value;
      employee.occupation = occupation.value;

      fetch("/api/employee/insert", {
        method: "post",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(employee),
      }).then(() => window.reload());
    } else {
      alert("Sie bearbeitet gerade noch einen Eintrag!");
    }
  })
);
