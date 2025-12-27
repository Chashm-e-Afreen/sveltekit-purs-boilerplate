import type { Writable, Readable } from "svelte/store";

/** * The bridge object containing the Svelte store and dispatchers.
 * S = State, A = Action
 */
export interface StoreBundle<S, A> {
  /** The raw Svelte writable store */
  store: Writable<S>;
  /** Direct dispatch for Svelte components (returns new state) */
  dispatchJS: (action: A) => S;
  /** Effectful dispatch for PureScript logic (returns a thunk) */
  dispatch: (action: A) => () => S;
}

/** Creates the Store Bundle from PureScript */
export function createStoreImpl<S, A>(
  initialState: S,
): (reducer: (s: S) => (a: A) => S) => StoreBundle<S, A>;

/** * A Svelte-side helper to select a slice of state.
 * Returns a derived store that only triggers on changes to that slice.
 */
export function useStore<S, A, R>(
  storeBundle: StoreBundle<S, A>,
): (selector: (s: S) => R) => Readable<R>;

/** A thunk to read the current state of a store from PS */
export function readStoreImpl<S>(store: Writable<S> | Readable<S>): () => S;
