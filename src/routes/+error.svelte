<script lang="ts">
	import { page } from '$app/stores';
</script>

<svelte:head>
	<title>{$page.status} ({$page?.error?.message}) | Acridotheres for Developers</title>
</svelte:head>

<h1>{$page.status} ({$page?.error?.message})</h1>

<p>Go back to <a href="/">home</a>.</p>