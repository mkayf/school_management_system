import api from "./api";

// Get dashboard stats:

export const dashboardStats = () => api.get('/dashboard-stats');

export const newStudents = () => api.get('/new-students');