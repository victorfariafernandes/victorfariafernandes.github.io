<script lang="ts">
	interface Props {
		isLast?: boolean;
	}

	let { isLast = false }: Props = $props();
</script>

<div class="relative h-full w-full">
	<div class="absolute inset-y-0 left-1/2 w-1.5 -translate-x-1/2 {isLast ? 'bg-transparent' : 'bg-primary-200'}"></div>
	<div class="absolute left-1/2 top-0 z-10 h-3.5 w-3.5 -translate-x-1/2 rounded-full bg-primary-200"></div>
</div>
