<script setup>
    import {ref, reactive, onMounted} from 'vue';
    import { addNewClassroom } from '@/services/classroomService';

    const initialState = {
        name: '',
        section: ''
    };

    const classroomData = reactive({...initialState});

    const handleSubmit = () => {
        
    }
</script>

<template>
    <div class="w-full max-w-md pb-5 px-5">
        <div class=" mb-10">
            <h1 class="text-3xl md:text-4xl font-semibold text-gray-900 mb-2">Create Classroom</h1>
            <p class="text-gray-600">Add new classrooms to the system</p>
        </div>
        
        <div class="bg-white rounded-xl border-1 p-6 md:p-8">
            <form @submit="handleSubmit" class="space-y-6">
                <!-- Classroom Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Classroom Name</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500">
                            <i class="fas fa-chalkboard"></i>
                        </div>
                        <input type="text" class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent" placeholder="e.g. Computer Lab" required>
                    </div>
                </div>
                
                <!-- Section -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Section</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500">
                            <i class="fas fa-layer-group"></i>
                        </div>
                        <input type="text" class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent" placeholder="e.g. A, B, or Morning" required>
                    </div>
                </div>
                
                <!-- Submit Button -->
                <div class="mt-8">
                    <button type="submit" class="w-full bg-gray-900 text-white font-medium py-3 px-6 rounded-lg hover:bg-gray-800 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center">
                        <i class="fas fa-plus-circle mr-2"></i> Create Classroom
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>