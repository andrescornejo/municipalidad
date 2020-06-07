﻿using Muni.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Muni.Pages
{
    public partial class addUsersFromAdmin : System.Web.UI.Page
    {
        string usernameGot;
        protected void Page_Load(object sender, EventArgs e)
        {
            usernameGot = Request.QueryString["username"];
        }
        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx?username=" + usernameGot);
        }

        protected void addUserBtn_Click(object sender, EventArgs e)
        {
            string newUser = this.usernameTxtBox.Text;
            string newPasswd = this.passwdTxtBox.Text;

            if (newUser.Length != 0 && newPasswd.Length != 0)
            {
                God.addUser(newUser, newPasswd, this.isAdminCheckbox.Checked);
                this.usernameTxtBox.Text = "";
                this.passwdTxtBox.Text = "";
                this.isAdminCheckbox.Checked = false;
            }
        }

    }
}