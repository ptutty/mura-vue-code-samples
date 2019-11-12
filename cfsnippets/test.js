Mura(function () {
    var title = 'Confessions Of A Travel Addict';

    Mura.getFeed('content')
        .where()
        .prop('title')
        .isEQ(title)
        .getQuery()
        .then(function (content) {
            content.each(function (item, idx) {
                var filename = item.get('filename');
                console.log(filename);
            });
        })
        .catch(function (err) {
            console.log(err.get('errors'));
        });
});