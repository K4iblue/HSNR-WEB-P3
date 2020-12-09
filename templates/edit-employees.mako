<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/edit-employees.js"></script>
</%def>
<%def name="title()">
  Mitarbeiter Pflege
</%def>
<h2>Mitarbeiter:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div>Aktionen</div>
</div>
% for employee in employees:
  <div data-employee-id="${employee['id']}" class="list-row list-employees">
    <input disabled name="name" data-init-value="${employee['name'] | h}" value="${employee['name'] | h}"></input>
    <input disabled name="surname" data-init-value="${employee['surname'] | h}" value="${employee['surname'] | h}"></input>
    <input disabled name="degree" data-init-value="${employee['degree'] | h}" value="${employee['degree'] | h}"></input>
    <input disabled name="occupation" data-init-value="${employee['occupation'] | h}" value="${employee['occupation'] | h}"></input>
    <div class="actions">
      <a href="#" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" hidden class="save"><img title="Speichern" class="icon" src="/static/icons/check.svg" /></a>
      <a href="#" hidden class="cancel"><img title="Abbrechen" class="icon" src="/static/icons/x.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
      <a href="#" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
</br>
<h2>Mitarbeiter hinzufügen:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div></div>
</div>
<div class="active list-row list-employees">
  <input name="name"></input>
  <input name="surname"></input>
  <input name="degree"></input>
  <input name="occupation"></input>
  <div class="actions">
    <a href="#" class="add">Hinzufügen</a>
  </div>
</div>
