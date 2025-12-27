import { writable, get, derived } from 'svelte/store';

export const createStoreImpl = (initialState) => (reducer) => {
	const store = writable(initialState);

	const runUpdate = (action) => {
		store.update((s) => {
			const step1 = reducer(s);
			const newState = step1(action);
			return newState;
		});
		return get(store);
	};

	return {
		store,
		dispatchJS: (action) => {
			return runUpdate(action);
		},
		dispatch: (action) => () => {
			return runUpdate(action);
		}
	};
};

export const useStore = (storeBundle) => (selector) => {
	if (!storeBundle || !storeBundle.store) {
		return derived([], () => {});
	}

	return derived(storeBundle.store, ($s) => {
		const result = selector($s);
		return result;
	});
};

export const readStoreImpl = (store) => () => {
	return get(store);
};
