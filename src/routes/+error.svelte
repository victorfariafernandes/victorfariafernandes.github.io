<script lang="ts">
	import { page } from '$app/stores';
	import { SectionHeading, AppButton } from '$lib/components/atoms';
	import { t } from '$lib/stores/locale.store';
</script>

<main class="mx-auto flex max-w-7xl flex-col items-center px-container py-section text-center">
	<p class="mb-2 text-6xl font-bold text-primary-600">{$page.status}</p>
	<SectionHeading>{$t.error.title}</SectionHeading>
	<p class="mb-8 mt-2 text-gray-500">{$t.error.message}</p>
	<AppButton href="/">{$t.error.back}</AppButton>
</main>
