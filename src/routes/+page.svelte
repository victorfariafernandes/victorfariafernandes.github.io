<script lang="ts">
	import { SeoHead } from '$lib/components/atoms';
	import { SITE_URL } from '$lib/config/site';
	import { t } from '$lib/stores/locale.store';
	import { page } from '$app/stores';
	import { HeroSection, AboutSection, ExperienceSection, EducationSection } from '$lib/components/organisms';
</script>
<SeoHead
	title={$t.pages.about.title}
	description={$t.seo.aboutDescription}
	canonicalUrl={`${SITE_URL}${$page.url.pathname}`}
	siteName={$t.seo.siteName}
/>

<main>
	<HeroSection />
	<AboutSection />
	<ExperienceSection />
	<EducationSection />
</main>
