<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import { Head, router } from '@inertiajs/vue3';
import Link from '@/Components/Link.vue';
import { useToast } from 'vue-toast-notification';

defineProps({
    users : {
        type: Array,
    },
});

const toast = useToast();

const handleDelete = (user_id) => {
    router.delete(route('users.destroy', user_id), {
        preserveScroll: true,
        onSuccess: () => {
            toast.success('User deleted successfully!', { duration: 3000, type: 'success', position: 'top-right' });
        },
        onError: () => {
            toast.error('Failed to delete user!', { duration: 3000, type: 'error', position: 'top-right' });
        }
    });
};

</script>

<template>
    <Head title="Users" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex justify-between">
                <h2
                    class="text-xl font-semibold leading-tight text-gray-800"
                >
                    Users
                </h2>
                <Link
                    href="users.create"
                >
                    CREATE USER
                </Link>
            </div>
        </template>

        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div class="card bg-base-100 shadow-md">
                    <div class="overflow-x-auto">
                        <table class="table table-zebra">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="user in users" :key="user.id">
                                    <td>{{ user.firstname + ' ' + user.lastname}}</td>
                                    <td>{{ user.email }}</td>
                                    <td>
                                        <div class="flex gap-2"> 
                                            <PrimaryButton
                                                :disabled="user.id === $page.props.auth.user.id"
                                                color="red"
                                                @click="handleDelete(user.id)"
                                            >
                                                Delete
                                            </PrimaryButton>
                                            <Link
                                                color="blue"
                                                href="users.show"
                                                :params="{ id: user.id }"
                                            >
                                                View
                                            </Link>
                                            <Link
                                                color="green"
                                                href="users.edit"
                                                :params="{ id: user.id }"
                                            >
                                                Edit
                                            </Link>
                                        </div>
                                    </td>
                                </tr>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>
