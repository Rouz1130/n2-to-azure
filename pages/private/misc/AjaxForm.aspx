<%@ Page Title="AJAX Form" CodeBehind="AjaxForm.aspx.cs" Inherits="XOMFL.CommonComponents.Pages.AjaxForm" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent">
	<h1>AJAX Form</h1>

	<div class="row">
		<div class="col-md-12 col-4">

			<a href="#lightbox-form-1" type="button" class="btn btn-primary" data-toggle="modal" data-target="#lightbox-form-1">
				Contact Us
			</a>

			<div class="modal fade ajax-form" id="lightbox-form-1" tabindex="-1" role="dialog" aria-labelledby="lightbox-form-1-label" aria-hidden="true" data-form-action="<%= Request.Path %>">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<a type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></a>
							<h2 class="modal-title" id="lightbox-form-1-label">Contact Us</h2>
						</div>
						<div class="modal-body">
							Test tips:
							<ul>
								<li>Leave at least one text field blank to trigger a client-side validation error</li>
								<li>Enter a first name of "error" to trigger a server error</li>
							</ul>
							<div class="form-body">
								<div class="form-group">
									<label for="first-name">First name</label>
									<input name="first-name" class="form-control" required maxlength="30" />
								</div>
								<div class="form-group">
									<label for="last-name">Last name</label>
									<input name="last-name" class="form-control" required maxlength="30" />
								</div>
								<div class="form-group">
									<label for="gender">Gender</label>
									<select name="gender" class="form-control">
										<option value="">(Select one)</option>
										<option value="M">Male</option>
										<option value="F">Female</option>
									</select>
								</div>
								<div class="form-group">
									<label for="gender">Favorite color</label>
									<select id="ddlColors" runat="server" ClientIDMode="static" class="form-control"></select>
								</div>
								<div class="radio-buttons form-inline required" data-required-message="Please select an option.">
									<label for="gender">Options</label>
									<div class="form-group">
										<input type="radio" id="rb2a" name="optx" value="1" data-sync-name="false" />
										<label for="rb2a"><span class="icon"></span>Option 1</label>
									</div>
									<div class="form-group">
										<input type="radio" id="rb2b" name="optx" value="2" data-sync-name="false" />
										<label for="rb2b"><span class="icon"></span>Option 2</label>
									</div>
									<div class="form-group">
										<input type="radio" id="rb2c" name="optx" value="3" data-sync-name="false" />
										<label for="rb2c"><span class="icon"></span>Option 3</label>
									</div>
								</div>
							</div>
							<div class="form-success">
								Yay! The needful occurred.
							</div>
							<div class="form-failure">
								Bummer. An error occurred.
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary form-submit">Submit</button>
							<button type="button" class="btn btn-link btn-cancel form-cancel" data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary form-done" data-dismiss="modal">Done</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</asp:Content>
