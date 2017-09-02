<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1) { %>

<div class="component filter-form-wrapper">
	<div class="panel-group" id="<%=UniqueDomId("filter-accordion")%>" role="tablist" aria-multiselectable="true">
		<div class="panel active">
			<div class="panel-heading" role="tab" id="heading-filter-one">
				<p><strong>Category: </strong>filter one, filter two, filter three <a data-toggle="collapse" data-parent="#<%=UniqueDomId("filter-accordion")%>" href="#<%=UniqueDomId("filter-form-panel")%>" aria-expanded="true" aria-controls="<%=UniqueDomId("filter-form")%>"><strong>(edit)</strong></a></p>
			</div>
		</div>
		<div id="<%=UniqueDomId("filter-form-panel")%>" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading-filter-one">
			<div class="panel-body">
				<div id="<%=UniqueDomId("filter-form")%>" class="form-filter">
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb1a")%>" />
						<label for="<%=UniqueDomId("cb1a")%>"><span class="icon"></span>Option 1</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb1b")%>" />
						<label for="<%=UniqueDomId("cb1b")%>"><span class="icon"></span>Option 2</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb1c")%>" />
						<label for="<%=UniqueDomId("cb1c")%>"><span class="icon"></span>Option 3</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb1d")%>" />
						<label for="<%=UniqueDomId("cb1d")%>"><span class="icon"></span>Option 4</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb1e")%>" />
						<label for="<%=UniqueDomId("cb1e")%>"><span class="icon"></span>Option 5</label>
					</div>
					<input type="submit" class="btn btn-secondary btn-sm" value="Apply Filter" />
					<input type="reset" class="btn btn-sm" value="Cancel" data-toggle="collapse" data-parent="#<%=UniqueDomId("filter-accordion")%>" href="#<%=UniqueDomId("filter-form-panel")%>" aria-expanded="true" aria-controls="<%=UniqueDomId("filter-form")%>" />
				</div>
			</div>
		</div>
	</div>
</div>

<% } else if (Variation == 2) { %>

<div class="component filter-form-wrapper">
	<div class="panel-group" id="<%=UniqueDomId("filter-accordion")%>" role="tablist" aria-multiselectable="true">
		<div class="panel active">
			<div class="panel-heading" role="tab" id="heading-filter-one">
				<p><strong>Category: </strong>filter one, filter two, filter three <a data-toggle="collapse" data-parent="#<%=UniqueDomId("filter-accordion")%>" href="#<%=UniqueDomId("filter-form-panel")%>" aria-expanded="true" aria-controls="<%=UniqueDomId("filter-form")%>"><strong>(edit)</strong></a></p>
			</div>
		</div>
		<div id="<%=UniqueDomId("filter-form-panel")%>" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading-filter-one">
			<div class="panel-body">
				<div id="<%=UniqueDomId("filter-form")%>" class="form-filter">
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb2a")%>" />
						<label for="<%=UniqueDomId("cb2a")%>"><span class="icon"></span>Option 1</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb2b")%>" />
						<label for="<%=UniqueDomId("cb2b")%>"><span class="icon"></span>Option 2</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb2c")%>" />
						<label for="<%=UniqueDomId("cb2c")%>"><span class="icon"></span>Option 3</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb2d")%>" />
						<label for="<%=UniqueDomId("cb2d")%>"><span class="icon"></span>Option 4</label>
					</div>
					<div class="filter-checkbox-wrapper form-group">
						<input type="checkbox" id="<%=UniqueDomId("cb2e")%>" />
						<label for="<%=UniqueDomId("cb2e")%>"><span class="icon"></span>Option 5</label>
					</div>
					<input type="submit" class="btn-secondary btn-sm" value="Apply Filter" />
					<input type="reset" class="btn-deemphasized btn-sm" value="Cancel" data-toggle="collapse" data-parent="#<%=UniqueDomId("filter-accordion")%>" href="#<%=UniqueDomId("filter-form-panel")%>" aria-expanded="true" aria-controls="<%=UniqueDomId("filter-form")%>" />
				</div>
			</div>
		</div>
	</div>
</div>

<% } %>