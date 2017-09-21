Handlebars.registerHelper('each_when', function(list, k, v, opts) {
    var i, result = '';
    for(i = 0; i < list.length; ++i)
      try{
        if(list[i][k] == v)
            result = result + opts.fn(list[i]);
      }catch(err){}
    return result;
});