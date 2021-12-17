package com.personal.hackathon.service.impl;

import com.personal.hackathon.dto.form.FormDataList;
import com.personal.hackathon.model.field.Field;
import com.personal.hackathon.model.field.Heading;
import com.personal.hackathon.model.field.Value;
import com.personal.hackathon.repo.form.FieldRepo;
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

    @Override
    @Transactional
    public int createForm(FormDataList formDataList) {

        formDataList.getFormData().forEach(form ->{
            var heading = Heading.builder()
                            .title(form.getHeading())
                    .build();


            headingRepo.save(heading);

            var fieldDataList = form.getFields();
            fieldDataList.forEach(fieldData-> {
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

                valueDataList.forEach(valueData ->{
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
