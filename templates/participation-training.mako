<%inherit file="layout.mako"/>
<%!
  from app.model.participation import render_status as status
%>
<%def name="head()">
  <script defer src="/static/participation-training.js"></script>
</%def>
<%def name="title()">
  Teilname Training
</%def>
<h2>Training:</h2>
<input hidden name="id" value="${training['id'] | h}"/>
<label>Bezeichnung:</label>
<input disabled name="name" value="${training['title'] | h}"/>
<label>Beschreibung:</label>
<textarea disabled name="desc">${training['desc'] | h}</textarea>
<label>Von:</label>
<input disabled name="date_from" type="date" value="${training['date_from'] | h}"/>
<label>Bis:</label>
<input disabled name="date_to" type="date" value="${training['date_to'] | h}"/>
<label>minimale Teilnehmer:</label>
<input disabled name="min_participants" value="${training['min_participants'] | h}"/>
<label>maximale Teilnehmer:</label>
<input disabled name="max_participants" value="${training['max_participants'] | h}"/>
<br/>
<br/>
<h2>Weiterbildungen:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div>Status</div>
</div>
% for employee in employees_assigned:
  <div data-employee-id="${employee['id']}" class="list-row list-employees">
    <input disabled name="name" value="${employee['name'] | h}"/>
    <input disabled name="surname" value="${employee['surname'] | h}"/>
    <input disabled name="degree" value="${employee['degree'] | h}"/>
    <input disabled name="occupation" value="${employee['occupation'] | h}"/>
    <% selected = participations[employee['id']] %>
    <%
      from datetime import date
      can_be_edited = date.fromisoformat(training['date_from']) > date.today() and selected == 1
    %>
    <select>
      % for s in [1,2,3,4,5]:
        <option ${selected == s and "selected" or ""} value="${s}">${s | status}</option>
      % endfor
    </select>
  </div>
% endfor
<br/>
<h2>Mitarbeiter hinzufügen:</h2>
<div class="list-header list-employees">
  <div>Name</div>
  <div>Nachname</div>
  <div>Akademischer Grad</div>
  <div>Beschäftigung</div>
  <div>Status</div>
</div>
% for employee in employees_available:
  <div data-employee-id="${employee['id']}" class="list-row list-employees">
    <input disabled name="name" value="${employee['name'] | h}"/>
    <input disabled name="surname" value="${employee['surname'] | h}"/>
    <input disabled name="degree" value="${employee['degree'] | h}"/>
    <input disabled name="occupation" value="${employee['occupation'] | h}"/>
    <div class="actions">
      <a href="#" class="add">Teilnehmen</a>
    </div>
  </div>
% endfor
