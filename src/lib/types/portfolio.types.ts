export interface Project {
	id: string;
	title: string;
	description: string;
	tags: string[];
	repoUrl?: string;
	liveUrl?: string;
	imageUrl?: string;
	featured: boolean;
}

export interface TimelineItem {
	id: string;
	date: string;
	title: string;
	subtitle: string;
	content?: string;
}

export interface ExperienceItem extends TimelineItem {
	content: string;
}

export interface EducationItem extends TimelineItem {}

export interface BlogPost {
	uid: string;
	title: string;
	description: string;
	imageUrl?: string;
	content?: string;
	tags: string[];
	// Opaque Prismic slice data — consumed by <SliceZone> at render time
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	slices: any[];
}
