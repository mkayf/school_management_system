import api from "./api";

export const getAllStudents = () => api.get('/students');

export const addNewStudent = (formData) => api.post('/students', formData);