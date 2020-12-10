<%inherit file="layout.mako"/>
<%def name="title()">
  Teilname Mitarbeiter
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
    <input disabled name="name" data-init-value="${employee['name'] | h}" value="${employee['name'] | h}"/>
    <input disabled name="surname" data-init-value="${employee['surname'] | h}" value="${employee['surname'] | h}"/>
    <input disabled name="degree" data-init-value="${employee['degree'] | h}" value="${employee['degree'] | h}"/>
    <input disabled name="occupation" data-init-value="${employee['occupation'] | h}" value="${employee['occupation'] | h}"/>
    <div class="actions">
      <a href="/participation-employee/${employee["id"]}" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
<div></div>
