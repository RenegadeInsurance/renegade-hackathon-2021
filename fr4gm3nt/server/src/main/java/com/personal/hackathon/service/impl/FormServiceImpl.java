package com.personal.hackathon.service.impl;

import com.personal.hackathon.dto.form.FieldData;
import com.personal.hackathon.dto.form.FormData;
import com.personal.hackathon.dto.form.FormDataList;
import com.personal.hackathon.exception.DataNotFound;
import com.personal.hackathon.model.form.Field;
import com.personal.hackathon.model.form.Form;
import com.personal.hackathon.model.form.Heading;
import com.personal.hackathon.model.form.Value;
import com.personal.hackathon.repo.form.FieldRepo;
import com.personal.hackathon.repo.form.FormRepo;
import com.personal.hackathon.repo.form.HeadingRepo;
import com.personal.hackathon.repo.form.ValueRepo;
import com.personal.hackathon.service.FormService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FormServiceImpl implements FormService {
    private final FieldRepo fieldRepo;
    private final HeadingRepo headingRepo;
    private final ValueRepo valueRepo;
    private final FormRepo formRepo;

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
                .orElseThrow(()->new DataNotFound("Form does not exist"));

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
}
