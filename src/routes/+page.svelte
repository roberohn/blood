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
</script>

<div class="grid h-screen grid-cols-1 items-center justify-items-center gap-4 md:grid-cols-3">
	<div class="flex flex-col items-center gap-4">
		<PictorialFraction {width} {height} donationsMade={0} milestone={1} />
		<p class="text-gray-50">Registered | 1st milestone</p>
	</div>
	<div class="flex flex-col items-center gap-4">
		<PictorialFraction {width} {height} donationsMade={1} milestone={1} />
		<p class="text-gray-50">1/1 donations | 2nd milestone</p>
	</div>
	<div class="flex flex-col items-center gap-4">
		<PictorialFraction {width} {height} donationsMade={5} milestone={5} />
		<p class="text-gray-50">5/5 donations | 3rd milestone</p>
	</div>
	<div class="flex flex-col items-center gap-4">
		<PictorialFraction {width} {height} donationsMade={10} milestone={10} />
		<p class="text-gray-50">10/10 donations | 4th milestone</p>
	</div>
	<div class="flex flex-col items-center gap-4">
		<PictorialFraction {width} {height} {donationsMade} milestone={15} />
		<p class="text-gray-50">{donationsMade}/15 donations | 5th milestone</p>
	</div>
	<div class="flex flex-col items-center gap-4">
		<PictorialFraction {width} {height} {donationsMade} milestone={40} />
		<p class="text-gray-50">{donationsMade}/40 donations | 6th milestone</p>
	</div>
</div>
