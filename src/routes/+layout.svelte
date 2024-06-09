<script lang="ts">
	import '../styles/global.scss';
</script>

<svelte:head>
	<title>Acridotheres for Developers</title>
</svelte:head>

<header class="bg-black fixed top-0 left-0 w-full h-12 text-white">
	<a href="/" class="size-full flex p-1">
		<img src="/favicon.png" alt="Logo" class="pr-1" />
		<h1 class="flex flex-col justify-center">
			<span class="text-lg font-normal leading-5">Acridotheres</span><span
				class="text-xs italic leading-3">for Developers</span
			>
		</h1>
	</a>
</header>

<main class="mt-12 mx-auto min-h-[calc(100vh-3rem)] article p-2">
	<slot />
</main>

<footer class="bg-black text-white p-1 text-center text-sm">
	<p>&copy; 2024 Acridotheres contributors</p>
</footer>
