<script lang="ts">
	import Card from 'flowbite-svelte/Card.svelte';
	import { AppBadge } from '$lib/components/atoms';
	import type { BlogPost } from '$lib/types';

	interface Props {
		post: BlogPost;
	}

	let { post }: Props = $props();
</script>

<article>
	<Card href="/blog/post/{post.uid}" class="flex h-full flex-col gap-0 overflow-hidden p-0!">
		{#if post.imageUrl}
			<div class="h-64 w-full overflow-hidden">
				<img src={post.imageUrl} alt={post.title} class="h-full w-full object-cover" />
			</div>
		{/if}
		<div class="flex flex-col gap-3 p-5">
			<h5 class="text-lg font-semibold text-gray-900 dark:text-white">{post.title}</h5>
			<p class="text-sm text-gray-600 dark:text-gray-400">{post.description}</p>
			{#if post.tags.length > 0}
				<ul class="flex flex-wrap gap-2" aria-label="Post tags">
					{#each post.tags as tag}
						<li class="list-none">
							<AppBadge color="primary">{tag}</AppBadge>
						</li>
					{/each}
				</ul>
			{/if}
		</div>
	</Card>
</article>
