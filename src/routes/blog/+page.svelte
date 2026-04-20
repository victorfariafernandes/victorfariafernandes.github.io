<script lang="ts">
	import { page } from '$app/stores';
	import { SeoHead } from '$lib/components/atoms';
	import { SITE_URL } from '$lib/config/site';
	import { BlogPostCard, SectionTitle } from '$lib/components/molecules';
	import { t } from '$lib/stores/locale.store';
	import type { PageProps } from './$types';

	const { data }: PageProps = $props();
</script>
<SeoHead
	title={$t.pages.blog.title}
	description={$t.seo.blogDescription}
	canonicalUrl={`${SITE_URL}${$page.url.pathname}`}
	siteName={$t.seo.siteName}
/>

<main class="mx-auto max-w-7xl px-container py-section">
	<SectionTitle>{$t.pages.blog.title}</SectionTitle>
	<ul class="mt-8 grid grid-cols-1 gap-6 sm:grid-cols-2" aria-label={$t.pages.blog.title}>
		{#each data.posts as post (post.uid)}
			<li class="list-none">
				<BlogPostCard {post} />
			</li>
		{/each}
	</ul>
</main>
