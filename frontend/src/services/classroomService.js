import api from "./api";

export const getAllClassrooms = () => api.get('/classrooms');

export const createNewClassroom = (formData) => api.post('/classrooms', formData); 

export const getClassroom = (id) => api.get(`/classrooms/${id}`);