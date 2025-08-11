<script setup>
import { ref, reactive, onMounted, watch } from "vue";
import { createNewClassroom, getClassroom } from "@/services/classroomService";
import { useRoute, useRouter } from "vue-router";

const mode = ref("add");

const route = useRoute();
const router = useRouter();

watch(() => route, (newRoute, oldRoute) => {
    if(newRoute.meta.mode){
        mode.value = newRoute.meta.mode
    }
}, {immediate: true, deep: true});

const initialState = {
    name: "",
    section: "",
};

const classroomData = reactive({ ...initialState });

const fetchClassroomToManage = async () => {
    if(mode.value === 'manage'){
        try{
            const response = await getClassroom(route.params.id);
            if(!response.data.success){
                console.log(response.data.message);
            }
            const data = response.data.data;

            classroomData.name = data.name;
            classroomData.section = data.section;
        }
        catch(e){
            console.log(e);
        }
    }
}

const handleSubmit = async (e) => {
    e.preventDefault();

    // Add classroom:
    try {
        const response = await createNewClassroom(classroomData);
        if (!response.data.success) {
            console.log(response.data.message);
            return;
        }
        alert(response.data.message);
        Object.assign(classroomData, initialState);
    } catch (e) {
        console.log(e);
    }
};

onMounted(() => {
    fetchClassroomToManage();
})

</script>

<template>
    <div class="w-full max-w-md pb-5 px-5">
        <div class="mb-10">
            <h1 class="text-3xl md:text-4xl font-semibold text-gray-900 mb-2">
                {{mode === 'add' ? 'Create classroom' : 'Manage classroom'}}
            </h1>
            <p class="text-gray-600">{{ mode === 'add' ? 'Add your classroom details here' : 'Organize your classroom efficiently.' }}</p>
        </div>

        <div class="bg-white rounded-xl border-1 p-6 md:p-8">
            <form @submit="handleSubmit" class="space-y-6">
                <!-- Classroom Name -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Classroom Name</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-chalkboard"></i>
                        </div>
                        <input
                            v-model="classroomData.name"
                            type="text"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            placeholder="e.g. Computer Lab"
                            required
                        />
                    </div>
                </div>

                <!-- Section -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Section</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-layer-group"></i>
                        </div>
                        <input
                            v-model="classroomData.section"
                            type="text"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            placeholder="e.g. A, B, or Morning"
                            required
                        />
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="mt-8 flex gap-2">
                    <button
                        v-if="mode === 'add'"
                        type="submit"
                        class="w-full bg-gray-900 text-white font-medium py-3 px-6 rounded-lg hover:bg-gray-800 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center"
                    >
                        <i class="fas fa-plus-circle mr-2"></i> Create Classroom
                    </button>
                    <button
                        v-if="mode === 'manage'"
                        type="button"
                        class="w-full bg-blue-900 text-white font-medium py-3 px-6 rounded-lg hover:bg-blue-800 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center"
                    >
                        <i class="fa-solid fa-pen"></i> Update
                    </button>
                    <button
                        v-if="mode === 'manage'"
                        type="button"
                        class="w-full bg-red-800 text-white font-medium py-3 px-6 rounded-lg hover:bg-red-700 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center"
                    >
                        <i class="fas fa-plus-circle mr-2"></i> Delete
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
