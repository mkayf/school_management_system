import api from "./api";

export const getAllStudents = () => api.get('/students');

export const addNewStudent = (formData) => api.post('/students', formData);

export const getStudent = (id) => api.get(`/students/${id}`)

export const updateStudent = (id, formData) => api.put(`/students/${id}`, formData);

export const deleteStudent = (id) => api.delete(`/students/${id}`);