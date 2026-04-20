<script lang="ts">
	import Card from 'flowbite-svelte/Card.svelte';
	import { AppBadge, AppButton } from '$lib/components/atoms';
	import type { Project } from '$lib/types';

	interface Props {
		project: Project;
	}

	let { project }: Props = $props();
</script>

<article>
	<Card class="flex h-full flex-col justify-between gap-4">
		<div class="flex flex-col gap-2">
			<h3 class="text-lg font-semibold text-gray-900 dark:text-white">{project.title}</h3>
			<p class="text-sm text-gray-600 dark:text-gray-400">{project.description}</p>
		</div>

		{#if project.tags.length > 0}
			<ul class="flex flex-wrap gap-2" aria-label="Project tags">
				{#each project.tags as tag}
					<li class="list-none">
						<AppBadge color="primary">{tag}</AppBadge>
					</li>
				{/each}
			</ul>
		{/if}

		<div class="flex gap-2">
			{#if project.repoUrl}
				<AppButton
					variant="outline"
					color="primary"
					size="sm"
					href={project.repoUrl}
					target="_blank"
					rel="noopener noreferrer"
					tag="a"
				>
					Repository
				</AppButton>
			{/if}
			{#if project.liveUrl}
				<AppButton
					color="primary"
					size="sm"
					href={project.liveUrl}
					target="_blank"
					rel="noopener noreferrer"
					tag="a"
				>
					Live
				</AppButton>
			{/if}
		</div>
	</Card>
</article>
