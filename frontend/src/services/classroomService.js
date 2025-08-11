import api from "./api";

export const getAllClassrooms = () => api.get('/classrooms');

export const addNewClassroom = (formData) => api.post('/classrooms', formData);