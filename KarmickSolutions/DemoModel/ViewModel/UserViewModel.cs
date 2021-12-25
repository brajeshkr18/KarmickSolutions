using DemoModel.ViewModel;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web.Mvc;

namespace DemoModel.ViewModel
{
    public class UserViewModel
    {
        public long Id { get; set; }
        public long UserTypeId { get; set; }
        [Required(ErrorMessage = "First Name is required")]
        [RegularExpression(@"^[a-zA-Z]+$", ErrorMessage = "Only alphabets should be acceptable")]
        [System.ComponentModel.DataAnnotations.Display(Name = "First Name *")]
        public string FirstName { get; set; }
        [Required(ErrorMessage = "Last Name is required")]
        [Display(Name = "Last Name *")]
        public string LastName { get; set; }
        [Remote("IsUserEmailExists", "Account", ErrorMessage = "Email is already taken by someone", AdditionalFields = "Email,Id")]
        [Required(ErrorMessage = "Email is required")]
        [Display(Name = "Email *")]
        //[EmailAddress(ErrorMessage = "The Email field is not a valid e-mail address.")]
        [RegularExpression(@"^[a-zA-Z0-9._%+-]+(@karmicksolutions\.com)$",
            ErrorMessage = "Email should take only @ karmicksolutions.com")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Phone Number is required")]
        [Display(Name = "Phone Number *")]
        //[RegularExpression(@"^91[7-9][0-9]{8}$", ErrorMessage = "Phone format is not valid.")]
        public string PhoneNumber { get; set; }
        public string UserName { get; set; }
        public string SaltKey { get; set; }
        public string PasswordHash { get; set; }
        public Nullable<bool> DefaultPassword { get; set; }
        public Nullable<System.DateTime> LastLoginDate { get; set; }
        public Nullable<int> AccountStatus { get; set; }
        public Nullable<long> CreatedBy { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public Nullable<long> ModifiedBy { get; set; }
        public Nullable<System.DateTime> ModifiedOn { get; set; }
        public bool IsActive { get; set; }
        public bool IsDeleted { get; set; }
        public virtual UserDetailViewModel UserDetail { get; set; }
        public virtual UserTypeViewModel UserType { get; set; }
        public string FullName
        {
            get
            {
                return string.Format("{0} {1}", FirstName, LastName);
            }
        }

        public string UserTypeCode { get; set; }
        public string UserTypeName { get; set; }

        [Required(ErrorMessage = "Password is required")]
        //[StringLength(8, ErrorMessage = "Must be between 5 and 255 characters", MinimumLength = 5)]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirm Password is required")]
        //[StringLength(8, ErrorMessage = "Must be between 5 and 255 characters", MinimumLength = 5)]
        [DataType(DataType.Password)]
        //[System.ComponentModel.DataAnnotations.Compare("Password")]
        public string ConfirmPassword { get; set; }


        public int DepartrmentId { get; set; }
        public int DesignationId { get; set; }
    }
}
