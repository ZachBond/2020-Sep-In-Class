﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageAlbums.aspx.cs" Inherits="WebApp.Admin.ManageAlbums" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h1 class="page-header">Manage Albums</h1>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p>Our ListView control is a data-bound control (like GridView), but we have a lot more flexibility in how the content in the Listview is displayed (or "rendered") in the browser.</p>
            <style>
                .albums {
                    display: grid;
                    grid-template-columns: repeat(4, 1fr);
                    grid-gap: 5px;
                }

                    .albums h2 {
                        grid-column: 1 / 5;
                        background-color: cadetblue;
                    }
                    .albums > div {
                        padding: 3px;
                        border: solid thin cadetblue;
                    }
            </style>
            <asp:ListView ID="AlbumsListView" runat="server"
                DataSourceID="AlbumsDataSource"
                ItemType="ChinookTunes.ViewModels.AlbumInfo">
                <EditItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:TextBox Text='<%# Bind("ID") %>' runat="server" ID="IDTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("ArtistID") %>' runat="server" ID="ArtistIDTextBox" /></td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                            <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                        </td>
                        <td>
                            <asp:TextBox Text='<%# Bind("ID") %>' runat="server" ID="IDTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("Title") %>' runat="server" ID="TitleTextBox" /></td>
                        <td>
                            <asp:TextBox Text='<%# Bind("ArtistID") %>' runat="server" ID="ArtistIDTextBox" /></td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div>
                        <b><%# Item.Title %></b>
                        <blockquote>by <i><%# Item.ArtistName %></i></blockquote>
                    </div>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="albums" runat="server" id="itemPlaceholderContainer">
                        <h2>Current Albums</h2>
                        <div runat="server" id="itemPlaceholder"></div>
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Label Text='<%# Eval("ID") %>' runat="server" ID="IDLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("Title") %>' runat="server" ID="TitleLabel" /></td>
                        <td>
                            <asp:Label Text='<%# Eval("ArtistID") %>' runat="server" ID="ArtistIDLabel" /></td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:ObjectDataSource ID="AlbumsDataSource" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="ListAlbums" TypeName="ChinookTunes.BLL.AlbumManagement"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>
