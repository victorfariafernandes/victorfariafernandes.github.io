<script lang="ts">
	import { SectionHeading } from '$lib/components/atoms';
	import { BlogPostCard } from '$lib/components/molecules';
	import { t } from '$lib/stores/locale.store';
	import type { PageProps } from './$types';

	const { data }: PageProps = $props();
</script>

<main class="mx-auto max-w-7xl px-container py-section">
	<SectionHeading>{$t.pages.blog.title}</SectionHeading>
	<div class="mt-8 grid grid-cols-1 gap-6 sm:grid-cols-2">
		{#each data.posts as post (post.uid)}
			<BlogPostCard {post} />
		{/each}
	</div>
</main>
