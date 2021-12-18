import axios from "axios";

const API_URL = "http://192.168.5.29:8090/api/authenticate/";

class AuthService {
  login(email, password) {
    return axios
      .post(API_URL + "signin", { email, password })
      .then((response) => {
        if (response.data.token) {
          localStorage.setItem("user", JSON.stringify(response.data));
        }
        return response.data;
      });
  }

  logout() {
    localStorage.removeItem("user");
  }

  register(email, password) {
    return axios.post(API_URL + "signup", {
      email,
      password,
    });
  }
}

export default new AuthService();
