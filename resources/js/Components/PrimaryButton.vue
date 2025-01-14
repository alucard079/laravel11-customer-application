<script setup>
import { computed, defineProps } from 'vue';

const props = defineProps({
    color: {
        type: String,
        default: 'green',
        validator: (value) => ['green', 'blue', 'red'].includes(value),
    },
});

const { color } = props;

const buttonClass = computed(() => {
    const baseClasses =
        'inline-flex items-center rounded-md border border-transparent disabled:opacity-50 px-4 py-2 text-xs font-semibold uppercase tracking-widest text-white transition duration-150 ease-in-out focus:outline-none focus:ring-2 focus:ring-offset-2';
    const colorClasses = {
        green: 'bg-green-800 hover:bg-green-700 focus:bg-green-700 focus:ring-green-500 active:bg-green-900',
        blue: 'bg-blue-800 hover:bg-blue-700 focus:bg-blue-700 focus:ring-blue-500 active:bg-blue-900',
        red: 'bg-red-800 hover:bg-red-700 focus:bg-red-700 focus:ring-red-500 active:bg-red-900',
    };
    return `${baseClasses} ${colorClasses[color]}`;
});
</script>

<template>
    <button :class="buttonClass">
        <slot />
    </button>
</template>