$.each(inputs, function(i, ele) {
    keys.push(ele.name);
});


$(document).submit($addForm, function(event) {
    event.preventDefault();
    var $formData = $(this).serialize()

    $.ajax({
        method: "POST",
        url: $url,
        data: $formData,
        headers: {
            "X-CSRFToken": $csrf,
        },
        success: handleFormSuccess,
        error: handleFormError,
    });
});

function handleFormSuccess(data, textStatus, jqXHR) {
    $addForm[0].reset();
    $modal_form.modal('hide');
    $(location).attr('href', url)
}

function handleFormError(jqXHR, textStatus, errorThrown) {

    $.each(keys, function(i, ele) {
        error = $.parseJSON(jqXHR.responseText)[ele]
        $('#' + ele + '-error').remove();
        if (error != undefined) {
            var $field = $("input[name=" + ele + "]");
            var $label = $("#id_" + ele).text();
            $field.addClass('is-invalid');
            $field.after(
                '<span id="' + ele + '-error" class="error invalid-feedback">' + error + '</span>');
        } else {
            $('#' + ele + '-error').remove();
            $("input[name=" + ele + "]").removeClass('is-invalid');
        }

    });

}

var table = $table.DataTable({
    'responsive': true,
    dom: 'Bfrtip',
    buttons: ['copy', 'csv', 'excel', 'pdf', 'print', 'colvis'],
});
table.buttons().container().appendTo($('.col-sm-6:eq(0)', table.table().container()));
$(document).on('click', '.add-link', function() {
    $addForm.find('input').removeClass('is-invalid');
    $addForm.find('error').html('');
    $modal_form.modal();
});

$(document).on('click', '.modal-close', function() {

});

$(document).on("hide.bs.modal", $modal_form, function() {
    $modal_form.find('form')[0].reset();
    $addForm.children().removeClass('is-invalid');
});

$(document).on('click', '.btn-edit', function() {
    var $slug = $(this).attr('slug');
    $.getJSON($api_url + $slug, function(data) {
        $.each(keys, function(i, ele) {
            if (data[ele] != undefined) {
                $("input[name=" + ele + "]").val(data[ele]);

                $modal_form.modal('show');
            }
        });
    });

});