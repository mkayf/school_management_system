<script setup>
    import { Button } from '@/components/ui/button';
    import { getAllSubjects } from '@/services/subjectService';
    import {ref, onMounted} from 'vue';

    const subjectsData = ref([]);

    const fetchSubjects = async () => {
        try {
            const response = await getAllSubjects();
            if(!response.data.success){
                console.log(response.data.message);
                return;
            }
            subjectsData.value = response.data.data;
        } catch (e) {
            console.log(e);
        }
    }

    onMounted(() => {
        fetchSubjects();
    })


</script>

<template>
    <div class="pb-5 px-5">
        <div class="flex justify-between">
            <h1 class="text-4xl font-semibold mb-5">Subjects</h1>    
            <Button to="/add-subject">Add subject</Button>
        </div>
        <div class="mt-8">
            <table class="min-w-full divide-y divide-gray-200 rounded-md border-1">
                <!-- Table Header -->
                <thead class="bg-gray-50 rounded-md">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Created_at</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Updated_at</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                
                <!-- Table Body -->
                <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Row 1 -->
                    <tr class="hover:bg-gray-50" v-for="subject in subjectsData">
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ subject.id }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ subject.name }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ subject.created_at }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ subject.updated_at }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            <Button>Manage</Button>
                        </td>
                    </tr>
                    

                </tbody>
            </table>
        </div>
    </div>
</template>