<%inherit file="layout.mako"/>
<%def name="head()">
##   <script defer src="/static/participate-trainings.js"></script>
</%def>
<%def name="title()">
  Laufende Weiterbildungen
</%def>
<h2>Weiterbildungen:</h2>
<div class="list-header list-participation-trainings">
  <div>Bezeichnung</div>
  <div>Beschreibung</div>
  <div>Von</div>
  <div>Bis</div>
  <div>Teilnehmer</div>
  <div>Aktionen</div>
</div>
% for training in trainings:
  <div data-training-id="${training['id']}" class="list-row list-participation-trainings">
    <input disabled name="title" value="${training['title'] | h}"></input>
    <input disabled name="desc" value="${training['desc'] | h}"></input>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"></input>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"></input>
    <input disabled name="participants" value="${training['participations'] | h}/${training['max_participants'] | h}"></input>
    <div class="actions">
      <a href="/view-training/${training["id"]}" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
</br>