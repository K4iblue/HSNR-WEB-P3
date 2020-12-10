<%inherit file="layout.mako"/>
<%!
  from app.model.participation import render_status as status
%>
<%def name="head()">
  <script defer src="/static/participation-employee.js"></script>
</%def>
<%def name="title()">
  Mitarbeiter Details
</%def>
<h2>Mitarbeiter:</h2>
<input hidden name="id" value="${employee['id'] | h}"></input>
<label>Name</label>
<input disabled name="name" value="${employee['name'] | h}"></input>
<label>Nachname</label>
<input disabled name="surname" value="${employee['surname'] | h}"></input>
<label>Akademischer Grad</label>
<input disabled name="degree" value="${employee['degree'] | h}"></input>
<label>Beschäftigung</label>
<input disabled name="occupation" value="${employee['occupation'] | h}"></input>
<br/>
<h3>Qualifikationen:</h3>
<div class="list-header list-qualifications">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Aktionen</div>
</div>
% for qualification in qualifications:
  <div data-qualification-id="${qualification['id']}" class="list-row list-qualifications">
    <input disabled name="title" data-init-value="${qualification['title'] | h}" value="${qualification['title'] | h}"></input>
    <input disabled name="desc" data-init-value="${qualification['desc'] | h}" value="${qualification['desc'] | h}"></input>
    <div class="actions">
      <a href="#" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" hidden class="save"><img title="Speichern" class="icon" src="/static/icons/check.svg" /></a>
      <a href="#" hidden class="cancel"><img title="Abbrechen" class="icon" src="/static/icons/x.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% endfor
<h3>Zertifikate:</h3>
<div class="list-header list-certificates">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Bereichtigt zu</div>
  <div>Aktionen</div>
</div>
% for certificate in certificates:
  <div data-certificate-id="${certificate['id']}" class="list-row list-certificates">
    <input disabled name="title" data-init-value="${certificate['title'] | h}" value="${certificate['title'] | h}"></input>
    <input disabled name="desc" data-init-value="${certificate['desc'] | h}" value="${certificate['desc'] | h}"></input>
    <input disabled name="qualifies" data-init-value="${certificate['qualifies'] | h}" value="${certificate['qualifies'] | h}"></input>
    <div class="actions">
      <a href="#" class="edit"><img title="Bearbeiten" class="icon" src="/static/icons/edit.svg" /></a>
      <a href="#" hidden class="save"><img title="Speichern" class="icon" src="/static/icons/check.svg" /></a>
      <a href="#" hidden class="cancel"><img title="Abbrechen" class="icon" src="/static/icons/x.svg" /></a>
      <a href="#" class="delete"><img title="Löschen" class="icon" src="/static/icons/trash-2.svg" /></a>
    </div>
  </div>
% endfor
<h3>Weiterbildungen:</h3>
<div class="list-header list-trainings-employee">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>Status</div>
</div>
% for training in participations:
  <div data-training-id="${training['id']}" class="list-row list-trainings-employee">
    <input disabled name="title" value="${training['title'] | h}"></input>
    <input disabled name="desc" value="${training['desc'] | h}"></input>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"></input>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"></input>
    <%
      from datetime import date
      can_be_cancelled = date.fromisoformat(training['date_from']) > date.today() and selected == 1
    %>
    <input disabled value="${training['status'] | status}"></input>
  </div>
% endfor
<div></div>
