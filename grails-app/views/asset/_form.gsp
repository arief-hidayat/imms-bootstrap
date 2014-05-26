<%@ page import="com.hida.imms.Asset" %>



<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'code', 'error')} required">
	<label for="code">
		<g:message code="asset.code.label" default="Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="code" maxlength="50" required="" value="${assetInstance?.code}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="asset.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="150" required="" value="${assetInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'assetGroup', 'error')} ">
	<label for="assetGroup">
		<g:message code="asset.assetGroup.label" default="Asset Group" />
		
	</label>
	<g:textField name="assetGroup" value="${assetInstance?.assetGroup}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'locationCd', 'error')} required">
	<label for="locationCd">
		<g:message code="asset.locationCd.label" default="Location Cd" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="locationCd" required="" value="${assetInstance?.locationCd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'originalCost', 'error')} required">
	<label for="originalCost">
		<g:message code="asset.originalCost.label" default="Original Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="originalCost" value="${fieldValue(bean: assetInstance, field: 'originalCost')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'note', 'error')} ">
	<label for="note">
		<g:message code="asset.note.label" default="Note" />
		
	</label>
	<g:textField name="note" value="${assetInstance?.note}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="asset.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${assetInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'parentCd', 'error')} ">
	<label for="parentCd">
		<g:message code="asset.parentCd.label" default="Parent Cd" />
		
	</label>
	<g:textField name="parentCd" value="${assetInstance?.parentCd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'assetType', 'error')} required">
	<label for="assetType">
		<g:message code="asset.assetType.label" default="Asset Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="assetType" required="" value="${assetInstance?.assetType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'baseDate', 'error')} required">
	<label for="baseDate">
		<g:message code="asset.baseDate.label" default="Base Date" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'depreciationInterval', 'error')} required">
	<label for="depreciationInterval">
		<g:message code="asset.depreciationInterval.label" default="Depreciation Interval" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="depreciationInterval" required="" value="${assetInstance?.depreciationInterval}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'depreciationType', 'error')} required">
	<label for="depreciationType">
		<g:message code="asset.depreciationType.label" default="Depreciation Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="depreciationType" required="" value="${assetInstance?.depreciationType}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'manufacturer', 'error')} required">
	<label for="manufacturer">
		<g:message code="asset.manufacturer.label" default="Manufacturer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="manufacturer" required="" value="${assetInstance?.manufacturer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'modelNo', 'error')} required">
	<label for="modelNo">
		<g:message code="asset.modelNo.label" default="Model No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="modelNo" required="" value="${assetInstance?.modelNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'originalCostUnit', 'error')} required">
	<label for="originalCostUnit">
		<g:message code="asset.originalCostUnit.label" default="Original Cost Unit" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="originalCostUnit" required="" value="${assetInstance?.originalCostUnit}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'priority', 'error')} required">
	<label for="priority">
		<g:message code="asset.priority.label" default="Priority" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="priority" required="" value="${assetInstance?.priority}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'purchaseDate', 'error')} required">
	<label for="purchaseDate">
		<g:message code="asset.purchaseDate.label" default="Purchase Date" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'serialNo', 'error')} required">
	<label for="serialNo">
		<g:message code="asset.serialNo.label" default="Serial No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="serialNo" required="" value="${assetInstance?.serialNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="asset.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="status" required="" value="${assetInstance?.status}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'vendorCd', 'error')} required">
	<label for="vendorCd">
		<g:message code="asset.vendorCd.label" default="Vendor Cd" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="vendorCd" required="" value="${assetInstance?.vendorCd}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'warrantyEndDate', 'error')} required">
	<label for="warrantyEndDate">
		<g:message code="asset.warrantyEndDate.label" default="Warranty End Date" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'warrantyStartDate', 'error')} required">
	<label for="warrantyStartDate">
		<g:message code="asset.warrantyStartDate.label" default="Warranty Start Date" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

