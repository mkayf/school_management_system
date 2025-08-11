import { createRouter, createWebHistory} from "vue-router";
import {Dashboard, Students, StudentForm, Classrooms, ClassroomForm, Subjects, SubjectForm} from '../pages/index'

const routes = [
    {
        path: '/',
        name: 'Dashboard',
        component: Dashboard
    },
    {
        path: '/students',
        name: 'Students',
        component: Students,
        
    },
    {
        path: '/add-student',
        name: 'AddStudent',
        component: StudentForm,
        meta: {mode: 'add'}
    },
    {
        path: '/manage-student/:id',
        name: 'ManageSudent',
        component: StudentForm,
        meta: {mode: 'manage'}
    },
    {
        path: '/classrooms',
        name: 'Classrooms',
        component: Classrooms,
    },
    {
        path: '/add-classroom',
        name: 'AddClassroom',
        component: ClassroomForm,
        meta: {mode: 'add'}
    },
    {
        path: '/manage-classroom/:id',
        name: 'ManageClassroom',
        component: ClassroomForm,
        meta: {mode: 'manage'}
    },
    {
        path: '/subjects',
        name: 'Subjects',
        component: Subjects,
    },
    {
        path: '/add-subject',
        name: 'AddSubject',
        component: SubjectForm,
        meta: {mode: 'add'}
    },
    {
        path: '/manage-subject/:id',
        name: 'ManageSubject',
        component: SubjectForm,
        meta: {mode: 'manage'}
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes: routes
});

export default router;