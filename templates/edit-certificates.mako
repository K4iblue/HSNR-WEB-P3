<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/edit-certificates.js"></script>
</%def>
<%def name="title()">
  Zertifikate Pflege
</%def>
<h2>Zertifikate:</h2>
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
      <a href="#" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
</br>
<h2>Zertifikat hinzufügen:</h2>
<div class="list-header list-certificates">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Bereichtigt zu</div>
  <div></div>
</div>
<div class="active list-row list-certificates">
  <input name="title"></input>
  <input name="desc"></input>
  <input name="qualifies"></input>
  <div class="actions">
    <a href="#" class="add">Hinzufügen</a>
  </div>
</div>
