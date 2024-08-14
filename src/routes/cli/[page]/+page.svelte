<script lang="ts">
	export let data;
</script>

<a href="https://github.com/acridotheres/developers/blob/main/src/pages/cli/{data.path}.md?plain=1" class="block w-full text-right mt-6" target="_blank">view this page on GitHub</a>

<h1 class="mt-0">{data.metadata.title} | Acridotheres for Developers</h1>

<svelte:component this={data.content} />

<div class="flex w-full gap-2 border-t border-t-black pt-1">
	<a
		href={`/cli/${data.metadata.prev ?? ''}`}
		class="block no-underline opacity-0 {data.metadata.prev ? 'opacity-100' : ''}">&larr;</a
	>
	<a href="/cli" class="grow no-underline block text-center">back to all pages</a>
	<a
		href={`/cli/${data.metadata.next ?? ''}`}
		class="block no-underline opacity-0 {data.metadata.next ? 'opacity-100' : ''}">&rarr;</a
	>
</div>
