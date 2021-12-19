import { createSlice } from "@reduxjs/toolkit";

// initial state of categories
const initialState = {
    forms : [
       
        {
            id: "1",
            heading: "Personal Detail",
            fields: [
                {
                    "name": "Name",
                    "type": "input",
                    "isrequired": true,
                    "isRiskIndicator": false,
                    "values": [],
                    "riskLevel": "",
                    "riskIf": ""
                },
                {
                    "name": "Email",
                    "type": "input",
                    "isrequired": "false",
                    "isRiskIndicator": false,
                    "values": [],
                    "riskLevel": "",
                    "riskIf": ""
                },
                {
                    "name": "Age",
                    "type": "number",
                    "isrequired": true,
                    "isRiskIndicator": false,
                    "values": [],
                    "riskLevel": "",
                    "riskIf": ""
                },
                {
                    "name": "Gender",
                    "type": "dropdown",
                    "isrequired": true,
                    "values": ["Male", "Female", "Other"],
                    "isRiskIndicator": false,
                    "riskLevel": "",
                    "riskIf": ""
                }
            ]
        },
       
        {
            id: "2",
            heading: "Location",
            fields: [
                {
                    "name": "Country",
                    "type": "input",
                    "isrequired": true,
                    "isRiskIndicator": false,
                    "values": [],
                    "riskLevel": "",
                    "riskIf": ""
                },
                {
                    "name": "State",
                    "type": "input",
                    "isrequired": true,
                    "isRiskIndicator": false,
                    "values": [],
                    "riskLevel": "",
                    "riskIf": ""
                },
                {
                    "name": "City",
                    "type": "input",
                    "isrequired": true,
                    "isRiskIndicator": false,
                    "values": [],
                    "riskLevel": "",
                    "riskIf": ""
                }

            ]
        },
       
        {
            id: "3",
            heading: "Flood Risk Assessment",
            fields: [
                {
                    "name": "Have you experienced one or more flooding event in your life? ",
                    "type": "dropdown",
                    "isrequired": true,
                    "values": ["Yes", "No"],
                    "isRiskIndicator": true,
                    "riskLevel": "Moderate",
                    "riskIf": "Yes"
                }
            ]

        }
    ],
}




const formSlice = createSlice({
    name: "user",
    initialState,
    reducers: {
        // user actions
        addNewForm: (state, {payload}) => {
            state.forms = [payload, ...state.forms]
        },
        deleteForm: (state, {payload}) => {
            state.forms = state.forms.filter(form => form.id != payload)
        }
    }
});

export const { addNewForm, deleteForm } = formSlice.actions;

// export reducer to use in store
export default formSlice.reducer;