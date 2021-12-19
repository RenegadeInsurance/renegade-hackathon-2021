import "./App.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Form from "./components/form";
import FormView from "./components/formv2";
import FormWrap from "./components/formv2/Forms";
import SubmissionForms from "./components/formv2/SubmissionForms";
import SubmissionForm from "./components/formv2/SubmissionForm";
import { WeatherTab } from "./pages/WeatherTab";
import RiskAssessment from "./components/formv2/RiskAssessment";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import CreateForm from "./components/CreateForm/CreateForm";

function App() {
  return (
    <div className="App">
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/form" element={<Form />} />
          <Route path="/risk" element={<RiskAssessment />} />
          <Route path="/forms/:id" element={<FormView />} />
          <Route path="/forms" element={<FormWrap />} />
          <Route path="/submissions" element={<SubmissionForms />} />
          <Route path="/submissions/:id" element={<SubmissionForm />} />
          <Route path="/v2" element={<FormView />} />
          <Route path="/weather" element={<WeatherTab />} />
          <Route path="/create-form" element={<CreateForm />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
