<script>
	import PictorialFraction from '$lib/components/PictorialFraction.svelte';

	let donationsMade;
	let dimension;
	let width;
	let height;

	dimension = 264.5;
	width = dimension;
	height = dimension;

	donationsMade = 12;

	const milestones = [
		{ donationsMade: 0, milestone: 0, label: 'Registered', tier: '1st' },
		{ donationsMade: 1, milestone: 1, label: '1/1 Donations', tier: '2nd' },
		{ donationsMade: 5, milestone: 5, label: '5/5 Donations', tier: '3rd' },
		{ donationsMade: 10, milestone: 10, label: '10/10 Donations', tier: '4th' },
		{
			donationsMade: `${donationsMade}`,
			milestone: 15,
			label: `${donationsMade}/15 Donations`,
			tier: '5th'
		},
		{
			donationsMade: `${donationsMade}`,
			milestone: 40,
			label: `${donationsMade}/40 Donations`,
			tier: '6th'
		}
	];
</script>

<!-- Header -->
<main class="flex h-screen flex-col overflow-hidden bg-zinc-950 px-6 py-8">
	<header class="text-center">
		<p class="mb-1 text-xs tracking-widest text-zinc-500 uppercase">Donation Journey</p>
		<h1 class="text-3xl font-semibold tracking-tight text-zinc-100">Blood Donation Milestones</h1>
	</header>

	<!-- Grid -->
	<div
		class="grid h-screen grid-cols-1 items-center justify-items-center gap-4 text-gray-50 md:grid-cols-3"
	>
		{#each milestones as m (m.tier)}
			{@const complete = m.donationsMade >= m.milestone}
			<div>
				<div class="flex flex-col items-center gap-4">
					<!-- Tier label -->
					<p
						class="mb-3 text-xs tracking-widest uppercase
          {complete ? 'text-amber-500' : 'text-zinc-500'}"
					>
						{m.tier} milestone
					</p>
					<!-- Component -->
					<PictorialFraction
						{width}
						{height}
						donationsMade={m.donationsMade}
						milestone={m.milestone}
					/>

					<!-- Donation label -->
					<p class="pt-2 text-sm font-medium text-zinc-300">{m.label}</p>

					<!-- Status pill -->
					{#if complete}
						<span
							class="rounded-full bg-green-900/30 px-3 py-0.5 text-xs text-green-400 ring-1 ring-green-700/40"
						>
							✓ Achieved
						</span>
					{:else}
						<span
							class="rounded-full bg-zinc-800 px-3 py-0.5 text-xs text-zinc-400 ring-1 ring-zinc-700"
						>
							{m.milestone - m.donationsMade} to go
						</span>
					{/if}
				</div>
			</div>
		{/each}
	</div>
</main>
