<script lang="ts">
	export let data;
</script>

<h1>{data.metadata.name}</h1>

{#if data.metadata.copyrighted}
	<div>
		<p>This archive format is copyright protected by its developer, <a href="{data.metadata.website}"> {data.metadata.developer}</a></p>
	</div>
{/if}

<svelte:component this={data.content} />
