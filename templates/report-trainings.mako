<%inherit file="layout.mako"/>
<%def name="title()">
  Weiterbildungen Auswertung
</%def>
<h2>Weiterbildungen:</h2>
% for training in trainings:
  <div>
    <label>${training['title'] | h}:</label>
    % for employee in training['participants']:
        <div class="report-training">
            ${employee['name'] | h} ${employee['surname'] | h}
        </div>
    % endfor
  </div>
% endfor