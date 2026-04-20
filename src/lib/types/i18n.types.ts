import type { ExperienceItem, EducationItem } from './portfolio.types';

export type Locale = 'en' | 'pt';

export interface Translations {
	seo: {
		siteName: string;
		defaultDescription: string;
		aboutDescription: string;
		blogDescription: string;
		errorDescription: string;
	};
	nav: {
		about: string;
		blog: string;
		experience: string;
		education: string;
		contact: string;
		toggleMenu: string;
	};
	pages: {
		about: { name: string; subtitle: string; role: string; title: string; content: string };
		blog: { title: string };
		experience: { title: string; items: ExperienceItem[] };
		education: { title: string; items: EducationItem[] };
	};
	error: {
		title: string;
		message: string;
		back: string;
	};
}
