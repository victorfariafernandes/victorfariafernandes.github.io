<script lang="ts">
	import { t } from '$lib/stores/locale.store';
	import { SectionTitle } from '$lib/components/molecules';
</script>

<section id="about-me" class="mx-auto flex max-w-7xl flex-col gap-12 px-container py-section md:flex-row md:items-center">

	<!-- Placeholder portrait -->
	<div class="w-full shrink-0 md:w-95">
		<div class="relative pb-3 pr-3">
			<div class="relative z-10 flex aspect-3/4 w-full items-center justify-center bg-secondary-800">
				<svg xmlns="http://www.w3.org/2000/svg" class="h-1/2 w-1/2 text-secondary-600" viewBox="0 0 24 24" fill="currentColor">
					<path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 2.4c-3.2 0-9.6 1.6-9.6 4.8v2.4h19.2v-2.4c0-3.2-6.4-4.8-9.6-4.8z"/>
				</svg>
			</div>
		</div>
	</div>

	<!-- Text content -->
	<div class="flex flex-col gap-6">
		<SectionTitle>{$t.pages.about.title}</SectionTitle>

		{#each $t.pages.about.content.split('\n\n') as paragraph}
			<p class="font-bold leading-relaxed text-secondary-300">{paragraph}</p>
		{/each}
	</div>

</section>
