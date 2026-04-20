<script lang="ts">
	import { locale, setLocale, availableLocales, initLocale } from '$lib/stores/locale.store';

	interface Props {
		class?: string;
	}

	let { class: className = '' }: Props = $props();

	initLocale();
</script>

<div class="flex items-center gap-2 {className}">
	{#each availableLocales as l}
		<button
			onclick={() => setLocale(l)}
			class="text-sm transition-colors {$locale === l
				? 'font-semibold text-primary-500'
				: 'font-normal text-secondary-400 hover:text-secondary-600'}"
		>
			{l.toUpperCase()}
		</button>
	{/each}
</div>
