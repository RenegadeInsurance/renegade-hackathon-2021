export const test = {
  formName: "New User Form",
  generalSection: [
    {
      heading: "Personal Detail",
      fields: [
        {
          name: "Name",
          type: "input",
          isrequired: "true",
          isRiskIndicator: false,
          values: [],
          riskLevel: "",
          riskIf: "",
        },
        {
          name: "Email",
          type: "input",
          isrequired: "true",
          isRiskIndicator: false,
          values: [],
          riskLevel: "",
          riskIf: "",
        },
        {
          name: "Age",
          type: "input",
          isrequired: "true",
          isRiskIndicator: false,
          values: [],
          riskLevel: "",
          riskIf: "",
        },
        {
          name: "Gender",
          type: "dropdown",
          isrequired: "true",
          values: ["Male", "Female", "Other"],
          isRiskIndicator: false,
          riskLevel: "",
          riskIf: "",
        },
      ],
    },
    {
      heading: "Location Detail",
      fields: [
        {
          name: "Country",
          type: "input",
          isrequired: "true",
          values: [],
        },
        {
          name: "State",
          type: "input",
          isrequired: "true",
          isRiskIndicator: false,
          values: [],
          riskLevel: "",
          riskIf: "",
        },
        {
          name: "City",
          type: "input",
          isrequired: "true",
          isRiskIndicator: false,
          values: [],
          riskLevel: "",
          riskIf: "",
        },
      ],
    },
  ],
  riskSection: [
    {
      title: "Flood Risk Assessment",
      data: {
        label: "Question 1",
        riskIf: "Yes",
        riskLevel: "LOW",
        child: [
          {
            label: "Question 2",
            riskIf: "Yes",
            riskLevel: "LOW",
            isYes: true,
          },
          {
            label: "Question4",
            riskIf: "No",
            riskLevel: "MODERATE",
            isYes: false,
            child: [
              {
                label: "Quesion5",
                riskIf: "Yes",
                riskLevel: "HIGH",
                isYes: true,
              },
            ],
          },
        ],
      },
    },
    {},
  ],
};
