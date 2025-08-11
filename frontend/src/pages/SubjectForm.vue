<script setup>
    import {reactive, onMounted} from 'vue';
    import { addNewSubject } from '@/services/subjectService';

    const initialState = {
        name: '',
    };

    const subjectData = reactive({...initialState});

    const handleSubmit = async (e) => {
        e.preventDefault();

        // Add subject:
        try {
            const response = await addNewSubject(subjectData);
            if(!response.data.success){
                console.log(response.data.message);
                return;
            }
            alert(response.data.message);
            Object.assign(subjectData, initialState);
        } catch (e) {
            console.log(e)
        }
    }
</script>

<template>
    <div class="w-full max-w-md pb-5 px-5">
        <div class="mb-10">
            <h1 class="text-3xl md:text-4xl font-semibold text-gray-900 mb-2">Add Subject</h1>
            <p class="text-gray-600">Register new subjects to the curriculum</p>
        </div>
        
        <div class="bg-white rounded-xl border-1 p-6 md:p-8">
            <form @submit="handleSubmit" class="space-y-6">
                <!-- Subject Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Subject Name</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500">
                            <i class="fas fa-book"></i>
                        </div>
                        <input v-model="subjectData.name" type="text" class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent" placeholder="e.g. Mathematics, English" required>
                    </div>
                </div>
                
                <!-- Submit Button -->
                <div class="mt-8">
                    <button type="submit" class="w-full bg-gray-900 text-white font-medium py-3 px-6 rounded-lg hover:bg-gray-800 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center">
                        <i class="fas fa-plus-circle mr-2"></i> Add Subject
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>