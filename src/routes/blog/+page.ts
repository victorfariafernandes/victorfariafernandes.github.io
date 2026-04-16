import { getAllPosts } from '$lib/data';
import type { PageLoad } from './$types';

export const load: PageLoad = async () => {
	const posts = await getAllPosts();
	return { posts };
};
