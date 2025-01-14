import { error } from '@sveltejs/kit';

export async function load({ params }) {
	try {
		const content = await import(`$p/custom-files/${params.page}.md`);

		return {
			content: content.default,
			metadata: content.metadata as {
				title: string;
				path: string;
			},
			path: params.page
		};
	} catch {
		error(404, 'Not Found');
	}
}
