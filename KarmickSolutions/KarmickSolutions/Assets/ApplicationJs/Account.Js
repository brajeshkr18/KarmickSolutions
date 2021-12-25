$(document).ready(function () {
    $("#btn_register").click(function () {
        var hasError = false;
        clearValidation();
        var firstName = $("#FirstName").val();
        var lastName = $("#LastName").val();
        var email = $("#txtEmail").val();
        var phone = $("#PhoneNumber").val();
        var departrmentId = $("#DepartrmentId").val();
        var designationId = $("#DesignationId").val();
        var password = $("#txtPassword").val();
        var confirmpassword = $("#ConfirmPassword").val();
        // var role = alert($('input[name=gender]:checked').val(
        if (firstName == "") {
            $('#lblFirstName').html(ErrorMessage.FirstName);
            hasError = true;
        }
        if (lastName == "") {
            $('#lblLastName').html(ErrorMessage.LastName)
            hasError = true;
        }
        if (email == "") {
            $('#lblEmail').html(ErrorMessage.Email)
            hasError = true;
        }
        else if (!ValidateEmail(email)) {
            $('#lblEmail').html(ErrorMessage.EmailValidation)
            hasError = true;
        }
        if (phone == "") {
            $('#lblPhone').html(ErrorMessage.Phone)
            hasError = true;
        }
        else if (!validatePhone(phone)) {
            $('#lblPhone').html(ErrorMessage.PhoneValidation)
            hasError = true;
        }
        if (departrmentId == "0" || departrmentId == "") {
            $('#lblDepartment').html(ErrorMessage.Department)
            hasError = true;
        }
        if (designationId == "0") {
            $('#lblDesignation').html(ErrorMessage.Designation)
            hasError = true;
        }
        if (password == "") {
            $('#lblPassword').html(ErrorMessage.Password)
            hasError = true;
        }
        if (confirmpassword == "") {
            $('#lblConfirmpassword').html(ErrorMessage.ConfirmPassword)
            hasError = true;
        }
        if (password != confirmpassword) {
            $('#lblConfirmpassword').html(ErrorMessage.ConfirmPasswordMatch)
            hasError = true;
        }
        if (!validatePassword(password)) {
            $('#lblPassword').html(ErrorMessage.PasswordRegexValidation)
            hasError = true;
        }
        if (hasError == false) {
            //var ObjUser = {
            //    FirstName : firstName,
            //    LastName: lastName,
            //    Email: email,
            //    PhoneNumber: phone,
            //    DepartrmentId: departrmentId,
            //    DesignationId: designationId,
            //    Password: password,
            //    UserTypeId: 102,
            //}
            var url = "/Account/Register";
            $.post(url, {
                FirstName: firstName,
                LastName: lastName,
                Email: email,
                PhoneNumber: phone,
                DepartrmentId: departrmentId,
                DesignationId: designationId,
                Password: password,
                UserTypeId: 102,
                ConfirmPassword: confirmpassword
            }, function (data) {

                if (data.IsSuccess) {
                    //$('#dvErrorMessage').removeClass('display-hide').addClass('display')
                    //$('#dvErrorMessage').removeClass('alert-danger').addClass('alert-success')
                    //$('.spnErrorMessage').html('<strong>Successful:</strong> ' + data.Message)
                    ////$('.spnSuccessMessage').html('<strong>Successful:</strong> ' + data.Message)
                    $(':input', '#form').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
                    Alert(data.Message);
                }
                else if (data.IsSuccess == false) {
                    $('#lblEmail').html(data.Message)
                }
            });

        }
    });
    function response() {
        alert();
    }
    function ValidateEmail(email) {
        var re = /^[a-zA-Z0-9._%+-]+(@@karmicksolutions\.com)$/;
        return re.test(email);
    }
    function validatePhone(phone) {
        var re = /^[789]\d{9}$/;
        return re.test(phone);
    }
    function validatePassword(password) {
        var re = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@@$!%*?&])[A-Za-z\d@@$!%*?&]{5, 8}$/;
        return re.test(password);
    }
    var url = '@Url.Action("Designation", "Account")'; // use the helper (dont hard code)
    var designation = $('#DesignationId'); // cache the element
    $('#DepartrmentId').change(function () {
        $.getJSON(url, { DepartmentId: $(this).val() }, function (response) {
            // clear and add default (null) option
            designation.empty().append($('<option></option>').val('0').text('Please select Designation'));
            $.each(response, function (index, item) {
                designation.append($('<option></option>').val(item.DepartmentId).text(item.Designation));
            });
        });
    });


    function clearValidation() {
        $('#lblFirstName').html("");
        $('#lblLastName').html("");
        $('#lblEmail').html("");
        $('#lblPhone').html("");
        $('#lblDepartment').html("");
        $('#lblDesignation').html("");
        $('#lblPassword').html("");
        $('#lblConfirmpassword').html("");
    }
    function clearValidation() {
        $('#lblFirstName').html("");
        $('#lblLastName').html("");
        $('#lblEmail').html("");
        $('#lblPhone').html("");
        $('#lblDepartment').html("");
        $('#lblDesignation').html("");
        $('#lblPassword').html("");
        $('#lblConfirmpassword').html("");
        $('#lblFirstName').html("");
        $('#lblLastName').html("");
        $('#lblEmail').html("");
        $('#lblPhone').html("");
        $('#lblDepartment').html("");
        $('#lblDesignation').html("");
        $('#lblPassword').html("");
        $('#lblConfirmpassword').html("");
    }
}