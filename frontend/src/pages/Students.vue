<script setup>
import { Button } from "@/components/ui/button";
import { getAllStudents } from "@/services/studentService";
import { onMounted, ref } from "vue";

const studentsData = ref([]);

const fetchStudents = async () => {
    try {
        const response = await getAllStudents();
        if (!response.data.success) {
            console.log(response.data.message);
            return;
        }
        studentsData.value = response.data.data;
    } catch (e) {
        console.log(e);
    }
};

onMounted(() => {
    fetchStudents();
});
</script>

<template>
    <div class="pb-5 px-5">
        <div class="flex justify-between">
            <h1 class="text-4xl font-semibold mb-5">Students</h1>
            <Button to="/add-student">Add student</Button>
        </div>
        <div class="mt-8">
            <table
                class="min-w-full divide-y divide-gray-200 rounded-md border-1"
            >
                <!-- Table Header -->
                <thead class="bg-gray-50 rounded-md">
                    <tr>
                        <th
                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                            ID
                        </th>
                        <th
                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                            Name
                        </th>
                        <th
                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                            Email
                        </th>
                        <th
                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                            Class
                        </th>
                        <th
                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                            Section
                        </th>
                        <th
                            class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider"
                        >
                            Actions
                        </th>
                    </tr>
                </thead>

                <!-- Table Body -->
                <tbody class="bg-white divide-y divide-gray-200">
                    <!-- Row 1 -->
                    <tr
                        class="hover:bg-gray-50"
                        v-for="student in studentsData"
                        :key="student.id"
                    >
                        <td
                            class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900"
                        >
                            {{ student.id }}
                        </td>
                        <td
                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                        >
                            {{ student.name }}
                        </td>
                        <td
                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                        >
                            {{ student.email }}
                        </td>
                        <td
                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                        >
                            {{ student.classroom?.name ?? "N/A" }}
                        </td>
                        <td
                            class="px-6 py-4 whitespace-nowrap text-sm text-gray-500"
                        >
                            {{ student.classroom?.section ?? "N/A" }}
                        </td>
                        <td class="px-6 py-4 whitespace-nowrap text-sm">
                            <Button :to="`/manage-student/${student.id}`"
                                >Manage</Button
                            >
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
