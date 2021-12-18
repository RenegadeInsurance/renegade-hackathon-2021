package com.personal.hackathon.service.impl;

import com.personal.hackathon.dto.FormSubmissionData;
import com.personal.hackathon.dto.RiskData;
import com.personal.hackathon.dto.form.FieldData;
import com.personal.hackathon.dto.form.FormData;
import com.personal.hackathon.dto.form.FormDataList;
import com.personal.hackathon.exception.DataNotFound;
import com.personal.hackathon.model.form.Field;
import com.personal.hackathon.model.form.Form;
import com.personal.hackathon.model.form.Heading;
import com.personal.hackathon.model.form.Value;
import com.personal.hackathon.repo.AppUserRepo;
import com.personal.hackathon.repo.form.FieldRepo;
import com.personal.hackathon.repo.form.FormRepo;
import com.personal.hackathon.repo.form.HeadingRepo;
import com.personal.hackathon.repo.form.ValueRepo;
import com.personal.hackathon.service.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FormServiceImpl implements FormService {
    private final FieldRepo fieldRepo;
    private final HeadingRepo headingRepo;
    private final ValueRepo valueRepo;
    private final FormRepo formRepo;
    private final AppUserRepo appUserRepo;

    @Override
    @Transactional
    public int createForm(FormDataList formDataList) {
        var form = Form.builder()
                .formName(formDataList.getFormName())
                .build();

        formRepo.save(form);

        formDataList.getFormData().forEach(formData -> {
            var heading = Heading.builder()
                    .title(formData.getHeading())
                    .form(form)
                    .build();


            headingRepo.save(heading);

            var fieldDataList = formData.getFields();
            fieldDataList.forEach(fieldData -> {
                var field = Field.builder()
                        .name(fieldData.getName())
                        .type(fieldData.getType())
                        .field(fieldData.getField())
                        .isRequired(fieldData.isRequired())
                        .isRiskIndicator(fieldData.isRiskIndicator())
                        .riskLevel(fieldData.getRiskLevel())
                        .riskIf(fieldData.getRiskIf())
                        .heading(heading)
                        .build();

                fieldRepo.save(field);

                var valueDataList = fieldData.getValues();

                valueDataList.forEach(valueData -> {
                    var value = Value.builder()
                            .value(valueData)
                            .field(field)
                            .build();

                    valueRepo.save(value);
                });

            });


        });


        return form.getId();
    }

    @Override
    public FormDataList retrieveForm(int formId) {
        var form = formRepo.findById(formId)
                .orElseThrow(() -> new DataNotFound("Form does not exist"));

        var headings = headingRepo.findByFormId(formId);

        List<FormData> formData = new ArrayList<>();

        for (Heading heading : headings) {
            var fieldList = fieldRepo.findByHeadingId(heading.getId());

            List<FieldData> fieldDataList = new ArrayList<>();

            fieldList.forEach(field -> {

                var valueList = valueRepo.findByFieldId(field.getId());

                var values = valueList.stream()
                        .map(Value::getValue)
                        .collect(Collectors.toList());

                var fieldData = FieldData.builder()
                        .id(field.getId())
                        .name(field.getName())
                        .field(field.getField())
                        .isRequired(field.isRequired())
                        .type(field.getType())
                        .isRiskIndicator(field.isRiskIndicator())
                        .riskLevel(field.getRiskLevel())
                        .riskIf(field.getRiskIf())
                        .values(values)
                        .build();

                fieldDataList.add(fieldData);

            });

            formData.add(
                    FormData.builder()
                            .id(heading.getId())
                            .heading(heading.getTitle())
                            .fields(fieldDataList)
                            .build()
            );
        }

        return FormDataList.builder()
                .id(form.getId())
                .formName(form.getFormName())
                .formData(formData)
                .build();
    }

    @Override
    public List<FormDataList> retrieveAllForms() {
        var forms = formRepo.findAll();

        return forms.stream()
                .map(form -> FormDataList.builder()
                        .id(form.getId())
                        .formName(form.getFormName())
                        .build())
                .collect(Collectors.toList());

    }

    @Override
    @Transactional
    public Map<String, List<RiskData>> submitForm(FormSubmissionData data, String email) {
//        var appUser = appUserRepo.findByAuthEmail(email)
//                .orElseThrow(()->new DataNotFound("User not found"));
//
//        appUser.setName(data.getName());
//        appUser.setAge(data.getAge());
//        appUser.setCity(data.getCountry());
//        appUser.setState(data.getState());
//        appUser.setCountry(data.getCountry());
//
//        appUserRepo.save(appUser);

        System.out.println("data "+data);

        Map<String, List<RiskData>> riskMap = new HashMap<>();

        for(var riskData : data.getRiskDataList()){
            String heading = headingRepo.getById(riskData.getHeadingId()).getTitle();

            Field field = fieldRepo.findByIdAndHeadingId(riskData.getFieldId(), riskData.getHeadingId());

            var risk = RiskData.builder()
                    .riskLevel(field.getRiskLevel())
                    .riskIf(field.getRiskIf())
                    .answer(riskData.getAnswer())
                    .build();

            if(riskMap.containsKey(heading)){
                   riskMap.get(heading).add(risk);
            }else{
                List<RiskData> risks = new ArrayList<>();
                risks.add(risk);
                riskMap.put(heading, risks);
            }
        }


        return riskMap;

    }
}
