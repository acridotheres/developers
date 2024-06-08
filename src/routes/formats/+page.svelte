<script lang="ts">
  export let data: { pages: {
    name: string;
    developer: string;
    path: string;
    extensions: string[];
  }[] };
</script>

{#each data.pages as page}
  <a href="/formats/{page.path}" id="{page.path}">
    <h3>{page.name} <span>by {page.developer}</span></h3>
    <p>
      {#each page.extensions as extension}
        <span>{extension}</span>
      {/each}
    </p>
  </a>
{/each}