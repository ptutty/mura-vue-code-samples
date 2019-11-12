<cfoutput>
<script>
Mura(function(m) {
    m.loader()
        .loadjs(
            'https://cdn.jsdelivr.net/npm/vue/dist/vue.js',
            m.themepath + '/templates/cfsnippets/js/content_query_vue.js',
            function() { 
              /* 
               * 1. load all category data from MURA, and use as data model for option select.
               * 2. users selects a category - load all pages with that category ID, populate an option select
               * 3. user selects a page - display page information   
               * 
              */

              new Vue({
                el: '##vueApp',
                data: {
                  selected: "",
                  pagesByCategory: [],
                  categories: [],
                  page: {}
                },
                async mounted() {
                  // load all categories that are child of "News Categories" category
                  var newsCatID = '43200780-0AEF-4B00-9ACB684EF337D491';
                  this.categories = await getMuraFeed("category", 'parentid', newsCatID);
                },
                methods: {
                  async loadCategoryPages(event) {
                      var id =  event.target.value;
                      this.pagesByCategory = await getMuraFeed("content", 'categoryid', id);
                      console.log(this.pagesByCategory);
                  },
                   loadPageDetail(event) {
                      this.page = JSON.parse(event.target.value);
                  },
                }
              })
            }); // end loader callback
}); // end mura onload function
</script>


  <div id="vueApp">
    <h2>Select a Category</h2>
    <select v-model="selected" @change="loadCategoryPages">
      <option v-for="category in categories" v-bind:value="category.name" >
        {{ category.name }}
      </option>
    </select>


    <h2>Articles in category: {{ selected }}</h2>
    
      <div class="row"  >
        <div v-for="page in pagesByCategory" class="col-md-4">
				<div class="card text-center">
					<div class="card-body"><img v-bind:src="page.images.small" />
						<h2 class="mt-2 mb-3">{{ page.title }}</h2>

						 <p>{{ page.summary }}</p>
					</div>
				</div>
      </div>
    </div>
  </div>
  </div>

</cfoutput>