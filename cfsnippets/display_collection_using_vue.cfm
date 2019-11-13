<cfoutput>
<script>
Mura(function (m) {
  m.loader()
    .loadjs(
      'https://cdn.jsdelivr.net/npm/vue/dist/vue.js',
      m.themepath + '/templates/cfsnippets/js/content_query_vue.js',
      function () {
        new Vue({
          el: '##vueApp',
          data: {
            selectedCat: {},
            fullArticle: {},
            articlesCollection: [],
            categories: []
          },
          async mounted() {
            // load all categories that are children of "News Categories"
            let options = {};
            options.entity = 'category';
            options.prop = 'parentid';
            options.isEQ = '43200780-0AEF-4B00-9ACB684EF337D491';
            options.fields = ['name', 'categoryid'];
            options.sortby = {
              'property': 'name',
              'direction': 'asc'
            };
            this.categories = await getMuraFeed(options);
          },
          methods: {
            displayFullArticle(item) {
              this.fullArticle = item;
            },
            async loadArticlesbyCategory() {
              let options = {};
              options.entity = 'content';
              options.prop = 'categoryid';
              options.isEQ = this.selectedCat.categoryid;
              options.fields = ['title', 'summary', 'images', 'body'];
              options.sortby = {
                'property': 'title',
                'direction': 'desc'
              };
              this.articlesCollection = await getMuraFeed(options);
            }
          }
        })
      }); // end loader callback
}); // end mura onload function
</script>

<style>
.card-body > img {float: left}
</style>

  <div id="vueApp">
    <div class="row">
      <div class="col-md-12 mb-4">
      <h2>Select a Category</h2>
    <select v-model="selectedCat" @change="loadArticlesbyCategory">
      <option v-for="category in categories" v-bind:value="category" >
        {{ category.name }}
      </option>
    </select>
  </div>

      <div class="col-md-6">
        <h2>Blog Articles in {{ selectedCat.name }}</h2>
        <div v-for="item in articlesCollection">
          <div class="card mb-2">
            <div class="card-body"><img class="m-2" v-bind:src="item.images.medium" />
              <h3 class="mt-2 mb-3"><a href="">{{ item.title }}</a></h3>
              <h4> {{ item.lastupdate }} </h4>

             

              <p>{{ item.summary }}</p>
               <button class="mt-2 mb-3" @click="displayFullArticle(item)">Read more</button>
              <small>{{ item.lastupdateby }}</small>
            </div>
          </div>
        </div>
      </div>

      <div class="col-md-6">
        <h2>Full article</h2>
        <h3 class="mt-2 mb-3">{{ fullArticle.title }}</h3>
        <h4>{{ fullArticle.lastupdate }}</h4>
        <p>{{ fullArticle.body }}</p>
        <small>{{ fullArticle.lastupdateby }}</small>
      </div>

    </div>

  </div>

</cfoutput>