<script lang="ts">
  export let data: { pages: {
    path: string;
    title: string;
    order: number;
  }[] };
</script>

<svelte:head>
  <title>List of CLI documentation pages | Acridotheres for Developers</title>
</svelte:head>

<h1>List of CLI documentation pages</h1>

<ul>
  {#each data.pages.sort((a, b) => a.order - b.order) as page}
    <li>
      <a href="{`/cli/${page.path}`}">{page.order}. {page.title}</a>
    </li>
  {/each}
</ul>
