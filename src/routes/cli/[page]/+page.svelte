<script lang="ts">
	export let data;
</script>

<h1>{data.metadata.title}</h1>

<svelte:component this={data.content} />

<div class="flex w-full gap-2 border-t border-t-black pt-1">
	<a
		href={`/cli/${data.metadata.prev}`}
		class="block no-underline opacity-0 {data.metadata.prev ? 'opacity-100' : ''}">&larr;</a
	>
	<a href="/cli" class="grow no-underline block text-center">back to all pages</a>
	<a
		href={`/cli/${data.metadata.next}`}
		class="block no-underline opacity-0 {data.metadata.next ? 'opacity-100' : ''}">&rarr;</a
	>
</div>
