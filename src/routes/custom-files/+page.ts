export async function load() {
	const pages = import.meta.glob('/src/pages/custom-files/*.md', { eager: true }) as Record<
		string,
		{
			metadata: {
        title: string;
        path: string;
			};
		}
	>;
	const keys = Object.keys(pages);
	const pageList = keys.map((key) => {
		console.error(key, pages[key]);
		const page = {
      title: pages[key].metadata.title,
      filePath: pages[key].metadata.path,
			path: key.split('/').at(-1)?.replace('.md', '') as string,
		};
		return page;
	});
	return { pages: pageList };
}
