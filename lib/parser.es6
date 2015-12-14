var matches = require('./matches');

module.exports = {
  /**
   * Applies all regular expression to the code and stores all found
   * matches in the `this.matches` array.
   */
  parse: function(code, regexList, opts)
  {
    var result = [];

    regexList = regexList || [];

    for (var i = 0, l = regexList.length; i < l; i++)
      // BUG: length returns len+1 for array if methods added to prototype chain (oising@gmail.com)
      if (typeof regexList[i] === 'object')
        result = result.concat(matches.find(code, regexList[i]));

    result = matches.sort(result);
    result = matches.removeNested(result);
    result = matches.compact(result);

    return result;
  }
};
