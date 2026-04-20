<script lang="ts">
	import { TimelineTrack } from '$lib/components/molecules';
	import type { TimelineItem } from '$lib/types';

	interface Props {
		items: TimelineItem[];
		orientation?: 'left-right' | 'right-left';
	}

	let { items, orientation = 'left-right' }: Props = $props();
</script>

<div class="mt-12 grid gap-x-4 {orientation === 'left-right' ? 'grid-cols-[max-content_2rem_1fr]' : 'grid-cols-[1fr_2rem_max-content]'}">
	{#each items as item, i (item.id)}
		{@const isLast = i === items.length - 1}

		{#if orientation === 'left-right'}
			<div class="pt-0.5 text-right">
				<span class="whitespace-nowrap text-sm font-bold text-secondary-300">{item.date}</span>
			</div>
		{:else}
			<div class="flex flex-col gap-1 pb-10">
				<h3 class="font-bold text-secondary-50">{item.title}</h3>
				<p class="text-sm font-semibold text-primary-500">{item.subtitle}</p>
				{#if item.content}
					<p class="mt-1 text-sm leading-relaxed text-secondary-400">{item.content}</p>
				{/if}
			</div>
		{/if}

		<TimelineTrack {isLast} />

		{#if orientation === 'left-right'}
			<div class="flex flex-col gap-1 pb-10">
				<h3 class="font-bold text-secondary-50">{item.title}</h3>
				<p class="text-sm font-semibold text-primary-500">{item.subtitle}</p>
				{#if item.content}
					<p class="mt-1 text-sm leading-relaxed text-secondary-400">{item.content}</p>
				{/if}
			</div>
		{:else}
			<div class="pt-0.5 text-left">
				<span class="whitespace-nowrap text-sm font-bold text-secondary-300">{item.date}</span>
			</div>
		{/if}

	{/each}
</div>
