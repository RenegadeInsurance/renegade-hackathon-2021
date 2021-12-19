import http from "../utils/http";
import config from "../config";

export const fetchForm = async () => {
  const url = config.endpoints.form.id;
  const response = await http.get(`${url}/94`);
  return response.data;
};

export const fetchDynamicForm = async () => {
  const url = config.endpoints.form.v2;
  const response = await http.get(`${url}`);
  return response.data;
};

export const fetchDynamicFormById = async (id) => {
  const url = config.endpoints.form.v2;
  const response = await http.get(`${url}/${id}`);
  return response.data;
};

export const fetchSubmissionFormById = async (id) => {
  const url = config.endpoints.form.showForms;
  const response = await http.get(`${url}/${id}`);
  return response.data;
};

export const fetchSubmissions = async (id) => {
  const url = config.endpoints.form.showForms;
  const response = await http.get(`${url}/?formid=${id}`);
  return response.data;
};
