<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/edit-qualifications.js"></script>
</%def>
<%def name="title()">
  Qualifikationen Pflege
</%def>
<h2>Qualifikationen:</h2>
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
</br>
<h2>Qualifikation hinzufügen:</h2>
<div class="list-header list-qualifications">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div></div>
</div>
<div class="active list-row list-qualifications">
  <input name="title"></input>
  <input name="desc"></input>
  <div class="actions">
    <a href="#" class="add">Hinzufügen</a>
  </div>
</div>
