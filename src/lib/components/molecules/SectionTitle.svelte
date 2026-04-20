<script lang="ts">
	import type { Snippet } from 'svelte';
	import { SectionHeading } from '$lib/components/atoms';

	interface Props {
		children?: Snippet;
		reversed?: boolean;
	}

	let { children, reversed = false }: Props = $props();
</script>

{#if reversed}
	<div class="flex items-center gap-4">
		<div class="h-1.5 flex-1 rounded-full bg-linear-to-r from-transparent to-primary-500"></div>
		<SectionHeading class="text-secondary-50">{@render children?.()}</SectionHeading>
	</div>
{:else}
	<div class="flex items-center gap-4">
		<SectionHeading class="text-secondary-50">{@render children?.()}</SectionHeading>
		<div class="h-1.5 flex-1 rounded-full bg-linear-to-r from-primary-500 to-transparent"></div>
	</div>
{/if}
