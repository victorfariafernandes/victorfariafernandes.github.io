<script lang="ts">
	import { t } from '$lib/stores/locale.store';
	import { SocialBadge } from '$lib/components/atoms';

	const socialLinks = [
		{ platform: 'linkedin' as const, href: 'https://linkedin.com/in/victorfariafernandes', ariaLabel: 'LinkedIn' },
		{ platform: 'github' as const, href: 'https://github.com/victorfariafernandes', ariaLabel: 'GitHub' },
		{ platform: 'lattes' as const, href: 'https://lattes.cnpq.br/9451661177927960', ariaLabel: 'Lattes' }
	];
</script>

<section
	class="mx-auto flex max-w-7xl flex-col items-start gap-8 px-container py-section md:flex-row md:items-center md:justify-between"
>
	<div class="flex flex-col gap-2">
		<p class="text-lg font-medium text-primary-500">{$t.pages.about.subtitle}</p>
		<h1 class="text-5xl font-bold leading-tight text-primary-300 sm:text-6xl md:text-7xl">{$t.pages.about.name}</h1>
		<p class="text-xl font-medium text-primary-600">{$t.pages.about.role}</p>
	</div>
	<div class="flex flex-row gap-3 md:flex-col">
		{#each socialLinks as link}
			<SocialBadge platform={link.platform} href={link.href} ariaLabel={link.ariaLabel} />
		{/each}
	</div>
</section>
