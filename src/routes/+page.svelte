<script>
	import { count, isDark, increment, decrement, toggleTheme } from '@output/Counter';
</script>

<div class={$isDark ? 'dark' : ''}>
	<div
		class="relative flex min-h-screen items-center justify-center overflow-hidden bg-gradient-to-br from-slate-100 to-slate-200 p-4 transition-colors duration-500 ease-in-out sm:p-6 dark:from-slate-900 dark:to-slate-950"
	>
		<div
			class="absolute top-1/4 left-1/4 h-64 w-64 animate-pulse rounded-full bg-indigo-300/30 blur-3xl dark:bg-indigo-900/20"
		></div>

		<button
			on:click={toggleTheme}
			class="absolute top-6 right-6 cursor-pointer rounded-full bg-white/50 p-3 text-slate-600 shadow-sm ring-1 ring-slate-900/5 backdrop-blur-sm transition-all hover:bg-white dark:bg-slate-800/50 dark:text-slate-300 dark:ring-white/10 dark:hover:bg-slate-700"
			aria-label="Toggle Dark Mode"
		>
			{#if $isDark}
				<svg
					xmlns="http://www.w3.org/2000/svg"
					width="20"
					height="20"
					viewBox="0 0 24 24"
					fill="none"
					stroke="currentColor"
					stroke-width="2"
					stroke-linecap="round"
					stroke-linejoin="round"
					><circle cx="12" cy="12" r="5" /><path d="M12 1v2" /><path d="M12 21v2" /><path
						d="M4.22 4.22l1.42 1.42"
					/><path d="M18.36 18.36l1.42 1.42" /><path d="M1 12h2" /><path d="M21 12h2" /><path
						d="M4.22 19.78l1.42-1.42"
					/><path d="M18.36 5.64l1.42-1.42" /></svg
				>
			{:else}
				<svg
					xmlns="http://www.w3.org/2000/svg"
					width="20"
					height="20"
					viewBox="0 0 24 24"
					fill="none"
					stroke="currentColor"
					stroke-width="2"
					stroke-linecap="round"
					stroke-linejoin="round"><path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z" /></svg
				>
			{/if}
		</button>

		<div
			class="relative w-full max-w-xs rounded-3xl border border-white/20 bg-white/80 p-6 shadow-2xl shadow-slate-200/50 backdrop-blur-xl transition-all duration-300 sm:max-w-sm sm:p-8 dark:border-white/5 dark:bg-slate-900/80 dark:shadow-black/50"
		>
			<div class="mb-8 text-center sm:mb-10">
				<h1
					class="mb-4 text-[10px] font-bold tracking-[0.25em] text-slate-400 uppercase sm:text-xs dark:text-slate-500"
				>
					Purescript + SvelteKit Counter
				</h1>

				<div class="relative inline-block">
					<div
						class="text-6xl leading-none font-black tracking-tight text-slate-800 tabular-nums drop-shadow-sm sm:text-7xl dark:text-white"
					>
						{$count}
					</div>
				</div>
			</div>

			<div class="grid grid-cols-2 gap-3 sm:gap-4">
				<button
					class="group flex cursor-pointer touch-manipulation items-center justify-center rounded-2xl bg-slate-100 px-4 py-3 text-base font-bold text-slate-600 ring-1 ring-slate-900/5 transition-all duration-200 ring-inset hover:bg-slate-200 active:scale-95 sm:px-6 sm:py-4 sm:text-lg dark:bg-slate-800 dark:text-slate-300 dark:ring-white/5 dark:hover:bg-slate-700"
					on:click={decrement}
				>
					<span class="mr-2 transition-transform group-hover:-translate-x-0.5">−</span> Dec
				</button>

				<button
					class="group flex cursor-pointer touch-manipulation items-center justify-center rounded-2xl bg-gradient-to-r from-indigo-500 to-indigo-600 px-4 py-3 text-base font-bold text-white shadow-lg shadow-indigo-500/30 transition-all duration-200 hover:-translate-y-0.5 hover:shadow-indigo-500/50 active:translate-y-0 active:scale-95 sm:px-6 sm:py-4 sm:text-lg dark:from-indigo-600 dark:to-indigo-700 dark:shadow-indigo-900/50"
					on:click={increment}
				>
					Inc <span class="ml-2 transition-transform group-hover:translate-x-0.5">+</span>
				</button>
			</div>
		</div>
	</div>
</div>
