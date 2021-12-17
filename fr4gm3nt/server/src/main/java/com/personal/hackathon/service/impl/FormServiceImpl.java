package com.personal.hackathon.service.impl;

import com.personal.hackathon.dto.form.FormDataList;
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


        return 0;
    }
}
