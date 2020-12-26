% window.setTitle("Mitarbeiter Pflege")
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
      <a href="#" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" hidden class="save"><img title="Speichern" class="icon" src="/static/icons/check.svg" /></a>
      <a href="#" hidden class="cancel"><img title="Abbrechen" class="icon" src="/static/icons/x.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
        <a href="/view-employee/${employee['id']}" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% })
<br/>
<h2>Mitarbeiter hinzufügen:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div></div>
</div>
<div class="active list-row list-employees">
  <input name="name"/>
  <input name="surname"/>
  <input name="degree"/>
  <input name="occupation"/>
  <div class="actions">
    <a href="#" class="add">Hinzufügen</a>
  </div>
</div>
