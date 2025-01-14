<script lang="ts">
	export let data;
</script>

<svelte:head>
  <title>{data.metadata.title} | Acridotheres for Developers</title>
</svelte:head>

<a href="https://github.com/acridotheres/developers/blob/main/src/pages/custom-files/{data.path}.md?plain=1" class="block w-full text-right mt-6" target="_blank">view this page on GitHub</a>

  <h1 class="mt-0">{data.metadata.title}</h1>

    <p>Path: {data.metadata.path}</p>


<svelte:component this={data.content} />

<div class="flex w-full gap-2 border-t border-t-black pt-1">
	<a href="/custom-files" class="grow no-underline block text-center">back to all pages</a>
</div>
