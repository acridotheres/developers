import { error } from '@sveltejs/kit';

export async function load({ params }) {
	try {
		const content = await import(`$p/formats/${params.format}.md`);

		return {
			content: content.default,
			metadata: content.metadata as {
        name: string;
				developer: string;
				website?: string;
        extensions: string[];
				endianness?: string;
      },
			path: params.format
		};
	} catch {
		error(404, 'Not Found');
	}
}
