<%inherit file="layout.mako"/>
<%def name="title()">
  Laufende Weiterbildungen
</%def>
<h2>Laufende Weiterbildungen:</h2>
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
    <input disabled name="title" value="${training['title'] | h}"/>
    <input disabled name="desc" value="${training['desc'].replace("\n", " ") | h}"/>
    <input disabled name="data_from" type="date" value="${training['date_from'] | h}"/>
    <input disabled name="date_to" type="date" value="${training['date_to'] | h}"/>
    <input disabled name="participants" value="${training['participations'] | h}/${training['max_participants'] | h}"/>
    <div class="actions">
      <a href="/participation-training/${training["id"]}" class="display"><img title="Anzeigen" class="icon" src="/static/icons/search.svg" /></a>
    </div>
  </div>
% endfor
<div></div>
