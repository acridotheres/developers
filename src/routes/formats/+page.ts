export async function load() {
	const pages = import.meta.glob('/src/pages/formats/*.md', { eager: true }) as Record<
		string,
		{
			metadata: {
        name: string;
        developer: string;
				extensions: string[];
			};
		}
	>;
	const keys = Object.keys(pages);
	const pageList = keys.map((key) => {
		const page = {
      name: pages[key].metadata.name,
      developer: pages[key].metadata.developer,
			path: key.split('/').at(-1)?.replace('.md', '') as string,
			extensions: pages[key].metadata.extensions
		};
		return page;
	});
	return { pages: pageList };
}
