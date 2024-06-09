<script lang="ts">
	export let data;
</script>

<svelte:head>
	<title>{data.metadata.name} archive format | Acridotheres for Developers</title>
</svelte:head>

<h1>{data.metadata.name} archive format</h1>

<table>
	<tr>
		<th>Developer</th>
		<td><a href="{data.metadata.website ?? '#'}">{data.metadata.developer}</a></td>
	</tr>
	<tr>
		<th>Common file extensions</th>
		<td>{data.metadata.extensions.map(ext => '.' + ext).join(', ')}</td>
	</tr>
</table>

<svelte:component this={data.content} />
