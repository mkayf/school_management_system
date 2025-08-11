<script setup>
import AspectRatio from "@/components/ui/aspect-ratio/AspectRatio.vue";
import { User, School, LibraryBig } from "lucide-vue-next";
import { Button } from "@/components/ui/button";
import { dashboardStats, newStudents } from "@/services/dashboardService";
import { onMounted, ref } from "vue";

const stats = ref();
const newStudentsData = ref();

const fetchStats = async () => {
    try{
        const response = await dashboardStats();
        if(!response.data.success){
            console.log(response.data.message);
            return;
        }
        stats.value = response.data;
    }
    catch(e){
        console.log(e)
    }

}

const fetchNewStudents = async () => {
    try {
        const response = await newStudents();     
        if(!response.data.success){
            console.log(response.data.message);
            return;
        }
        newStudentsData.value = response.data.data;
    } catch (e) {
        console.log(e)
    }
}

onMounted(() => {
    fetchStats();
    fetchNewStudents();
})


</script>

<template>
    <div class="pb-5 px-5">
        <h1 class="text-4xl font-semibold mb-5">Dashboard</h1>
        <div class="flex justify-center items-center gap-5">
            <div
                class="h-50 w-full border-1 rounded-md bg-white flex flex-col justify-center p-8"
            >
                <div class="flex flex-col gap-3">
                    <User class="inline size-6" />
                    <h2 class="text-2xl font-semibold">Total students</h2>
                    <p class="text-2xl" v-if="stats">{{ stats.total_students }}</p>
                    <div v-else class="animate-spin rounded-full h-6 w-6 border-l-2 border-b-2 border-r-2 border-black"></div>
                </div>
            </div>
            <div
                class="h-50 w-full border-1 rounded-md bg-white flex flex-col justify-center p-8"
            >
                <div class="flex flex-col gap-3">
                    <School class="inline size-6" />
                    <h2 class="text-2xl font-semibold">Total Classrooms</h2>
                    <p class="text-2xl" v-if="stats">{{ stats.total_classrooms }}</p>
                    <div v-else class="animate-spin rounded-full h-6 w-6 border-l-2 border-b-2 border-r-2 border-black"></div>
                </div>
            </div>
            <div
                class="h-50 w-full border-1 rounded-md bg-white flex flex-col justify-center p-8"
            >
                <div class="flex flex-col gap-3">
                    <LibraryBig class="inline size-6" />
                    <h2 class="text-2xl font-semibold">Total Subjects</h2>
                    <p class="text-2xl" v-if="stats">{{ stats.total_subjects }}</p>
                    <div v-else class="animate-spin rounded-full h-6 w-6 border-l-2 border-b-2 border-r-2 border-black"></div>
                </div>
            </div>
        </div>

        <div class="mt-8">
            <div class="flex justify-between">
                <h2 class="text-2xl font-semibold mb-6">Recently Admitted Students</h2>
                <Button to="/add-student">Add student</Button>
            </div>
            <table v-if="newStudentsData" class="min-w-full divide-y divide-gray-200 rounded-md border-1">
                <!-- Table Header -->
                <thead class="bg-gray-50 rounded-md">
                    <tr>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Email</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Class</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Section</th>
                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                    </tr>
                </thead>
                
                <!-- Table Body -->
                <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Row 1 -->
                    <tr class="hover:bg-gray-50" v-for="student in newStudentsData" :key="student.id">
                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{{ student.id }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ student.name }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ student.email }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ student.classroom.name }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ student.classroom.section }}</td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            <Button :to="`/manage-student/${student.id}`">Manage</Button>
                        </td>
                    </tr>
                    

                </tbody>
            </table>
            <h2 v-else class="text-2xl text-center font-semibold">No new students to show.</h2>
        </div>

    </div>
</template>
