<script setup>
import { getAllClassrooms } from "@/services/classroomService";
import { addNewStudent, getStudent, updateStudent, deleteStudent } from "@/services/studentService";
import { getAllSubjects } from "@/services/subjectService";
import { ref, onMounted, reactive, watch } from "vue";
import { useRoute, useRouter } from "vue-router";

const mode = ref("add");

const route = useRoute();
const router = useRouter();
// watch the route mode to add or update student data:

watch(
    () => route,
    (newRoute, oldroute) => {
        if (newRoute.meta.mode) {
            mode.value = newRoute.meta.mode;
        }
    },
    { deep: true, immediate: true }
);
 
const classroomsData = ref([]);
const subjectsData = ref([]);

const initialState = {
    name: "",
    email: "",
    phone_number: "",
    DOB: "",
    address: "",
    classroom_id: "",
    subject_ids: [],
};

const studentData = reactive({ ...initialState });

const fetchClassrooms = async () => {
    try {
        const response = await getAllClassrooms();
        if (!response.data.success) {
            console.log(response.data.message);
            return;
        }
        classroomsData.value = response.data.data;
    } catch (e) {
        console.log(e);
    }
};

const fetchSubjects = async () => {
    try {
        const response = await getAllSubjects();
        if (!response.data.success) {
            console.log(response.data.message);
            return;
        }
        subjectsData.value = response.data.data;
    } catch (e) {
        console.log(e);
    }
};

// fetch specific student data to manage:

const fetchStudentToManage = async () => {
    if (mode.value === "manage") {
        try {
            const response = await getStudent(route.params.id);
            if (!response.data.success) {
                console.log(response.data.message);
            }
            const data = response.data.data;

            // assign values coming from backend:
            studentData.name = data.student.name;
            studentData.email = data.student.email;
            studentData.phone_number = data.profile.phone_number;
            studentData.DOB = data.profile.DOB;
            studentData.address = data.profile.address;
            studentData.classroom_id = data.student.classroom_id;
            studentData.subject_ids = data.subjects.map(
                (subject) => subject.id
            );

        } catch (e) {
            console.log(e);
        }
    }
};
const handleSubmit = async (e) => {
    e.preventDefault();

    // Add student:
    if (mode.value === "add") {
        try {
            const response = await addNewStudent(studentData);
            if (!response.data.success) {
                console.log(response.data.message);
                return;
            }
            alert(response.data.message);
            Object.assign(studentData, initialState);
        } catch (e) {
            console.log(e);
        }

        return;
    }

    // Update student:
    try{
        const response = await updateStudent(route.params.id, studentData);
        if (!response.data.success) {
            console.log(response.data.message);
            return;    
        }
        alert(response.data.message);
    }
    catch(e){
        console.log(e);
    }

};

const handleDelete = async () => {
    try{
        const response = await deleteStudent(route.params.id);
        if (!response.data.success) {
            console.log(response.data.message);
            return;    
        }
        alert(response.data.message);
        router.push('/students');
    }
    catch(e){
        console.log(e);
    }
}

onMounted(() => {
    fetchStudentToManage();
    fetchClassrooms();
    fetchSubjects();
});
</script>

