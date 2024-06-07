<script lang="ts">
	export let data;
</script>

<h1>{data.metadata.name}</h1>

<svelte:component this={data.content} />
