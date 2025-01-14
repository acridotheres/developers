<script lang="ts">
  export let data: { pages: {
    path: string;
    title: string;
    filePath: string;
  }[] };
</script>

<svelte:head>
  <title>List of custom file documentation pages | Acridotheres for Developers</title>
</svelte:head>

<h1>List of custom file documentation pages</h1>

<ul>
  {#each data.pages as page}
    <li>
    <a href="{`/custom-files/${page.path}`}">{page.title} ({page.filePath})</a>
    </li>
  {/each}
</ul>
