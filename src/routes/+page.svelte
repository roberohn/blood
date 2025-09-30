<script>
	import PictorialFraction from '$lib/components/PictorialFraction.svelte';

	let donationsMade;
	let milestone;
	let ratio;

	donationsMade = 11;
	milestone = 15;

	ratio = donationsMade / milestone;
</script>

<div class="flex h-screen w-screen items-center justify-center">
	<PictorialFraction width={264.5} height={264.5} {ratio} />
	<p class="text-gray-50">{donationsMade}/{milestone} donations in 3rd milestone</p>
</div>
