<script lang="ts">
	import { page } from '$app/stores';
	import { SectionHeading, AppButton, SeoHead } from '$lib/components/atoms';
	import { SITE_URL } from '$lib/config/site';
	import { t } from '$lib/stores/locale.store';
</script>
<SeoHead
	title={$t.error.title}
	description={$t.seo.errorDescription}
	canonicalUrl={`${SITE_URL}/404`}
	siteName={$t.seo.siteName}
	noIndex={true}
/>

<main class="mx-auto flex max-w-7xl flex-col items-center px-container py-section text-center">
	<p class="mb-2 text-6xl font-bold text-primary-600">{$page.status}</p>
	<SectionHeading>{$t.error.title}</SectionHeading>
	<p class="mb-8 mt-2 text-gray-500">{$t.error.message}</p>
	<AppButton href="/">{$t.error.back}</AppButton>
</main>
