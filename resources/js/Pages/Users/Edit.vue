<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { useForm, Head } from '@inertiajs/vue3';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import Select from '@/Components/Select.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import InputError from '@/Components/InputError.vue';
import { useToast } from 'vue-toast-notification';
import Link from '@/Components/Link.vue';

const toast = useToast();

const props = defineProps({
    user: {
        type: Object,
        required: true,
    },
});

const { user } = props;

const form = useForm({
    firstname: user.firstname,
    lastname: user.lastname,
    email: user.email,
    contact_number: user.contact_number,
});

const submit = () => {
    form.put(route('users.update', user.id), {
        preserveScroll: true,
        onSuccess: () => {
            toast.success('Customer updated successfully!', { duration: 3000, type: 'success', position: 'top-right' });
        },
        onError: () => {
            toast.error('Failed to update customer!', { duration: 3000, type: 'error', position: 'top-right' });
        }
    });
};
</script>

<template>
    <Head title="Edit Customer" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex gap-2 items-center">
                <Link
                href="users.index"
                >
                    Back
                </Link>
                <h2 class="text-xl font-semibold leading-tight text-gray-800">
                    Edit Customer
                </h2>
            </div>
        </template>
        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div class="bg-white shadow sm:rounded-lg p-6">
                    <form @submit.prevent="submit">
                        <!-- First Name -->
                        <div class="mb-4">
                            <InputLabel for="firstname" value="First Name" />
                            <TextInput
                                id="firstname"
                                type="text"
                                v-model="form.firstname"
                                class="mt-1 block w-full"
                            />
                            <InputError class="mt-2" :message="form.errors.firstname" />
                        </div>

                        <!-- Last Name -->
                        <div class="mb-4">
                            <InputLabel for="lastname" value="Last Name" />
                            <TextInput
                                id="lastname"
                                type="text"
                                v-model="form.lastname"
                                class="mt-1 block w-full"
                            />
                            <InputError class="mt-2" :message="form.errors.lastname" />
                        </div>

                        <!-- Email -->
                        <div class="mb-4">
                            <InputLabel for="email" value="Email" />
                            <TextInput
                                id="email"
                                type="email"
                                v-model="form.email"
                                class="mt-1 block w-full"
                            />
                            <InputError class="mt-2" :message="form.errors.email" />
                        </div>

                        <div class="mb-4">
                            <InputLabel for="contact_number" value="Contact Number" />
                            <TextInput
                                id="contact_number"
                                type="text"
                                v-model="form.contact_number"
                                class="mt-1 block w-full"
                            />
                            <InputError class="mt-2" :message="form.errors.contact_number" />
                        </div>

                        <!-- Submit Button -->
                        <div class="mt-4">
                            <PrimaryButton :class="{ 'opacity-25': form.processing }" :disabled="form.processing">
                                Update Customer
                            </PrimaryButton>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>