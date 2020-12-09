<%inherit file="layout.mako"/>
<%def name="title()">
  Teilname Mitarbeiter
</%def>
<h2>Mitarbeiter:</h2>
<label>Name</label>
<input disabled name="name" value="${employee['name'] | h}"></input>
<label>Nachname</label>
<input disabled name="surname" value="${employee['surname'] | h}"></input>
<label>Akademischer Grad</label>
<input disabled name="degree" value="${employee['degree'] | h}"></input>
<label>Beschäftigung</label>
<input disabled name="occupation" value="${employee['occupation'] | h}"></input>


<h2>Weiterbildungen:</h2>
<div class="list-header list-participations-employee-trainings">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>Status</div>
  <div>Aktionen</div>
</div>
% for training in trainings_assigned:
  <div data-training-id="${training['id']}" class="list-row list-participations-employee-trainings">
    <input disabled name="title" value="${training['title'] | h}"></input>
    <input disabled name="desc" value="${training['desc'] | h}"></input>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"></input>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"></input>
    <% selected = participations[trainings['id']] %>
    <select>
      % for s in [1,2,3,4,5]:
        <option ${selected == s and "selected" or ""} value="${s}"></option>
      % endfor
    </select>
    <div class="actions">
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% endfor
