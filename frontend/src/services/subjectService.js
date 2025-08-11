import api from "./api";

export const getAllSubjects = () => api.get('/subjects');

export const addNewSubject = (formData) => api.post('/subjects', formData);

export const getSubject = (id) => api.get(`/subjects/${id}`);

export const updateSubject = (id, formData) => api.put(`/subjects/${id}`, formData);

export const deleteSubject = (id) => api.delete(`/subjects/${id}`);;