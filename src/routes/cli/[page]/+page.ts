import { error } from '@sveltejs/kit';

export async function load({ params }) {
	try {
		const content = await import(`$p/cli/${params.page}.svx`);

		return {
			content: content.default,
			metadata: content.metadata as {
				title: string;
				order: number;
				prev?: string;
				next?: string;
			}
		};
	} catch {
		error(404, 'Not Found');
	}
}
