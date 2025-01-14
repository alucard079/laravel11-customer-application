<script setup>
import AuthenticatedLayout from '@/Layouts/AuthenticatedLayout.vue';
import { useForm, Head } from '@inertiajs/vue3';
import InputLabel from '@/Components/InputLabel.vue';
import TextInput from '@/Components/TextInput.vue';
import PrimaryButton from '@/Components/PrimaryButton.vue';
import Link from '@/Components/Link.vue';

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
});
</script>

<template>
    <Head title="View User" />

    <AuthenticatedLayout>
        <template #header>
            <div class="flex gap-2 items-center">
                <Link
                href="users.index"
                >
                    Back
                </Link>
                <h2 class="text-xl font-semibold leading-tight text-gray-800">
                    View User
                </h2>
            </div>
        </template>
        <div class="py-12">
            <div class="mx-auto max-w-7xl sm:px-6 lg:px-8">
                <div class="bg-white shadow sm:rounded-lg p-6">
                    <form>
                        <!-- First Name -->
                        <div class="mb-4">
                            <InputLabel for="firstname" value="First Name" />
                            <TextInput
                                id="firstname"
                                placeholder="First Name"
                                type="text"
                                v-model="form.firstname"
                                class="mt-1 block w-full pointer-events-none"
                            />
                        </div>

                        <!-- Last Name -->
                        <div class="mb-4">
                            <InputLabel for="lastname" value="Last Name" />
                            <TextInput
                                id="lastname"
                                placeholder="Last Name"
                                type="text"
                                v-model="form.lastname"
                                class="mt-1 block w-full pointer-events-none"
                            />
                        </div>

                        <!-- Email -->
                        <div class="mb-4">
                            <InputLabel for="email" value="Email" />
                            <TextInput
                                id="email"
                                type="email"
                                placeholder="Email"
                                v-model="form.email"
                                class="mt-1 block w-full pointer-events-none"
                                readonly
                            />
                        </div>

                        <!-- Contact Number -->
                        <div class="mb-4">
                            <InputLabel for="contact_number" value="Contact Number" />
                            <TextInput
                                id="contact_number"
                                placeholder="Contact Number"
                                type="text"
                                v-model="form.contact_number"
                                class="mt-1 block w-full pointer-events-none"
                                readonly
                            />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </AuthenticatedLayout>
</template>