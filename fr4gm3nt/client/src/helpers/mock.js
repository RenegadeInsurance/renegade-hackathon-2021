export const mock = {
    "form":[
        {
            "heading": "Personal Detail",
            "fields": [
                {
                    "name": "Name",
                    "type": "input",
                    "isrequired": "true",
                    "isRiskIndicator": false,
                    "values":[],
                    "riskLevel":"",
                    "riskIf":""
                },
                {
                    "name": "Email",
                    "type": "input",
                    "isrequired": "false",
                    "isRiskIndicator": false,
                    "values":[],
                    "riskLevel":"",
                    "riskIf":""
                },
                {
                    "name": "Age",
                    "type": "number",
                    "isrequired": "true",
                    "isRiskIndicator": false,
                    "values":[],
                    "riskLevel":"",
                    "riskIf":""
                },
                {
                    "name": "Gender",
                    "type": "dropdown",
                    "isrequired": "true",
                    "values": ["Male", "Female", "Other"],
                    "isRiskIndicator": false,
                    "riskLevel":"",
                    "riskIf":""
                }
            ]
        },
        {
            "heading": "Location",
            "fields": [
                {
                    "name": "Country",
                    "type": "input",
                    "isrequired": "true",
                    "isRiskIndicator": false,
                    "values":[],
                    "riskLevel":"",
                    "riskIf":""
                },
                {
                    "name": "State",
                    "type": "input",
                    "isrequired": "true",
                    "isRiskIndicator": false,
                    "values":[],
                    "riskLevel":"",
                    "riskIf":""
                },
                {
                    "name": "City",
                    "type": "input",
                    "isrequired": "true",
                    "isRiskIndicator": false,
                    "values":[],
                    "riskLevel":"",
                    "riskIf":""
                }
               
            ]
        },
        {
            "heading": "Flood Risk Assessment",
            "fields":[
                {
                    "name": "Have you experienced one or more flooding event in your life? ",
                    "type": "dropdown",
                    "isrequired": "true",
                    "values": ["Yes", "No"],
                    "isRiskIndicator": true,
                    "riskLevel":"Moderate",
                    "riskIf":"Yes"
                }
            ]
            
        }
    ]
}