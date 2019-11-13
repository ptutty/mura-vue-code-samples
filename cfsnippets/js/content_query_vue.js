/* Generic function for loading entity in Mura.js  */

/**
 * @param {object} options
 * @param {string} options.entity - mura bean type i.e. content/category/user
 * @param {string} options.prop - property to search on
 * @param {string} options.isEQ - value to match
 * @param {array} options.fields - fields to get back in collection
 * @param {int} [options.maxitems] - optional  max number items in collection
 * @param {object} [options.sortby=] - optional with default sort option property and direction
 */
async function getMuraFeed(options) {
    if (!options.sortby) {
        options.sortby = {
            'property': 'lastupdateby',
            'direction': 'asc'
        };
    }
    var dataQuery = await Mura.getFeed(options.entity)
        .where()
        .prop(options.prop)
        .isEQ(options.isEQ)
        .sort(options.sortby.property, options.sortby.direction)
        .maxItems(options.maxitems)
        .fields(options.fields.toString())
        .getQuery()
        .then(function (collection) {
            return collection.getAll().items
        })
        .catch(function (err) {
            console.log(err);
        });
    console.log(dataQuery);
    return dataQuery
}