export async function load() {
	const pages = import.meta.glob('/src/pages/cli/*.svx', { eager: true }) as Record<
		string,
		{
			metadata: {
        title: string;
        order: number;
			};
		}
	>;
	const keys = Object.keys(pages);
	const pageList = keys.map((key) => {
		const page = {
      title: pages[key].metadata.title,
      order: pages[key].metadata.order,
			path: key.split('/').at(-1)?.replace('.svx', '') as string,
		};
		return page;
	});
	return { pages: pageList };
}
