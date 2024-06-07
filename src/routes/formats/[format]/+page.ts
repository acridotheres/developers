import { error } from '@sveltejs/kit';

export async function load({ params }) {
	try {
		const content = await import(`$p/formats/${params.format}.svx`);

		return {
			content: content.default,
			metadata: content.metadata as {
        name: string;
				developer: string;
				website?: string;
        extensions: string[];
      }
		};
	} catch {
		error(404, 'Not Found');
	}
}
