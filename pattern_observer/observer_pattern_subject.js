// Generated by CoffeeScript 1.4.0
(function() {
  var Subject;

  Subject = function() {
    return this.observers = new ObserverList();
  };

  Subject.prototype.AddObserver = function(observer) {
    return this.observers.Add(observer);
  };

  Subject.prototype.RemoveObserver = function(observer) {
    return this.observers.RemoveIndexAt(this.observers.IndexOf(observer));
  };

  Subject.prototype.Notify = function(context) {
    var index, _i, _ref, _results;
    _results = [];
    for (index = _i = 0, _ref = this.observers.Count(); 0 <= _ref ? _i <= _ref : _i >= _ref; index = 0 <= _ref ? ++_i : --_i) {
      _results.push(this.observers.Get(index).Update(context));
    }
    return _results;
  };

}).call(this);
