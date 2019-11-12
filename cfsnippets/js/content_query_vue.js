/* Generic function for loading entity in Mura.js  */

/*
@params 
_entity string
_prop string
_isEQ string
*/
async function getMuraFeed(_entity, _prop, _isEQ) {
    var dataQuery = await Mura.getFeed(_entity)
        .where()
        .prop(_prop)
        .isEQ(_isEQ)
        .getQuery()
        .then(function (data) {
            return data;
        })
        .catch(function (err) {
            console.log(err);
        });
    var dataArray = [];
    dataQuery.each(function (item, idx) {
        var dataItem = item.getAll();
        dataArray.push(dataItem);
    });
    return dataArray;
}