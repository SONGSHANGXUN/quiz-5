<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gept_word.aspx.cs" Inherits="gept_word" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:MultiView ID="CBF110056_MV1" ActiveViewIndex="0" runat="server">
        <asp:View ID="CBF110056_View1" runat="server">
            <asp:GridView ID="CBF110056_GV1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnRowDataBound="CBF110056_GV1_RowDataBound" OnSelectedIndexChanged="CBF110056_GV1_SelectedIndexChanged" Width="98%">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="編輯"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('你確定要刪除嗎?')" Text="刪除"></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle Wrap="False" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="word" HeaderText="word" SortExpression="word" />
                    <asp:BoundField DataField="ch_explanation" HeaderText="ch_explanation" SortExpression="ch_explanation" ItemStyle-Wrap="False" >
                    <ItemStyle Wrap="False" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sentence" HeaderText="sentence" SortExpression="sentence" >
                    <ItemStyle Width="98%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="sno" HeaderText="sno" SortExpression="sno" />
                    <asp:BoundField DataField="level" HeaderText="level" SortExpression="level" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" Width="98%" Wrap="False" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Wrap="False" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" DeleteCommand="DELETE FROM [gept_words$] WHERE [Id] = @Id" InsertCommand="INSERT INTO [gept_words$] ([Id], [word], [ch_explanation], [sentence], [sno], [level], [frequency], [weight]) VALUES (@Id, @word, @ch_explanation, @sentence, @sno, @level, @frequency, @weight)" SelectCommand="SELECT * FROM [gept_words$]" UpdateCommand="UPDATE [gept_words$] SET [word] = @word, [ch_explanation] = @ch_explanation, [sentence] = @sentence, [sno] = @sno, [level] = @level, [frequency] = @frequency, [weight] = @weight WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Double" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Id" Type="Double" />
                    <asp:Parameter Name="word" Type="String" />
                    <asp:Parameter Name="ch_explanation" Type="String" />
                    <asp:Parameter Name="sentence" Type="String" />
                    <asp:Parameter Name="sno" Type="String" />
                    <asp:Parameter Name="level" Type="Double" />
                    <asp:Parameter Name="frequency" Type="Double" />
                    <asp:Parameter Name="weight" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="word" Type="String" />
                    <asp:Parameter Name="ch_explanation" Type="String" />
                    <asp:Parameter Name="sentence" Type="String" />
                    <asp:Parameter Name="sno" Type="String" />
                    <asp:Parameter Name="level" Type="Double" />
                    <asp:Parameter Name="frequency" Type="Double" />
                    <asp:Parameter Name="weight" Type="Double" />
                    <asp:Parameter Name="Id" Type="Double" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            請點選單字來查閱中文解釋<br />
            <asp:DropDownList ID="CBF110056_DDL1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="word" DataValueField="ch_explanation">
            </asp:DropDownList>
            <asp:Button ID="CBF110056_PreviousButton" runat="server" Text="PreviousButton" Enabled="False" />
            <asp:Button ID="CBF110056_NextButton" runat="server" Text="NextButton" />
            <asp:Button ID="CBF110056_testBtn" runat="server" Text="測驗去" />    
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DatabaseConnectionString1 %>" SelectCommand="SELECT top 10 * FROM [gept_words]"></asp:SqlDataSource>
            <br />
            <asp:Literal ID="CBF110056_cambridge" runat="server"></asp:Literal>
            <br />
            <br />
            <a href="https://github.com/wfhsiao/web_database_programming/blob/master/gept_words_reflections.html">GitHub心得</a>&nbsp; <a href="gept_words_reflections.html">本地端心得網頁</a>
        </asp:View>
        
        <asp:View ID="CBF110056_View2" runat="server">        
            <asp:Literal ID="CBF110056_ch_hint" runat="server"></asp:Literal>
            <asp:TextBox ID="CBF110056_input" runat="server" onclick="this.setSelectionRange(0,999)" onfocus="this.setSelectionRange(0,999)" AutoComplete="off"></asp:TextBox>
            <asp:Button ID="CBF110056_nextQBtn" runat="server" Text="下一題" />
            <br />
            請輸入完整單字(底線是用來提示有幾個字元, 如果消失了可以移動滑鼠至方格上來查看.)
        </asp:View>        
    </asp:MultiView>
    </div>
    </form>
</body>
</html>
