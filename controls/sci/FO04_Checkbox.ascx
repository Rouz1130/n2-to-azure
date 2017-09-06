<%@ Control Language="C#" Inherits="XOMFL.CommonComponents.Controls.VariantControlBase" %>

<% if (Variation == 1)
    { %>

<div class="component checkboxes">

    <h4 class="see-more" data-toggle="collapse" data-target="#filter-panel" aria-expanded="true">Filter</h4>
    <div id="filter-panel" class="filter-panel collapse in">
        
        <p>Select boxes below to reduce the number of results</p>

        <fieldset>
            <legend>Date of Death</legend>
            <div class="form-group">
                <input type="checkbox" id="<%=UniqueDomId("cb1a")%>" />
                <label for="<%=UniqueDomId("cb1a")%>"><span class="icon"></span>Option 1</label>
            </div>
            <div class="form-group">
                <input type="checkbox" id="<%=UniqueDomId("cb1b")%>" />
                <label for="<%=UniqueDomId("cb1b")%>"><span class="icon"></span>Option 2</label>
            </div>
            <div class="form-group">
                <input type="checkbox" id="<%=UniqueDomId("cb1c")%>" />
                <label for="<%=UniqueDomId("cb1c")%>"><span class="icon"></span>Option 3</label>
            </div>
            <div class="form-group">

                <input type="checkbox" id="<%=UniqueDomId("cb1d")%>" />
                <label for="<%=UniqueDomId("cb1d")%>"><span class="icon"></span>Option 1</label>
            </div>


            <div id="<%=UniqueDomId("cb-panel")%>" class="panel-collapse collapse">
                <div class="form-group">
                    <input type="checkbox" id="<%=UniqueDomId("cb1e")%>" />
                    <label for="<%=UniqueDomId("cb1e")%>"><span class="icon"></span>Option 2</label>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="<%=UniqueDomId("cb1f")%>" />
                    <label for="<%=UniqueDomId("cb1f")%>"><span class="icon"></span>Option 3</label>
                </div>


            </div>
            <a class="see-more collapsed" data-toggle="collapse" href="#<%=UniqueDomId("cb-panel")%>" aria-expanded="false"><span class="more">See more</span><span class="less">See less</span></a>
        </fieldset>
        
         <fieldset>
            <legend>Date of Birth</legend>
            <div class="form-group">
                <input type="checkbox" id="<%=UniqueDomId("cb3a")%>" />
                <label for="<%=UniqueDomId("cb1a")%>"><span class="icon"></span>Option 1</label>
            </div>
            <div class="form-group">
                <input type="checkbox" id="<%=UniqueDomId("cb3b")%>" />
                <label for="<%=UniqueDomId("cb1b")%>"><span class="icon"></span>Option 2</label>
            </div>
            <div class="form-group">
                <input type="checkbox" id="<%=UniqueDomId("cb3c")%>" />
                <label for="<%=UniqueDomId("cb1c")%>"><span class="icon"></span>Option 3</label>
            </div>
            <div class="form-group">

                <input type="checkbox" id="<%=UniqueDomId("cb2d")%>" />
                <label for="<%=UniqueDomId("cb1d")%>"><span class="icon"></span>Option 1</label>
            </div>


            <div id="<%=UniqueDomId("cb-panel2")%>" class="panel-collapse collapse">
                <div class="form-group">
                    <input type="checkbox" id="<%=UniqueDomId("cb2e")%>" />
                    <label for="<%=UniqueDomId("cb1e")%>"><span class="icon"></span>Option 2</label>
                </div>
                <div class="form-group">
                    <input type="checkbox" id="<%=UniqueDomId("cb2f")%>" />
                    <label for="<%=UniqueDomId("cb1f")%>"><span class="icon"></span>Option 3</label>
                </div>


            </div>
            <a class="see-more collapsed" data-toggle="collapse" href="#<%=UniqueDomId("cb-panel2")%>" aria-expanded="false"><span class="more">See more</span><span class="less">See less</span></a>
        </fieldset>

    </div>

</div>

<% }
    else if (Variation == 2)
    { %>

<div class="component checkboxes form-inline">
    <div class="form-group">
        <input type="checkbox" id="<%=UniqueDomId("cb2a")%>" />
        <label for="<%=UniqueDomId("cb2a")%>"><span class="icon"></span>Option 1</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="<%=UniqueDomId("cb2b")%>" />
        <label for="<%=UniqueDomId("cb2b")%>"><span class="icon"></span>Option 2</label>
    </div>
    <div class="form-group">
        <input type="checkbox" id="<%=UniqueDomId("cb2c")%>" />
        <label for="<%=UniqueDomId("cb2c")%>"><span class="icon"></span>Option 3</label>
    </div>
</div>

<% } %>