<template>
    <div class="w-full max-w-3xl pb-5 px-5">
        <div class="mb-10">
            <h1 class="text-4xl font-semibold text-gray-900 mb-2">
                {{ mode === "add" ? "Student registration" : "Manage student" }}
            </h1>
            <p class="text-gray-600 max-w-lg">
                {{
                    mode === "add"
                        ? "All fields are required for complete enrollment."
                        : "Effortlessly Track and Manage Your Students"
                }}
            </p>
        </div>
        <div class="bg-white rounded-xl border-1 p-6 md:p-8">
            <form
                @submit="handleSubmit"
                class="grid grid-cols-1 md:grid-cols-2 gap-6"
            >
                <!-- Personal Information Section -->
                <div class="md:col-span-2">
                    <h2
                        class="text-xl font-semibold text-gray-900 mb-4 pb-2 border-b border-gray-200"
                    >
                        Personal Information
                    </h2>
                </div>

                <!-- Name Field -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Full Name</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-user"></i>
                        </div>
                        <input
                            v-model="studentData.name"
                            type="text"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            placeholder="Ali Raza"
                            name="student_name"
                            required
                        />
                    </div>
                </div>

                <!-- Email Field -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Email Address</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-envelope"></i>
                        </div>
                        <input
                            v-model="studentData.email"
                            type="email"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            placeholder="aliraza@example.com"
                            name="student_email"
                            required
                        />
                    </div>
                </div>

                <!-- Phone Number Field -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Phone Number</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-phone"></i>
                        </div>
                        <input
                            v-model="studentData.phone_number"
                            type="tel"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            placeholder="03XX-XXXXXXX"
                            name="student_phone_number"
                            required
                        />
                    </div>
                </div>

                <!-- Date of Birth Field -->
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Date of Birth</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-calendar"></i>
                        </div>
                        <input
                            v-model="studentData.DOB"
                            type="date"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            name="student_DOB"
                            required
                        />
                    </div>
                </div>

                <!-- Address Field -->
                <div class="md:col-span-2">
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Address</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 pt-3 pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <textarea
                            v-model="studentData.address"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent"
                            rows="3"
                            placeholder="123 Main Street, Karachi, Sindh"
                            name="student_address"
                            required
                        ></textarea>
                    </div>
                </div>

                <!-- Academic Information Section -->
                <div class="md:col-span-2 mt-6">
                    <h2
                        class="text-xl font-semibold text-gray-900 mb-4 pb-2 border-b border-gray-200"
                    >
                        Academic Information
                    </h2>
                </div>

                <!-- Classroom Select -->
                <div class="">
                    <label class="block text-sm font-medium text-gray-700 mb-1"
                        >Classroom</label
                    >
                    <div class="relative">
                        <div
                            class="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-door-open"></i>
                        </div>
                        <select
                            v-model="studentData.classroom_id"
                            class="pl-10 w-full rounded-lg border border-gray-300 px-4 py-3 focus:outline-none focus:ring-2 focus:ring-gray-800 focus:border-transparent appearance-none bg-white"
                            name="student_classroom"
                        >
                            <option selected disabled>
                                Select a classroom and section
                            </option>
                            <option
                                v-for="classroom in classroomsData"
                                :key="classroom.id"
                                :value="classroom.id"
                            >
                                {{ classroom.name }}, Section:
                                {{ classroom.section }}
                            </option>
                        </select>
                        <div
                            class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none text-gray-500"
                        >
                            <i class="fas fa-chevron-down"></i>
                        </div>
                    </div>
                </div>

                <!-- Subjects Checkboxes -->
                <div class="md:col-span-2">
                    <label class="block text-sm font-medium text-gray-700 mb-3"
                        >Subjects</label
                    >
                    <div
                        class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4"
                    >
                        <label
                            class="flex items-center space-x-2 cursor-pointer"
                            v-for="subject in subjectsData"
                            :key="subject.id"
                        >
                            <input
                                v-model="studentData.subject_ids"
                                type="checkbox"
                                name="subject_ids[]"
                                :value="subject.id"
                                class="rounded border-gray-300 text-gray-800 focus:ring-gray-800"
                            />
                            <span class="text-gray-700">{{
                                subject.name
                            }}</span>
                        </label>
                    </div>
                </div>

                <!-- Submit Button -->
                <div class="md:col-span-2 mt-8" v-if="mode === 'add'">
                    <button
                        type="submit"
                        class="w-full bg-gray-900 text-white font-medium py-3 px-6 rounded-lg hover:bg-gray-800 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center"
                    >
                        <i class="fas fa-user-plus mr-2"></i> Register Student
                    </button>
                </div>
                <div class="flex gap-4 mt-8" v-if="mode === 'manage'">
                    <button
                        type="submit"
                        class="gap-3 cursor-pointer w-full bg-blue-900 text-white font-medium py-3 px-6 rounded-lg hover:bg-blue-800 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center"
                    >
                        <i class="fa-solid fa-pen"></i> Update
                    </button>
                    <button
                        @click="handleDelete"
                        type="button"
                        class="gap-1 cursor-pointer w-full bg-red-800 text-white font-medium py-3 px-6 rounded-lg hover:bg-red-700 transition duration-300 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-800 flex items-center justify-center"
                    >
                        <i class="fas fa-user-plus mr-2"></i> Delete
                    </button>
                </div>
            </form>
        </div>
    </div>
</template>
