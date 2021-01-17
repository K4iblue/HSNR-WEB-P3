% window.setTitle("Weiterbildungen Auswertung")
<h2>Weiterbildungen:</h2>
% trainings.forEach(training => {
  <div>
    <label>${training['title']}:</label>
    % training['participants'].forEach(employee => {
        <div class="report">
            ${employee['name']} ${employee['surname']}
        </div>
    % })
  </div>
% })
