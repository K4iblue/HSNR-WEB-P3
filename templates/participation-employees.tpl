% window.setTitle("Teilname Mitarbeiter")

<h2>Mitarbeiter:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div>Aktionen</div>
</div>
% employees.forEach(employee => {
  <div data-employee-id="${employee['id']}" class="list-row list-employees">
    <input disabled name="name" data-init-value="${employee['name']}" value="${employee['name']}"/>
    <input disabled name="surname" data-init-value="${employee['surname']}" value="${employee['surname']}"/>
    <input disabled name="degree" data-init-value="${employee['degree']}" value="${employee['degree']}"/>
    <input disabled name="occupation" data-init-value="${employee['occupation']}" value="${employee['occupation']}"/>
    <div class="actions">
      <a href="/participation-employee/${employee["id"]}" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% });
<div></div>
