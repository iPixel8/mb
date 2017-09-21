var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
var monthNamesShort = [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];

$(function () {
  // Programs
  $.getJSON('https://api.myjson.com/bins/5bdb3', function(Programs) {
    $('#charts').html(Handlebars.render($("#program-template").html(),Programs));

    
    
    // Graph Data
    $.each(Programs,function(index){
      
      // Get data for Details
      $.getJSON('https://api.myjson.com/bins/47axv', function(ProgramDetails) {
        
        //$(detailsID).html(Handlebars.render($(detailsID).html(),ProgramDetails));
      });
      
      
      var chart = c3.generate({
        bindto: '#graph-'+Programs[index].ProgramID,
        size: {
          height: 150
        },

        title: {
          text: 'Sales by month',
          position: 'left'
        },
        data: {
          x:'x',
                
          json: {
            x: ['2017-01-01', '2017-02-01', '2017-03-01', '2017-04-01', '2017-05-01', '2017-06-01', '2017-07-01'],
            CurrentYear: Programs[index].Sales.CurrentYear,
            PreviousYear: Programs[index].Sales.PreviousYear
          },
          type: 'bar',
          colors: {
              CurrentYear: '#CCBCDD',
              PreviousYear: '#B6D8B9'
          }
        },
        bar: {
          width: 8,
          space: 0.15
        },
        legend: {
          hide: true
        },
        axis: {
          x: {
            type: 'timeseries',
            tick: {
              format: function (x) { return (monthNamesShort[x.getMonth()]); },
              fit: false,
              outer: false,
              inner: false
            }
          },
          y: {
            show: false
          }
        },
        tooltip: {
        format: {
            title: function (d) { return (monthNames[d.getMonth()]); },
            value: function (v) {
                var format = d3.format("$,f");
                return format(v);
            }
//            value: d3.format(',') // apply this format to both y and y2
        }
    }
  
      }); // End Generate
    
    });
   
  
  });
});
Handlebars.registerPartial('ProgramDetails','ProgramID = {{ProgramID}}');
HandlebarsIntl.registerWith(Handlebars);
Handlebars.render = Handlebars.render || function(tmpl, data){data = data || {}; return Handlebars.compile(tmpl)(data);};

