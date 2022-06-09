<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDetails.aspx.cs" Inherits="GridViewInsertUpdateDeleteDemo.EmployeeDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>   


            <asp:GridView ID="GridView1" runat="server" DataKeyNames="EmpId"
                AutoGenerateColumns="False" Height="336px" ShowFooter="True" Width="913px"
                OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowCommand="GridView1_RowCommand"
                OnRowDeleting="GridView1_RowDeleting"
                OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:TemplateField HeaderText="EmpId">
                        <EditItemTemplate>
                            <asp:Label ID="lblEditEmpid" runat="server" Text='<%#Eval("EmpId") %>'></asp:Label>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewEmpid" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemEmpId" runat="server" Text='<%#Eval("EmpId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditEmpName" Text='<%#Eval("Name") %>' runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewEmpName" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemEmpName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditCity" runat="server" Text='<%#Eval("City") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewCity" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemCity" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DOJ">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditDOJ" runat="server" Text='<%#Eval("DOJ") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewDOJ" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemDOJ" runat="server" Text='<%#Eval("DOJ") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEditSalary" runat="server" Text='<%#Eval("Salary") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtNewSalary" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblItemSalary" runat="server" Text='<%#Eval("Salary") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Modify">
                        <EditItemTemplate>
                            <asp:LinkButton ID="lbtnUpdate" runat="server" CommandName="Update">Update</asp:LinkButton>
                            &nbsp;&nbsp;
                            <asp:ImageButton ID="ibtnCancel" runat="server" CommandName="Cancel" Height="21px" ImageUrl="~/Images/cancel.png" Width="42px" />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:ImageButton ID="ibtnAddNew" runat="server" CommandName="AddNew" Height="33px" ImageUrl="~/Images/addnew.jpg" Width="46px" />
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="Edit">Edit</asp:LinkButton>
                            &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="ibtnDelete" runat="server" CommandName="Delete" Height="25px" ImageUrl="~/Images/delete.jpg" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>


            <br />
            <br />
            <asp:Label ID="lblResult" runat="server" Text="Label"></asp:Label>


        </div>
    </form>
</body>
</html>
