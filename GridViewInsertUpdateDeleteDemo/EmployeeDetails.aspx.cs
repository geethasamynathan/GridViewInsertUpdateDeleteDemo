using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace GridViewInsertUpdateDeleteDemo
{
    public partial class EmployeeDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Server=LAPTOP-0TBPBTEL\SQLEXPRESS;Database=IBM_May_Batch;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                BindEmployeeDetails();
            }
        }
        protected void BindEmployeeDetails()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Employee",con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            con.Close();
            if(dataSet.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = dataSet;
                GridView1.DataBind();
            }
            else
            {
                dataSet.Tables[0].Rows.Add(dataSet.Tables[0].NewRow());
                GridView1.DataSource = dataSet;
                GridView1.DataBind();
                int columncount = GridView1.Rows[0].Cells.Count;
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = columncount;
                GridView1.Rows[0].Cells[0].Text = " No Records Found";
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
           GridView1.EditIndex = e.NewEditIndex;
            BindEmployeeDetails();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int eid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
          
            con.Open();
            SqlCommand cmd = new SqlCommand($"delete from  Employee  where EmpId ={eid}", con);
            int result=cmd.ExecuteNonQuery();
            con.Close();
            if (result > 0)
            {
                lblResult.Text = eid + "Deleted successfully";
                lblResult.ForeColor = System.Drawing.Color.Green;
            }
            GridView1.EditIndex = -1;
            BindEmployeeDetails();

        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindEmployeeDetails();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName== "AddNew")
            {
                TextBox eid = (TextBox)GridView1.FooterRow.FindControl("txtNewEmpid");
                TextBox txtName = (TextBox)GridView1.FooterRow.FindControl("txtNewEmpName");
                TextBox txtCity = (TextBox)GridView1.FooterRow.FindControl("txtNewCity");
                TextBox txtDoj = (TextBox)GridView1.FooterRow.FindControl("txtNewDOJ");
                TextBox txtSalary = (TextBox)GridView1.FooterRow.FindControl("txtNewSalary");
                con.Open();
                SqlCommand cmd = new SqlCommand($"insert into Employee values({Convert.ToInt32(eid.Text)},'{txtName.Text}','{txtCity.Text}'," +
                    $"'{Convert.ToDateTime(txtDoj.Text)}',{txtSalary.Text})", con);
                int rowcount=cmd.ExecuteNonQuery();
                con.Close();
                if (rowcount > 0)
                {
                    lblResult.Text = txtName.Text + "inserted successfully";
                    lblResult.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblResult.Text = txtName.Text + "Not inserted ";
                    lblResult.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int eid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            TextBox txtName = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditEmpName");
            TextBox txtCity = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditCity");
            TextBox txtDoj = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditDOJ");
            TextBox txtSalary = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditSalary");
            con.Open();
            SqlCommand cmd = new SqlCommand($"update Employee set Name='{txtName.Text}',City='{txtCity.Text}'," +
                $"DOJ='{Convert.ToDateTime(txtDoj.Text)}',Salary='{txtSalary.Text}' where EmpId ={eid}",con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblResult.Text = txtName.Text + "updated successfully";
            lblResult.ForeColor = System.Drawing.Color.Green;
            GridView1.EditIndex = -1;
            BindEmployeeDetails();

        }
    }
}