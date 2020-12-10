<%inherit file="layout.mako"/>
<%!
  from app.model.participation import render_status as status
%>
<%def name="head()">
  <script defer src="/static/participation-employee.js"></script>
</%def>
<%def name="title()">
  Teilname Mitarbeiter
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
<br/>
<h2>Weiterbildungen:</h2>
<div class="list-header list-participation-trainings">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>Status</div>
  <div>Aktionen</div>
</div>
% for training in trainings_assigned:
  <div data-training-id="${training['id']}" class="list-row list-participation-trainings">
    <input disabled name="title" value="${training['title'] | h}"></input>
    <input disabled name="desc" value="${training['desc'] | h}"></input>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"></input>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"></input>
    <% selected = participations[training['id']] %>
    <%
      from datetime import date
      can_be_cancelled = date.fromisoformat(training['date_from']) > date.today() and selected == 1
    %>
    <input disabled value="${selected | status}"></input>
    % if can_be_cancelled:
      <a href="#" class="cancel">Stonieren</a>
    % endif
  </div>
% endfor
<br/>
<h2>Training hinzufügen:</h2>
<div class="list-header list-participation-employees-action">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>Aktionen</div>
</div>
% for training in trainings_available:
  <div data-training-id="${training['id']}" class="list-row list-participation-employees-action">
    <input disabled name="title" value="${training['title'] | h}"></input>
    <input disabled name="desc" value="${training['desc'] | h}"></input>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"></input>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"></input>
    <div class="actions">
      <a href="#" class="add">Teilnehmen</a>
    </div>
  </div>
% endfor
