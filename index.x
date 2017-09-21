<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Urban Yoga | Dashboard</title>
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700" rel="stylesheet">
    <link rel="stylesheet" href="/css/c3.css">
    <link rel="stylesheet" href="/css/app.css">
  </head>
  <body>

  <header>
    <hgroup class="primary">
      <img class="logo" src="assets/logo.png"/>
      <nav class="menu-main">
        <a href="#" class="active">Dashboard</a>
        <a href="#">Sign In</a>
        <a href="#">Classes</a>
        <a href="#">Workshops</a>
        <a href="#">Appointments</a>
        <a href="#">Client Home</a>
        <a href="#">Retail</a>
        <a href="javascript:void(0);" class="icon" onclick="myFunction();">&#9776;</a>
      </nav>
    </hgroup>
    <hgroup class="secondary">
      <nav class="menu-context">
        <!-- Todo: Context menu for each primary menu item -->
        <a href="#">Dashboard</a>
        <a href="#" class="active">Business Overview</a>
        <a href="#">Schedule</a>
        <a href="#">Reports</a>
      </nav>      
    </hgroup>

  </header>
  
  <main>
    
    <section id="programs">
      <aside>
        <a href="#" class="button new">New Program</a>
      </aside>
      <section id="charts">
        Loading data...
        <script id="program-template" type="text/x-handlebars-template">
          {{#each this}}
            {{@key}}
            <article id="Program-{{ProgramID}}" class="program">
              <h2>{{Name}}</h2><a id="edit-{{ProgramID}}" class="edit" href="#"><img src="assets/pencil_icons.png"/></a>
              <figure id="graph-{{ProgramID}}" class="graph"></figure>
              <table class="overview">
                <thead>
                  <tr>
                     <th>Total Monthly</th>
                    <th>Current</th>
                    <th>1-Year</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th>Sales</th>
                    <td>{{formatNumber TotalMonthlySales style="currency" currency="USD"}}</td>
                    <td><img src="assets/spark_line.png"/></td>
                  </tr>
                </tbody>
              </table>
              <div id="Program-{{{ProgramID}}}-Details" class="details">
                {{> ProgramDetails ProgramID=../ProgramID }}
              </div>
              <a href="#" class="toggleDetails">more</a>
            </article>
          {{/each}}
        </script>
      </section>
    </section>
    
  </main>
  <footer>
    
  </footer>
    


    
    

    

    <script src="js/jquery.js"></script>
    <script src="js/d3.js"></script>
    <script src="js/c3.js"></script>
    <script src="js/handlebars.js"></script>
    <script src="js/handlebars-helpers.js"></script>
    <script src="js/handlebars-intl.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
