<%inherit file="layout.mako"/>
<%def name="head()">
  <script defer src="/static/index.js"></script>
</%def>
<%def name="title()">
  Startseite
</%def>
<h2>Mitarbeiter - Statistiken</h2>
<div class="counter-box">
  <span class="counter" data-goal="${employees}"></span>
  <span class="counter" data-goal="${trainings}"></span>
  <span class="counter" data-goal="${participations}"></span>
  <span>Mitarbeiter</span>
  <span>Weiterbildungen</span>
  <span>Teilnahmen</span>
</div>
