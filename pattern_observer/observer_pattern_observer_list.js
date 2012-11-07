// Generated by CoffeeScript 1.4.0
(function() {
  var ObserverList, extend;

  ObserverList = function() {
    this.observerList = [];
  };

  ObserverList.prototype.Add = function(obj) {
    return this.observerList.push(obj);
  };

  ObserverList.prototype.Empty = function() {
    return this.observerList = [];
  };

  ObserverList.prototype.Count = function() {
    return this.observerList.length;
  };

  ObserverList.prototype.Get = function(index) {
    if (index > -1 && index < this.observerList.length) {
      return this.observerList[index];
    }
  };

  ObserverList.prototype.Insert = function(obj, index) {
    var pointer;
    pointer = -1;
    if (index === 0) {
      this.observerList.unshift(obj);
      pointer = index;
    } else if (index === this.observerList.length) {
      this.observerList.push(obj);
      pointer = index;
    }
    return pointer;
  };

  ObserverList.prototype.IndexOf = function(obj, startIndex) {
    var index, observer, _i, _len, _ref;
    if (startIndex == null) {
      startIndex = 0;
    }
    _ref = this.observerList.slice(startIndex, this.observerList.length);
    for (index = _i = 0, _len = _ref.length; _i < _len; index = ++_i) {
      observer = _ref[index];
      if (obj === observer) {
        return index + startIndex;
      }
    }
    return -1;
  };

  ObserverList.prototype.RemoveAt = function(index) {
    if (index === 0) {
      return this.observerList.shift();
    } else if (index === this.observerList.length - 1) {
      return this.observerList.pop();
    }
  };

  extend = function(obj, extension) {
    var key, value;
    for (key in obj) {
      value = obj[key];
      extension[key] = value;
    }
  };

}).call(this);
