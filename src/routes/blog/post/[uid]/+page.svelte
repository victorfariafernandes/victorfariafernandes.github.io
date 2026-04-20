<script lang="ts">
	import { page } from '$app/stores';
	import type { BlogPost } from '$lib/types';
	import type { PageProps } from './$types';
	import { SectionHeading, AppBadge, SeoHead } from '$lib/components/atoms';
	import { SITE_URL } from '$lib/config/site';
	import { t } from '$lib/stores/locale.store';

	let { data }: PageProps = $props();
	const post = $derived(data.post as BlogPost);
</script>
<SeoHead
	title={post.title}
	description={post.description || $t.seo.blogDescription}
	canonicalUrl={`${SITE_URL}${$page.url.pathname}`}
	siteName={$t.seo.siteName}
	type="article"
	imageUrl={post.imageUrl}
/>

<main>
	<article class="mx-auto max-w-3xl px-4 py-10">
		<header>
			{#if post.imageUrl}
				<div class="relative mb-8 overflow-hidden rounded-xl">
					<img src={post.imageUrl} alt={post.title} class="h-80 w-full object-cover" />
					<div class="absolute inset-0 bg-linear-to-t from-black/70 to-transparent"></div>
					<div class="absolute bottom-0 left-0 p-6">
						<h1 class="text-3xl font-bold text-white">{post.title}</h1>
						{#if post.description}
							<p class="mt-1 text-base text-gray-200">{post.description}</p>
						{/if}
					</div>
				</div>
			{:else}
				<SectionHeading>{post.title}</SectionHeading>
				{#if post.description}
					<p class="mt-3 text-lg text-gray-600 dark:text-gray-400">{post.description}</p>
				{/if}
			{/if}
		</header>

		{#if post.tags.length}
			<ul class="mt-4 flex flex-wrap gap-2" aria-label="Tags">
				{#each post.tags as tag}
					<li class="list-none">
						<AppBadge>{tag}</AppBadge>
					</li>
				{/each}
			</ul>
		{/if}

		{#if post.content}
			<div class="prose mt-8 max-w-none text-white dark:prose-invert">
				{@html post.content}
			</div>
		{/if}
	</article>
</main>
