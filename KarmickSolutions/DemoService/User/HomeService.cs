using Demo.Core.EntityModel;
using DemoModel.ViewModel;
using ExpressMapper;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;
using static Utility.Enums;

namespace DemoService.User
{
    public class HomeService
    {
        private OnBoadTaskEntities _Context = new OnBoadTaskEntities();
        #region Public_Methods
        
        public List<UserDetailViewModel> GetMyAddress(long UserId)
        {
            List<UserDetailViewModel> userDetailViewModel = new List<UserDetailViewModel>();
            try
            {
                List<UserDetail> userDetail = new List<UserDetail>();
                userDetail = _Context.UserDetails.OrderBy(x => x.IsDefault).Where(x => x.UserId == UserId).ToList();
                Mapper.Map(userDetail, userDetailViewModel);
            }
            catch (Exception ex)
            {

            }
            return userDetailViewModel;
        }
       
        public bool SaveMyAddress(long UserId, UserDetailViewModel userDetailViewModel)
        {
            bool status = false;
            try
            {
                    _Context.SaveUserDetails(userDetailViewModel.Id, userDetailViewModel.CurCountry,
                        1, userDetailViewModel.CurCity, userDetailViewModel.CurZipCode,
                        userDetailViewModel.CurAddress1, userDetailViewModel.CurAddress2, userDetailViewModel.ProfileUrl, UserId,
                        userDetailViewModel.IsDefault);
 
                status = true;
            }
            catch (Exception ex)
            {

            }
            return status;
        }
   
        #endregion
    }
}
