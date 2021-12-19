import "./App.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Form from "./components/form";
import FormView from "./components/formv2";
import FormWrap from "./components/formv2/Forms";
import Weather from "./pages/Weather";
import { TabsCard } from "./pages/WeatherTab";
import RiskAssessment from "./components/formv2/RiskAssessment";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import Footer from "./components/Footer";
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
          <Route path="/v2" element={<FormView />} />
          <Route path="/weather" element={<TabsCard />} />
          <Route path="/create-form" element={<CreateForm />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
