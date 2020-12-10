<%inherit file="layout.mako"/>
<%!
  from app.model.participation import render_status as status
%>
<%def name="title()">
  Mitarbeiter Auswertung
</%def>
<h2>Mitarbeiter:</h2>
% for employee in employees:
  <div>
    <label>${employee['name'] | h} ${employee['surname'] | h}:</label>
    % for training in employee['trainings']:
        <div class="report">
          ${training['title'] | h} von <input disabled value="${training['date_from'] | h}" type="date" /> bis <input disabled value="${training['date_to'] | h}" type="date" /> | ${training['status'] | status}
        </div>
    % endfor
  </div>
% endfor
