import { error } from '@sveltejs/kit';

export async function load({ params }) {
	try {
		const content = await import(`$p/cli/${params.page}.md`);

		return {
			content: content.default,
			metadata: content.metadata as {
				title: string;
				order: number;
				prev?: string;
				next?: string;
			},
			path: params.page
		};
	} catch {
		error(404, 'Not Found');
	}
}
