<script lang="ts">
	import './layout.css';
	import favicon from '$lib/assets/favicon.ico';
	import ThemeProvider from 'flowbite-svelte/ThemeProvider.svelte';
	import { flowbiteTheme } from '$lib/theme';
	import { NavBar } from '$lib/components/organisms';

	let { children } = $props();
</script>

<svelte:head><link rel="icon" href={favicon} /></svelte:head>

<ThemeProvider theme={flowbiteTheme}>
	<div class="min-h-screen bg-secondary-950">
		<NavBar />
		{@render children()}
		<footer class="border-t border-secondary-900 px-container py-6 text-center text-sm text-secondary-500">
			<p>&copy; {new Date().getFullYear()} Victor Faria Fernandes. All rights reserved.</p>
		</footer>
	</div>
</ThemeProvider>
