
using DemoModel.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoService.UserService
{
    public interface IUserService
    {
        UserViewModel LoginAuthentication(LoginViewModel loginViewModel);

        /// <summary>
        /// Update user status on logout
        /// </summary>
        /// <param name="userId"></param>
        void UserLogOff(string userId);

        /// <summary>
        /// Save Users
        /// </summary>
        /// <param name="user"></param>
        /// <param name="logId"></param>
        /// <param name="validateOnSaveEnabled"></param>
        /// <param name="mailBodyTemplate"></param>
        /// <returns></returns>
        bool SaveUsers(UserViewModel userViewModel, long logId = 0);


        /// <summary>
        /// Update User information
        /// </summary>
        /// <param name="user"></param>
        /// <param name="ProfileMedia"></param>
        /// <returns></returns>
        bool UpdateUsers(UserViewModel userViewModel);

        /// <summary>
        /// Get all Users
        /// </summary>
        /// <param name="searchingParams"></param>
        /// <returns></returns>

        /// <summary>
        /// Get user detail by Id
        /// </summary>
        /// <param name="UserId"></param>
        /// <returns></returns>
        UserViewModel GetUsersDetailsById(long UserId);


        /// <summary>
        /// Get user detail by email
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        UserViewModel GetUsersDetailsByEmail(string email);


        /// <summary>
        /// Check for User email exists
        /// </summary>
        /// <param name="emailAddress"></param>
        /// <param name="id"></param>
        /// <returns></returns>
         bool IsUserExists(string emailAddress, string id);



        /// <summary>
        /// Get all user Types
        /// </summary>
        /// <returns></returns>
         List<UserTypeViewModel> GetUserTypes();

        /// <summary>
        /// Get all user 
        /// </summary>
        /// <returns></returns>
         List<UserViewModel> GetUserList(int UserId, int RoleId);

        bool RegisterUsers(UserViewModel userViewModel, long logId = 0);


        bool SaveUserPassword(ResetPasswordViewModel model);

         bool verifyUserExistByCode(string ResetCode);

         bool UpdateResetCode(string EmailID, string ResetCode);

        bool DeletUser(int Id, int UserId);
    }
}
