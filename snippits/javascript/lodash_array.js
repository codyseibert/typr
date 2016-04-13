var _, array, evens, other, zipped;

_ = require('lodash');

_.chunk(['a', 'b', 'c', 'd'], 2);
// [['a', 'b'], ['c', 'd']]

_.chunk(['a', 'b', 'c', 'd'], 3);
// [['a', 'b', 'c'], ['d']]

_.compact([0, 1, false, 2, '', 3]);
// [1, 2, 3]

array = [1];
other = _.concat(array, 2, [3], [[4]]);
// [1, 2, 3, [4]]

_.difference([3, 2, 1], [4, 2]);
// [3, 1]

_.drop([1, 2, 3], 2);
// [3]

_.dropRight([1, 2, 3]);
// [1, 2]

array = [1, 2, 3];
_.fill(array, 'a');
// ['a', 'a', 'a']

_.findIndex(array, 2);
// 1

_.first(array);
// 1

_.last(array);
// 3

_.flatten([1, [2, [3, [4]], 5]]);
// [1, 2, [3, [4]], 5]

_.indexOf([1, 2, 1, 2], 2);
// 1

_.intersection([2, 1], [4, 2], [1, 2]);
// [2]

_.join(['a', 'b', 'c'], '~');
// 'a~b~c'

array = [1, 2, 3, 1, 2, 3];
_.pull(array, 2, 3);
console.log(array);
// [1, 1]

array = [1, 2, 3, 4];
evens = _.remove(array, function(n) {
  return n % 2 === 0;
});
console.log(array);
// [1, 3]
console.log(evens);
// [2, 4]

array = [1, 2, 3];
_.reverse(array);
// [3, 2, 1]

_.take([1, 2, 3], 2);
// [1, 2]

_.union([2, 1], [4, 2], [1, 2]);
// [2, 1, 4]

_.uniq([2, 1, 2]);
// [2, 1]

zipped = _.zip(['fred', 'barney'], [30, 40], [true, false]);
// [['fred', 30, true], ['barney', 40, false]]

_.unzip(zipped);
// [['fred', 'barney'], [30, 40], [true, false]]

_.without([1, 2, 1, 3], 1, 2);
// [3]
