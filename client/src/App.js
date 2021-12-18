import "./App.css";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Form from "./components/form";
import FormView from "./components/formv2";
import FormWrap from "./components/formv2/Forms";
import Weather from "./pages/Weather"
import { TabsCard} from "./pages/WeatherTab"

function App() {
  return (
    <div className="App">
    <BrowserRouter>
      <Routes>
          <Route path="/form" element={<Form />} />
          <Route path="/forms/:id" element={<FormView />} />
          <Route path="/" element={<FormWrap />} />
          <Route path="/v2" element={<FormView />} />
          <Route path="/weather" element={<TabsCard />} />
      </Routes>
    </BrowserRouter>
    </div>
  );
}

export default App;
