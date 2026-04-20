import { SITE_URL } from '$lib/config/site';
import { createClient } from '$lib/prismicio';
import type { RequestHandler } from './$types';

export const prerender = true;

const STATIC_ROUTES = ['/', '/blog'];

const escapeXml = (value: string): string =>
	value
		.replaceAll('&', '&amp;')
		.replaceAll('<', '&lt;')
		.replaceAll('>', '&gt;')
		.replaceAll('"', '&quot;')
		.replaceAll("'", '&apos;');

export const GET: RequestHandler = async () => {
	const client = createClient();
	const posts = await client.getAllByType('post', { lang: 'en-us' });

	const postRoutes = posts
		.map((post) => post.uid)
		.filter((uid): uid is string => Boolean(uid))
		.map((uid) => `/blog/post/${uid}`);

	const routes = [...new Set([...STATIC_ROUTES, ...postRoutes])];
	const urls = routes
		.map((route) => {
			const path = route === '/' ? '' : route;
			return `  <url>\n    <loc>${escapeXml(`${SITE_URL}${path}`)}</loc>\n  </url>`;
		})
		.join('\n');

	const sitemap = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urls}\n</urlset>\n`;

	return new Response(sitemap, {
		headers: {
			'Content-Type': 'application/xml; charset=utf-8',
			'Cache-Control': 'max-age=0, s-maxage=3600'
		}
	});
};
