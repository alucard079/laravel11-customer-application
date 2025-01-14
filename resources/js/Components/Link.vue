<script setup>
import { Link } from '@inertiajs/vue3';
import { computed } from 'vue';

const props = defineProps({
    href: {
        type: String,
        required: true,
    },
    params: {
        type: Object,
        default: () => ({}),
    },
    color: {
        type: String,
        default: 'green',
        validator: (value) => ['green', 'blue', 'red'].includes(value),
    },
});

const { href, params, color } = props;

const colorClass = computed(() => {
    const baseClasses =
        'inline-flex items-center justify-center rounded-md disabled:opacity-50 px-4 py-2 text-xs font-semibold uppercase tracking-widest text-white transition duration-150 ease-in-out focus:outline-none focus:ring-2 focus:ring-offset-2';
    const colorClasses = {
        green: 'bg-green-800 hover:bg-green-700 focus:bg-green-700 focus:ring-green-500 active:bg-green-900',
        blue: 'bg-blue-800 hover:bg-blue-700 focus:bg-blue-700 focus:ring-blue-500 active:bg-blue-900',
        red: 'bg-red-800 hover:bg-red-700 focus:bg-red-700 focus:ring-red-500 active:bg-red-900',
    };
    return `${baseClasses} ${colorClasses[color]}`;
});

</script>

<template>
    <Link
        :class="colorClass"
        :href="route(href, params)"
    >
        <slot />
    </Link>
</template>