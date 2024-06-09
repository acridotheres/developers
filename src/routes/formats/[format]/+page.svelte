<script lang="ts">
	export let data;
</script>

<svelte:head>
	<title>{data.metadata.name} archive format | Acridotheres for Developers</title>
</svelte:head>

<a href="https://github.com/acridotheres/developers/blob/main/src/pages/formats/{data.path}.svx?plain=1" class="block w-full text-right mt-6" target="_blank">view this page on GitHub</a>

<h1 class="mt-0">{data.metadata.name} archive format</h1>

<table>
	<tr>
		<th>Developer</th>
		<td><a href="{data.metadata.website ?? '#'}">{data.metadata.developer}</a></td>
	</tr>
	<tr>
		<th>Common file extensions</th>
		<td>{data.metadata.extensions.map(ext => '.' + ext).join(', ')}</td>
	</tr>
	<tr>
		<th>Endianness</th>
		<td>{data.metadata.endianness ? data.metadata.endianness + ' endian' : 'unknown'}</td>
	</tr>
</table>

<svelte:component this={data.content} />
