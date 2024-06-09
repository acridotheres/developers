<script lang="ts">
  export let data: { pages: {
    name: string;
    developer: string;
    path: string;
    extensions: string[];
  }[] };
</script>

<h1>List of documented formats</h1>

{#each data.pages as page}
  <a href="/formats/{page.path}" id="{page.path}" class="block p-4 border border-black rounded-lg no-underline bg-white hover:bg-neutral-100 mt-4">
    <h3 class="text-2xl font-medium">{page.name}<span class="text-lg pl-2 text-neutral-400">by {page.developer}</span></h3>
    <p class="mt-2">
      {#each page.extensions as extension}
        <span class="inline-block bg-neutral-200 p-1 leading-4 rounded-lg mr-1">.{extension}</span>
      {/each}
    </p>
  </a>
{/each}