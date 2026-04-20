<script lang="ts">
	import { locale } from '$lib/stores/locale.store';

	interface Props {
		title: string;
		description: string;
		canonicalUrl: string;
		siteName: string;
		type?: 'website' | 'article';
		imageUrl?: string;
		twitterCard?: 'summary' | 'summary_large_image';
		noIndex?: boolean;
	}

	let {
		title,
		description,
		canonicalUrl,
		siteName,
		type = 'website',
		imageUrl,
		twitterCard = 'summary_large_image',
		noIndex = false
	}: Props = $props();

	const fullTitle = $derived(`${title} | ${siteName}`);
	const ogLocale = $derived($locale === 'pt' ? 'pt_BR' : 'en_US');
</script>

<svelte:head>
	<title>{fullTitle}</title>
	<meta name="description" content={description} />
	<link rel="canonical" href={canonicalUrl} />
	<meta property="og:type" content={type} />
	<meta property="og:site_name" content={siteName} />
	<meta property="og:title" content={fullTitle} />
	<meta property="og:description" content={description} />
	<meta property="og:url" content={canonicalUrl} />
	<meta property="og:locale" content={ogLocale} />
	{#if imageUrl}
		<meta property="og:image" content={imageUrl} />
	{/if}
	<meta name="twitter:card" content={twitterCard} />
	<meta name="twitter:title" content={fullTitle} />
	<meta name="twitter:description" content={description} />
	{#if imageUrl}
		<meta name="twitter:image" content={imageUrl} />
	{/if}
	{#if noIndex}
		<meta name="robots" content="noindex, nofollow" />
	{/if}
</svelte:head>
