import api from "./api";

export const getAllSubjects = () => api.get('/subjects');

export const addNewSubject = (formData) => api.post('/subjects', formData);