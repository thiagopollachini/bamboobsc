<%@page import="com.netsteadfast.greenstep.base.Constants"%>
<%@page import="com.netsteadfast.greenstep.util.ApplicationSiteUtils"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="gs" uri="http://www.gsweb.org/controller/tag" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String mainSysBasePath = ApplicationSiteUtils.getBasePath(Constants.getMainSystem(), request);

%>
<!doctype html>
<html itemscope="itemscope" itemtype="http://schema.org/WebPage">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <base href="<%=basePath%>">
    
    <title>bambooCORE</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="bambooCORE">
	<meta http-equiv="description" content="bambooCORE">
	
<style type="text/css">

.btnExcelIcon {
  	background-image: url(./icons/excel.png);
  	background-repeat: no-repeat;
  	width: 16px;
  	height: 16px;
  	text-align: center;
}

.btnPdfIcon {
  	background-image: url(./icons/application-pdf.png);
  	background-repeat: no-repeat;
  	width: 16px;
  	height: 16px;
  	text-align: center;
}

</style>

<script type="text/javascript">

var BSC_PROG003D0009Q_fieldsId = new Object();
BSC_PROG003D0009Q_fieldsId['visionOid'] 					= 'BSC_PROG003D0009Q_visionOid';
BSC_PROG003D0009Q_fieldsId['frequency'] 					= 'BSC_PROG003D0009Q_frequency';
BSC_PROG003D0009Q_fieldsId['startYearDate'] 				= 'BSC_PROG003D0009Q_startYearDate';
BSC_PROG003D0009Q_fieldsId['endYearDate'] 					= 'BSC_PROG003D0009Q_endYearDate';
BSC_PROG003D0009Q_fieldsId['startDate'] 					= 'BSC_PROG003D0009Q_startDate';
BSC_PROG003D0009Q_fieldsId['endDate'] 						= 'BSC_PROG003D0009Q_endDate';
BSC_PROG003D0009Q_fieldsId['measureDataOrganizationOid'] 	= 'BSC_PROG003D0009Q_measureDataOrganizationOid';
BSC_PROG003D0009Q_fieldsId['measureDataEmployeeOid'] 		= 'BSC_PROG003D0009Q_measureDataEmployeeOid';


function BSC_PROG003D0009Q_setDataForValue() {
	dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set("value", _gscore_please_select_id);
	dijit.byId('BSC_PROG003D0009Q_measureDataEmployeeOid').set("value", _gscore_please_select_id);	
	dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set('readOnly', true);
	dijit.byId('BSC_PROG003D0009Q_measureDataEmployeeOid').set('readOnly', true);
	var dataFor = dijit.byId("BSC_PROG003D0009Q_dataFor").get("value");
	if ('employee' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataEmployeeOid').set('readOnly', false);
	}
	if ('organization' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set('readOnly', false);
	}	
}

function BSC_PROG003D0009Q_setMeasureDataOrgaValue() {
	var dataFor = dijit.byId("BSC_PROG003D0009Q_dataFor").get("value");
	if ('all' == dataFor || 'employee' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set("value", _gscore_please_select_id);
	}
}

function BSC_PROG003D0009Q_setMeasureDataEmplValue() {
	var dataFor = dijit.byId("BSC_PROG003D0009Q_dataFor").get("value");
	if ('all' == dataFor || 'organization' == dataFor) {
		dijit.byId('BSC_PROG003D0009Q_measureDataOrganizationOid').set("value", _gscore_please_select_id);
	}	
}

function BSC_PROG003D0009Q_setFrequencyValue() {
	var frequency = dijit.byId("BSC_PROG003D0009Q_frequency").get("value");
	dijit.byId("BSC_PROG003D0009Q_startYearDate").set("readOnly", true);
	dijit.byId("BSC_PROG003D0009Q_endYearDate").set("readOnly", true);
	dijit.byId("BSC_PROG003D0009Q_startDate").set("readOnly", true);
	dijit.byId("BSC_PROG003D0009Q_endDate").set("readOnly", true);
	if ( frequency == _gscore_please_select_id ) {
		return;
	}
	if ('1' == frequency || '2' == frequency || '3' == frequency) { // day, week, month
		dijit.byId("BSC_PROG003D0009Q_startDate").set("readOnly", false);
		dijit.byId("BSC_PROG003D0009Q_endDate").set("readOnly", false);		
	} else { // quarter, half-year, year
		dijit.byId("BSC_PROG003D0009Q_startYearDate").set("readOnly", false);
		dijit.byId("BSC_PROG003D0009Q_endYearDate").set("readOnly", false);				
	}
}


function BSC_PROG003D0009Q_query() {
	BSC_PROG003D0009Q_clearContent();
	setFieldsBackgroundDefault(BSC_PROG003D0009Q_fieldsId);
	setFieldsNoticeMessageLabelDefault(BSC_PROG003D0009Q_fieldsId);
	xhrSendParameter(
			'${basePath}/bsc.dashboardNewContentAction.action', 
			{ 
				'fields.visionOid' 					: 	dijit.byId("BSC_PROG003D0009Q_visionOid").get("value"),
				'fields.startYearDate'				:	dijit.byId("BSC_PROG003D0009Q_startYearDate").get('displayedValue'),
				'fields.endYearDate'				:	dijit.byId("BSC_PROG003D0009Q_endYearDate").get('displayedValue'),
				'fields.startDate'					:	dijit.byId("BSC_PROG003D0009Q_startDate").get('displayedValue'),
				'fields.endDate'					:	dijit.byId("BSC_PROG003D0009Q_endDate").get('displayedValue'),
				'fields.dataFor'					:	dijit.byId("BSC_PROG003D0009Q_dataFor").get("value"),
				'fields.measureDataOrganizationOid'	:	dijit.byId("BSC_PROG003D0009Q_measureDataOrganizationOid").get("value"),
				'fields.measureDataEmployeeOid'		:	dijit.byId("BSC_PROG003D0009Q_measureDataEmployeeOid").get("value"),
				'fields.frequency'					:	dijit.byId("BSC_PROG003D0009Q_frequency").get("value")
			}, 
			'json', 
			_gscore_dojo_ajax_timeout,
			_gscore_dojo_ajax_sync, 
			true, 
			function(data) {
				if ('Y' != data.success) {
					setFieldsBackgroundAlert(data.fieldsId, BSC_PROG003D0009Q_fieldsId);
					setFieldsNoticeMessageLabel(data.fieldsId, data.fieldsMessage, BSC_PROG003D0009Q_fieldsId);
					alertDialog(_getApplicationProgramNameById('${programId}'), data.message, function(){}, data.success);
					return;
				}
				dijit.byId("BSC_PROG003D0009Q_startDate").set("displayedValue", data.startDate);
				dijit.byId("BSC_PROG003D0009Q_endDate").set("displayedValue", data.endDate);
				
				// Vision
				BSC_PROG003D0009Q_showTableContentForVision( data );
				
				// Perspectives
				BSC_PROG003D0009Q_showTableContent1( data );
				BSC_PROG003D0009Q_showChartForPerspectives( data );
				BSC_PROG003D0009Q_showChartForPerspectivesDateRange( data );
				
				// Objectives
				BSC_PROG003D0009Q_showTableContent2( data );
				BSC_PROG003D0009Q_showChartForObjectives( data );
				BSC_PROG003D0009Q_showChartForObjectivesDateRange( data );
				
				// KPIs
				BSC_PROG003D0009Q_showTableContent3( data );
				BSC_PROG003D0009Q_showChartForKpis( data );
				BSC_PROG003D0009Q_showChartForKpiDateRange( data );				
				
			}, 
			function(error) {
				alert(error);
			}
	);		
}


function BSC_PROG003D0009Q_generateExport() {
	
	// Perspectives
	var perspectiveGaugeDatas = [];
	var perspectiveDateRangeChartPngData = null;
	if ( '' != $('#BSC_PROG003D0009Q_perspectives_daterange_container').html() ) {
		var dateRangeSvg = $('#BSC_PROG003D0009Q_perspectives_daterange_container').highcharts().getSVG();
		perspectiveDateRangeChartPngData = viewPage.getSVGImage2CanvasToDataUrlPNGfromData( dateRangeSvg );
	}
	dojo.query("div").forEach(function(node){
		if (node.id!=null && node.id.indexOf('BSC_PROG003D0009Q_perspectives_container_')>-1) {
			var gaugeChartPngData = '';
			var gaugeSvg = $('#' + node.id ).highcharts().getSVG();
			gaugeChartPngData = viewPage.getSVGImage2CanvasToDataUrlPNGfromData( gaugeSvg );
			perspectiveGaugeDatas.push({
				id: node.id,
				data: gaugeChartPngData
			});			
			
		}	
	});		
	if ( perspectiveDateRangeChartPngData == null ) {
		perspectiveDateRangeChartPngData = '';
	}
	
	// Objectives
	var objectiveGaugeDatas = [];
	var objectiveDateRangeChartPngData = null;
	if ( '' != $('#BSC_PROG003D0009Q_objectives_daterange_container').html() ) {
		var dateRangeSvg = $('#BSC_PROG003D0009Q_objectives_daterange_container').highcharts().getSVG();
		objectiveDateRangeChartPngData = viewPage.getSVGImage2CanvasToDataUrlPNGfromData( dateRangeSvg );
	}
	dojo.query("div").forEach(function(node){
		if (node.id!=null && node.id.indexOf('BSC_PROG003D0009Q_objectives_container_')>-1) {
			var gaugeChartPngData = '';
			var gaugeSvg = $('#' + node.id ).highcharts().getSVG();
			gaugeChartPngData = viewPage.getSVGImage2CanvasToDataUrlPNGfromData( gaugeSvg );
			objectiveGaugeDatas.push({
				id: node.id,
				data: gaugeChartPngData
			});			
			
		}	
	});		
	if ( objectiveDateRangeChartPngData == null ) {
		objectiveDateRangeChartPngData = '';
	}	
	
	// KPIs
	var kpiGaugeDatas = [];
	var kpiDateRangeChartPngData = null;
	if ( '' != $('#BSC_PROG003D0009Q_kpis_daterange_container').html() ) {
		var dateRangeSvg = $('#BSC_PROG003D0009Q_kpis_daterange_container').highcharts().getSVG();
		kpiDateRangeChartPngData = viewPage.getSVGImage2CanvasToDataUrlPNGfromData( dateRangeSvg );
	}
	dojo.query("div").forEach(function(node){
		if (node.id!=null && node.id.indexOf('BSC_PROG003D0009Q_kpis_container_')>-1) {
			var gaugeChartPngData = '';
			var gaugeSvg = $('#' + node.id ).highcharts().getSVG();
			gaugeChartPngData = viewPage.getSVGImage2CanvasToDataUrlPNGfromData( gaugeSvg );
			kpiGaugeDatas.push({
				id: node.id,
				data: gaugeChartPngData
			});			
			
		}	
	});		
	if ( kpiDateRangeChartPngData == null ) {
		kpiDateRangeChartPngData = '';
	}	
	
	
	if (null == perspectiveGaugeDatas || perspectiveGaugeDatas.length < 1) {
		alertDialog(_getApplicationProgramNameById('${programId}'), '<s:property value="getText('MESSAGE.BSC_PROG003D0009Q_msg1')" escapeJavaScript="true"/>', function(){}, 'Y');
		showFieldsNoticeMessageLabel('BSC_PROG003D0009Q_visionOid'+_gscore_inputfieldNoticeMsgLabelIdName, '<s:property value="getText('MESSAGE.BSC_PROG003D0009Q_msg1')" escapeJavaScript="true"/>');		
		return;
	}
	
	xhrSendParameter(
			'${basePath}/bsc.dashboardNewExcelAction.action', 
			{ 
				'fields.visionOid' 					: 	dijit.byId("BSC_PROG003D0009Q_visionOid").get("value"),
				'fields.startYearDate'				:	dijit.byId("BSC_PROG003D0009Q_startYearDate").get('displayedValue'),
				'fields.endYearDate'				:	dijit.byId("BSC_PROG003D0009Q_endYearDate").get('displayedValue'),
				'fields.startDate'					:	dijit.byId("BSC_PROG003D0009Q_startDate").get('displayedValue'),
				'fields.endDate'					:	dijit.byId("BSC_PROG003D0009Q_endDate").get('displayedValue'),
				'fields.dataFor'					:	dijit.byId("BSC_PROG003D0009Q_dataFor").get("value"),
				'fields.measureDataOrganizationOid'	:	dijit.byId("BSC_PROG003D0009Q_measureDataOrganizationOid").get("value"),
				'fields.measureDataEmployeeOid'		:	dijit.byId("BSC_PROG003D0009Q_measureDataEmployeeOid").get("value"),
				'fields.frequency'					:	dijit.byId("BSC_PROG003D0009Q_frequency").get("value"),
				'fields.perspectiveDateRangeChartPngData'	:	perspectiveDateRangeChartPngData,
				'fields.perspectiveGaugeDatas'	: JSON.stringify( { 'gaugeMapList' : perspectiveGaugeDatas } ),
				'fields.objectiveDateRangeChartPngData'	:	objectiveDateRangeChartPngData,
				'fields.objectiveGaugeDatas'	: JSON.stringify( { 'gaugeMapList' : objectiveGaugeDatas } )	,
				'fields.kpiDateRangeChartPngData'	:	kpiDateRangeChartPngData,
				'fields.kpiGaugeDatas'	: JSON.stringify( { 'gaugeMapList' : kpiGaugeDatas } )					
			}, 
			'json', 
			_gscore_dojo_ajax_timeout,
			_gscore_dojo_ajax_sync, 
			true, 
			function(data) {
				if ('Y' != data.success) {
					setFieldsBackgroundAlert(data.fieldsId, BSC_PROG003D0009Q_fieldsId);
					setFieldsNoticeMessageLabel(data.fieldsId, data.fieldsMessage, BSC_PROG003D0009Q_fieldsId);
					alertDialog(_getApplicationProgramNameById('${programId}'), data.message, function(){}, data.success);
					return;
				}
				openCommonLoadUpload( 'download', data.uploadOid, { } );
			}, 
			function(error) {
				alert(error);
			}
	);		
	
}



// =========================================================================================================
// Begin - Vision
// =========================================================================================================
function BSC_PROG003D0009Q_showTableContentForVision( data ) {
	var vision = data.vision;
	var t = '';
	var c = 0;
	t += '<table width="1100px" cellspacing="1" cellpadding="1" bgcolor="' + data.backgroundColor + '" style="border:1px ' + data.backgroundColor  + ' solid; border-radius: 5px;" >';
	
	var headColspan = 2 + vision.dateRangeScores.length;
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="left" width="320px"><font color="' + data.fontColor + '"><b>Vision</b></font></td>';	
	t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Score</b></font></td>';
	for ( var r in vision.dateRangeScores ) {
		t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>' + vision.dateRangeScores[r].date + '</b></font></td>';					
	}
	t += '</tr>';	
	t += '<tr>';
	t += '<td bgcolor="#ffffff" align="left">' + vision.title + '</td>';
	t += '<td bgcolor="' + vision.bgColor + '" align="center"><font color="' + vision.fontColor + '">' + BSC_PROG003D0009Q_parseScore(vision.score) + '</font></td>';	
	for ( var r in vision.dateRangeScores ) {
		t += '<td bgcolor="' + vision.dateRangeScores[r].bgColor + '" align="center"><font color="' + vision.dateRangeScores[r].fontColor + '">' + BSC_PROG003D0009Q_parseScore(vision.dateRangeScores[r].score) + '</font></td>';					
	}
	t += '</tr>';			
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="left" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>Frequency&nbsp;:&nbsp;' + data.displayFrequency + '&nbsp;&nbsp;date range&nbsp;:&nbsp;' + data.displayDateRange1 + '&nbsp;~&nbsp;' + data.displayDateRange2 + '&nbsp;&nbsp;Measure data type&nbsp;:&nbsp;' + data.measureDataTypeForTitle + '</b></font></td>';
	t += '</tr>';	
	t += '</table>';
	dojo.byId("BSC_PROG003D0009Q_content_vision").innerHTML = t;	
}
// =========================================================================================================
// End - Vision
// =========================================================================================================	

	
	
	
// =========================================================================================================
// Begin - Perspectives
// =========================================================================================================
function BSC_PROG003D0009Q_showTableContent1( data ) {
	var vision = data.vision;
	var t = '';
	var c = 0;
	t += '<table width="1100px" cellspacing="1" cellpadding="1" bgcolor="' + data.backgroundColor + '" style="border:1px ' + data.backgroundColor  + ' solid; border-radius: 5px;" >';
	
	var headColspan = 4 + vision.perspectives[0].dateRangeScores.length;
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="center" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>' + data.vision.title + '</b></font></td>';
	t += '</tr>';
	
	for (var p in vision.perspectives) {
		var perspective = vision.perspectives[p];
		if ( c == 0 ) {
			t += '<tr>';
			t += '<td bgcolor="' + data.backgroundColor + '" align="left" width="320px"><font color="' + data.fontColor + '"><b>' + data.perspectiveTitle + '</b></font></td>';
			t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Target</b></font></td>';
			t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Minimum</b></font></td>';	
			t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Score</b></font></td>';
			for ( var r in perspective.dateRangeScores ) {
				t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>' + perspective.dateRangeScores[r].date + '</b></font></td>';					
			}
			t += '</tr>';			
		}
		t += '<tr>';
		t += '<td bgcolor="#ffffff" align="left">' + perspective.name + '</td>';
		t += '<td bgcolor="#ffffff" align="left">' + perspective.target + '</td>';
		t += '<td bgcolor="#ffffff" align="left">' + perspective.min + '</td>';	
		t += '<td bgcolor="' + perspective.bgColor + '" align="center"><font color="' + perspective.fontColor + '">' + BSC_PROG003D0009Q_parseScore(perspective.score) + '</font></td>';	
		for ( var r in perspective.dateRangeScores ) {
			t += '<td bgcolor="' + perspective.dateRangeScores[r].bgColor + '" align="center"><font color="' + perspective.dateRangeScores[r].fontColor + '">' + BSC_PROG003D0009Q_parseScore(perspective.dateRangeScores[r].score) + '</font></td>';					
		}
		t += '</tr>';			
		c++;
	}
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="left" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>Frequency&nbsp;:&nbsp;' + data.displayFrequency + '&nbsp;&nbsp;date range&nbsp;:&nbsp;' + data.displayDateRange1 + '&nbsp;~&nbsp;' + data.displayDateRange2 + '&nbsp;&nbsp;Measure data type&nbsp;:&nbsp;' + data.measureDataTypeForTitle + '</b></font></td>';
	t += '</tr>';	
	t += '</table>';
	dojo.byId("BSC_PROG003D0009Q_content1").innerHTML = t;
}


function BSC_PROG003D0009Q_showChartForPerspectives(data) {
	
	var vision = data.vision;
	
	var chartDivContent = "";
	for (var p in vision.perspectives) {
		var perspective = vision.perspectives[p];
		var divChartId = "BSC_PROG003D0009Q_perspectives_container_" + perspective.perId;
		chartDivContent += '<div id="' + divChartId +'" style="width: 300px; height: 200px; float: left"></div>';
	}
	$("#BSC_PROG003D0009Q_perspectives_container").html( chartDivContent );
	
    var gaugeOptions = {

            chart: {
                type: 'solidgauge'
            },

            title: null,

            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },

            tooltip: {
                enabled: true
            },

            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#DF5353'], // red
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#55BF3B'] // green
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };
    
    for (var p in vision.perspectives) {
    	var perspective = vision.perspectives[p];
		var divChartId = "BSC_PROG003D0009Q_perspectives_container_" + perspective.perId;
		
		var maxVal = perspective.target;
		var minVal = perspective.min;
		if (perspective.score > maxVal) {
			maxVal = perspective.score;
		}
		if (perspective.score < minVal) {
			minVal = perspective.score;
		}
		if (minVal > 0) {
			minVal = 0;
		}		
		
	    $( '#'+divChartId ).highcharts(Highcharts.merge(gaugeOptions, {
	        yAxis: {
	            min: minVal,
	            max: maxVal,
	            title: {
	                text: perspective.name
	            }
	        },

	        credits: {
	            enabled: false
	        },

	        series: [{
	            name: perspective.name,
	            data: [ parseFloat( BSC_PROG003D0009Q_parseScore(perspective.score) ) ],
	            dataLabels: {
	                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
	                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
	                       '<span style="font-size:12px;color:silver">Score</span></div>'
	            },
	            tooltip: {
	                valueSuffix: ' Score'
	            }
	        }]

	    }));
	    
    }  
	
	
}


function BSC_PROG003D0009Q_showChartForPerspectivesDateRange(data) {
	
	if ( null == data.perspectiveCategories || data.perspectiveCategories.length < 2 ) {
		return;
	}
	
    $('#BSC_PROG003D0009Q_perspectives_daterange_container').highcharts({
        title: {
            text: data.perspectiveTitle + ' trend',
            x: -20 //center
        },
        subtitle: {
            text: 'Frequency : ' + data.displayFrequency + '  date range : ' + data.displayDateRange1 + ' ~ ' + data.displayDateRange2,
            x: -20
        },
        xAxis: {
            categories: data.perspectiveCategories
        },
        yAxis: {
            title: {
                text: 'Score'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ' Score'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: data.perspectiveSeries
    });
    
}
// =========================================================================================================
// End - Perspectives
// =========================================================================================================



// =========================================================================================================
// Begin - Strategy objectives
// =========================================================================================================
function BSC_PROG003D0009Q_showTableContent2( data ) {
	var vision = data.vision;
	var t = '';
	var c = 0;
	t += '<table width="1100px" cellspacing="1" cellpadding="1" bgcolor="' + data.backgroundColor + '" style="border:1px ' + data.backgroundColor  + ' solid; border-radius: 5px;" >';
	
	var headColspan = 4 + vision.perspectives[0].objectives[0].dateRangeScores.length;
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="center" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>' + data.vision.title + '</b></font></td>';
	t += '</tr>';
	
	for (var p in vision.perspectives) {
		var perspective = vision.perspectives[p];
		
		for (var o in perspective.objectives) {
			
			var objective = perspective.objectives[o];
			
			if ( c == 0 ) {
				t += '<tr>';
				t += '<td bgcolor="' + data.backgroundColor + '" align="left" width="320px"><font color="' + data.fontColor + '"><b>' + data.objectiveTitle + '</b></font></td>';
				t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Target</b></font></td>';
				t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Minimum</b></font></td>';	
				t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Score</b></font></td>';
				for ( var r in objective.dateRangeScores ) {
					t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>' + objective.dateRangeScores[r].date + '</b></font></td>';					
				}
				t += '</tr>';			
			}
			t += '<tr>';
			t += '<td bgcolor="#ffffff" align="left">' + objective.name + '</td>';
			t += '<td bgcolor="#ffffff" align="left">' + objective.target + '</td>';
			t += '<td bgcolor="#ffffff" align="left">' + objective.min + '</td>';	
			t += '<td bgcolor="' + objective.bgColor + '" align="center"><font color="' + objective.fontColor + '">' + BSC_PROG003D0009Q_parseScore(objective.score) + '</font></td>';	
			for ( var r in objective.dateRangeScores ) {
				t += '<td bgcolor="' + objective.dateRangeScores[r].bgColor + '" align="center"><font color="' + objective.dateRangeScores[r].fontColor + '">' + BSC_PROG003D0009Q_parseScore(objective.dateRangeScores[r].score) + '</font></td>';					
			}
			t += '</tr>';			
			c++;			
		}
		
	}
	
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="left" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>Frequency&nbsp;:&nbsp;' + data.displayFrequency + '&nbsp;&nbsp;date range&nbsp;:&nbsp;' + data.displayDateRange1 + '&nbsp;~&nbsp;' + data.displayDateRange2 + '&nbsp;&nbsp;Measure data type&nbsp;:&nbsp;' + data.measureDataTypeForTitle + '</b></font></td>';
	t += '</tr>';	
	t += '</table>';
	dojo.byId("BSC_PROG003D0009Q_content2").innerHTML = t;
}


function BSC_PROG003D0009Q_showChartForObjectives(data) {
	
	var vision = data.vision;
	
	var chartDivContent = "";
	for (var p in vision.perspectives) {
		var perspective = vision.perspectives[p];
		
		for (var o in perspective.objectives) {
			var objective = perspective.objectives[o];
			var divChartId = "BSC_PROG003D0009Q_objectives_container_" + objective.objId;
			chartDivContent += '<div id="' + divChartId +'" style="width: 300px; height: 200px; float: left"></div>';			
		}
		
	}
	$("#BSC_PROG003D0009Q_objectives_container").html( chartDivContent );
	
    var gaugeOptions = {

            chart: {
                type: 'solidgauge'
            },

            title: null,

            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },

            tooltip: {
                enabled: true
            },

            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#DF5353'], // red
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#55BF3B'] // green
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };
    
    for (var p in vision.perspectives) {
    	var perspective = vision.perspectives[p];
    	
    	for (var o in perspective.objectives) {
    		var objective = perspective.objectives[o];
    		
    		var divChartId = "BSC_PROG003D0009Q_objectives_container_" + objective.objId;
    		
    		var maxVal = objective.target;
    		var minVal = objective.min;
    		if (objective.score > maxVal) {
    			maxVal = objective.score;
    		}
    		if (objective.score < minVal) {
    			minVal = objective.score;
    		}    
    		if (minVal > 0) {
    			minVal = 0;
    		}    		
    		
    	    $( '#'+divChartId ).highcharts(Highcharts.merge(gaugeOptions, {
    	        yAxis: {
    	            min: minVal,
    	            max: maxVal,
    	            title: {
    	                text: objective.name
    	            }
    	        },

    	        credits: {
    	            enabled: false
    	        },

    	        series: [{
    	            name: objective.name,
    	            data: [ parseFloat( BSC_PROG003D0009Q_parseScore(objective.score) ) ],
    	            dataLabels: {
    	                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
    	                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
    	                       '<span style="font-size:12px;color:silver">Score</span></div>'
    	            },
    	            tooltip: {
    	                valueSuffix: ' Score'
    	            }
    	        }]

    	    }));
    	    
    		
    	}
	    
    }  
	
	
}


function BSC_PROG003D0009Q_showChartForObjectivesDateRange(data) {
	
	if ( null == data.objectiveCategories || data.objectiveCategories.length < 2 ) {
		return;
	}
	
    $('#BSC_PROG003D0009Q_objectives_daterange_container').highcharts({
        title: {
            text: data.objectiveTitle + ' trend',
            x: -20 //center
        },
        subtitle: {
            text: 'Frequency : ' + data.displayFrequency + '  date range : ' + data.displayDateRange1 + ' ~ ' + data.displayDateRange2,
            x: -20
        },
        xAxis: {
            categories: data.objectiveCategories
        },
        yAxis: {
            title: {
                text: 'Score'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ' Score'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: data.objectiveSeries
    });
    
}
// =========================================================================================================
// End - Strategy objectives
// =========================================================================================================



	
// =========================================================================================================
// Begin - KPIs
// =========================================================================================================
function BSC_PROG003D0009Q_showTableContent3( data ) {
	var vision = data.vision;
	var t = '';
	var c = 0;
	t += '<table width="1100px" cellspacing="1" cellpadding="1" bgcolor="' + data.backgroundColor + '" style="border:1px ' + data.backgroundColor  + ' solid; border-radius: 5px;" >';
	
	var headColspan = 4 + vision.perspectives[0].objectives[0].kpis[0].dateRangeScores.length;
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="center" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>' + data.vision.title + '</b></font></td>';
	t += '</tr>';
	
	for (var p in vision.perspectives) {
		var perspective = vision.perspectives[p];
		
		for (var o in perspective.objectives) {
			var objective = perspective.objectives[o];
			
			for (var k in objective.kpis) {
				var kpi = objective.kpis[k];
				
				if ( c == 0 ) {
					t += '<tr>';
					t += '<td bgcolor="' + data.backgroundColor + '" align="left" width="320px"><font color="' + data.fontColor + '"><b>' + data.kpiTitle + '</b></font></td>';
					t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Maximum</b></font></td>';
					t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Target</b></font></td>';
					t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Minimum</b></font></td>';	
					t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>Score</b></font></td>';
					for ( var r in kpi.dateRangeScores ) {
						t += '<td bgcolor="' + data.backgroundColor + '" align="left"><font color="' + data.fontColor + '"><b>' + kpi.dateRangeScores[r].date + '</b></font></td>';					
					}
					t += '</tr>';			
				}
				t += '<tr>';
				t += '<td bgcolor="#ffffff" align="left">' + kpi.name + '</td>';
				t += '<td bgcolor="#ffffff" align="left">' + kpi.max + '</td>';
				t += '<td bgcolor="#ffffff" align="left">' + kpi.target + '</td>';
				t += '<td bgcolor="#ffffff" align="left">' + kpi.min + '</td>';	
				t += '<td bgcolor="' + kpi.bgColor + '" align="center"><font color="' + kpi.fontColor + '">' + BSC_PROG003D0009Q_parseScore(kpi.score) + '</font></td>';	
				for ( var r in kpi.dateRangeScores ) {
					t += '<td bgcolor="' + kpi.dateRangeScores[r].bgColor + '" align="center"><font color="' + kpi.dateRangeScores[r].fontColor + '">' + BSC_PROG003D0009Q_parseScore(kpi.dateRangeScores[r].score) + '</font></td>';					
				}
				t += '</tr>';			
				c++;						
				
			}
			
		}
		
	}
	
	t += '<tr>';
	t += '<td bgcolor="' + data.backgroundColor + '" align="left" colspan="' + headColspan + '"><font color="' + data.fontColor + '"><b>Frequency&nbsp;:&nbsp;' + data.displayFrequency + '&nbsp;&nbsp;date range&nbsp;:&nbsp;' + data.displayDateRange1 + '&nbsp;~&nbsp;' + data.displayDateRange2 + '&nbsp;&nbsp;Measure data type&nbsp;:&nbsp;' + data.measureDataTypeForTitle + '</b></font></td>';
	t += '</tr>';	
	t += '</table>';
	dojo.byId("BSC_PROG003D0009Q_content3").innerHTML = t;
}


function BSC_PROG003D0009Q_showChartForKpis(data) {
	
	var vision = data.vision;
	
	var chartDivContent = "";
	for (var p in vision.perspectives) {
		var perspective = vision.perspectives[p];
		
		for (var o in perspective.objectives) {
			var objective = perspective.objectives[o];
			
			for (var k in objective.kpis) {
				var kpi = objective.kpis[k];
				
				var divChartId = "BSC_PROG003D0009Q_kpis_container_" + kpi.id;
				chartDivContent += '<div id="' + divChartId +'" style="width: 300px; height: 200px; float: left"></div>';	
				
			}
					
		}
		
	}
	$("#BSC_PROG003D0009Q_kpis_container").html( chartDivContent );
	
    var gaugeOptions = {

            chart: {
                type: 'solidgauge'
            },

            title: null,

            pane: {
                center: ['50%', '85%'],
                size: '140%',
                startAngle: -90,
                endAngle: 90,
                background: {
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || '#EEE',
                    innerRadius: '60%',
                    outerRadius: '100%',
                    shape: 'arc'
                }
            },

            tooltip: {
                enabled: true
            },

            // the value axis
            yAxis: {
                stops: [
                    [0.1, '#DF5353'], // red
                    [0.5, '#DDDF0D'], // yellow
                    [0.9, '#55BF3B'] // green
                ],
                lineWidth: 0,
                minorTickInterval: null,
                tickAmount: 2,
                title: {
                    y: -70
                },
                labels: {
                    y: 16
                }
            },

            plotOptions: {
                solidgauge: {
                    dataLabels: {
                        y: 5,
                        borderWidth: 0,
                        useHTML: true
                    }
                }
            }
        };
    
    for (var p in vision.perspectives) {
    	var perspective = vision.perspectives[p];
    	
    	for (var o in perspective.objectives) {
    		var objective = perspective.objectives[o];
    		
			for (var k in objective.kpis) {
				var kpi = objective.kpis[k];
				
	    		var divChartId = "BSC_PROG003D0009Q_kpis_container_" + kpi.id;
	    		
	    		var maxVal = kpi.target;
	    		var minVal = kpi.min;
	    		if (kpi.score > maxVal) {
	    			maxVal = kpi.score;
	    		}
	    		if (kpi.score < minVal) {
	    			minVal = kpi.score;
	    		}    
	    		if (minVal > 0) {
	    			minVal = 0;
	    		}	    		
	    		
	    	    $( '#'+divChartId ).highcharts(Highcharts.merge(gaugeOptions, {
	    	        yAxis: {
	    	            min: minVal,
	    	            max: maxVal,
	    	            title: {
	    	                text: kpi.name
	    	            }
	    	        },

	    	        credits: {
	    	            enabled: false
	    	        },

	    	        series: [{
	    	            name: kpi.name,
	    	            data: [ parseFloat( BSC_PROG003D0009Q_parseScore(kpi.score) ) ],
	    	            dataLabels: {
	    	                format: '<div style="text-align:center"><span style="font-size:25px;color:' +
	    	                    ((Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black') + '">{y}</span><br/>' +
	    	                       '<span style="font-size:12px;color:silver">Score</span></div>'
	    	            },
	    	            tooltip: {
	    	                valueSuffix: ' Score'
	    	            }
	    	        }]

	    	    }));
	    	    
				
			}    	    
    		
    	}
	    
    }  
	
	
}


function BSC_PROG003D0009Q_showChartForKpiDateRange(data) {
	
	if ( null == data.kpiCategories || data.kpiCategories.length < 2 ) {
		return;
	}
	
    $('#BSC_PROG003D0009Q_kpis_daterange_container').highcharts({
        title: {
            text: data.kpiTitle + ' trend',
            x: -20 //center
        },
        subtitle: {
            text: 'Frequency : ' + data.displayFrequency + '  date range : ' + data.displayDateRange1 + ' ~ ' + data.displayDateRange2,
            x: -20
        },
        xAxis: {
            categories: data.kpiCategories
        },
        yAxis: {
            title: {
                text: 'Score'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valueSuffix: ' Score'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: data.kpiSeries
    });
    
}
// =========================================================================================================
// End - KPIs
// =========================================================================================================



function BSC_PROG003D0009Q_clearContent() {
	dojo.byId("BSC_PROG003D0009Q_content_vision").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_content1").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_perspectives_container").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_perspectives_daterange_container").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_content2").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_objectives_container").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_objectives_daterange_container").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_content3").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_kpis_container").innerHTML = "";
	dojo.byId("BSC_PROG003D0009Q_kpis_daterange_container").innerHTML = "";	
}


function BSC_PROG003D0009Q_parseScore( score ) {
	var scoreStr = viewPage.roundFloat(score, 2) + '';
	scoreStr = scoreStr.replace('.00', '');
	return scoreStr;
}

//------------------------------------------------------------------------------
function ${programId}_page_message() {
	var pageMessage='<s:property value="pageMessage" escapeJavaScript="true"/>';
	if (null!=pageMessage && ''!=pageMessage && ' '!=pageMessage) {
		alert(pageMessage);
	}	
}
//------------------------------------------------------------------------------

</script>

</head>

<body class="flat">

	<gs:toolBar
		id="${programId}" 
		cancelEnable="Y" 
		cancelJsMethod="${programId}_TabClose();" 
		createNewEnable="N"
		createNewJsMethod=""		 
		saveEnabel="N" 
		saveJsMethod=""
		refreshEnable="Y" 		 
		refreshJsMethod="${programId}_TabRefresh();" 		
		></gs:toolBar>
	<jsp:include page="../header.jsp"></jsp:include>		


	<table border="0" width="100%" >
		<tr valign="top">
			<td width="100%" align="center" height="35%">
				<div data-dojo-type="dijit.TitlePane" data-dojo-props="title: '<s:property value="getText('BSC_PROG003D0009Q_options')" escapeJavaScript="true"/>' " >						
					<div dojoType="dijit.layout.ContentPane" region="left" splitter="false" style="width:99%;height:145px">
					
						<table border="0" width="100%" >
							<tr valign="top">
								<td width="100%" align="left" height="25px" style="border:1px #ebeadb solid; border-radius: 5px; background: linear-gradient(to top, #f1eee5 , #fafafa);">	
								
									<button id="BSC_PROG003D0009Q_btnQuery" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											iconClass:'dijitIconSearch',
											showLabel:false,
											onClick:function(){  
												BSC_PROG003D0009Q_query();
											}"><s:property value="getText('BSC_PROG003D0009Q_btnQuery')"/></button>	
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_btnQuery'">
					    				<s:property value="getText('BSC_PROG003D0009Q_btnQuery')"/>
									</div>
																				
									<!-- ####################################################################################################### -->
									<!-- Current year -->		
									<button id="BSC_PROG003D0009Q_btnQueryForCurrentYear" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											showLabel:true,
											onClick:function(){  
												dijit.byId('BSC_PROG003D0009Q_frequency').set('value', '6');
												setReportQueryDateFieldForCurrent('6', 'BSC_PROG003D0009Q_startYearDate', 'BSC_PROG003D0009Q_endYearDate');
												BSC_PROG003D0009Q_query();
											}"><b>Y</b></button>	
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_btnQueryForCurrentYear'">
					    				<s:property value="getText('BSC_PROG003D0009Q_btnQuery')"/> (Current year)
									</div>
																																	
									<!-- Current half-year -->		
									<button id="BSC_PROG003D0009Q_btnQueryForCurrentHalfYear" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											showLabel:true,
											onClick:function(){  
												dijit.byId('BSC_PROG003D0009Q_frequency').set('value', '5');
												setReportQueryDateFieldForCurrent('5', 'BSC_PROG003D0009Q_startYearDate', 'BSC_PROG003D0009Q_endYearDate');
												BSC_PROG003D0009Q_query();
											}"><b>H</b></button>		
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_btnQueryForCurrentHalfYear'">
					    				<s:property value="getText('BSC_PROG003D0009Q_btnQuery')"/> (Half-year of the current year)
									</div>											
											
									<!-- Current quarterly -->		
									<button id="BSC_PROG003D0009Q_btnQueryForCurrentQuarter" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											showLabel:true,
											onClick:function(){  
												dijit.byId('BSC_PROG003D0009Q_frequency').set('value', '4');
												setReportQueryDateFieldForCurrent('4', 'BSC_PROG003D0009Q_startYearDate', 'BSC_PROG003D0009Q_endYearDate');
												BSC_PROG003D0009Q_query();
											}"><b>Q</b></button>			
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_btnQueryForCurrentQuarter'">
					    				<s:property value="getText('BSC_PROG003D0009Q_btnQuery')"/> (Quarterly of the current year)
									</div>
																				
									<!-- Current month -->		
									<button id="BSC_PROG003D0009Q_btnQueryForCurrentMonth" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											showLabel:true,
											onClick:function(){  
												dijit.byId('BSC_PROG003D0009Q_frequency').set('value', '3');
												setReportQueryDateFieldForCurrent('3', 'BSC_PROG003D0009Q_startDate', 'BSC_PROG003D0009Q_endDate');
												BSC_PROG003D0009Q_query();
											}"><b>M</b></button>		
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_btnQueryForCurrentMonth'">
					    				<s:property value="getText('BSC_PROG003D0009Q_btnQuery')"/> (Current month)
									</div>
																																																	
									<!-- ####################################################################################################### -->												
									            
									<button id="BSC_PROG003D0009Q_btnXls" data-dojo-type="dijit.form.Button"
										data-dojo-props="
											iconClass:'btnExcelIcon',
											showLabel:false,
											onClick:function(){
												BSC_PROG003D0009Q_generateExport();																			  
											}"><s:property value="getText('BSC_PROG003D0009Q_btnXls')"/></button>	
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_btnXls'">
					    				<s:property value="getText('BSC_PROG003D0009Q_btnXls')"/>
									</div>
									
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_visionOid"></gs:inputfieldNoticeMsgLabel>		
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_frequency"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_startYearDate"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_startDate"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_measureDataOrganizationOid"></gs:inputfieldNoticeMsgLabel>
									<gs:inputfieldNoticeMsgLabel id="BSC_PROG003D0009Q_measureDataEmployeeOid"></gs:inputfieldNoticeMsgLabel>
											
								</td>											
							</tr>	

							<tr valign="top">
								<td width="100%" align="left" height="25px">	
								
									<s:property value="getText('BSC_PROG003D0009Q_visionOid')"/>
									<gs:select name="BSC_PROG003D0009Q_visionOid" dataSource="visionMap" id="BSC_PROG003D0009Q_visionOid"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_visionOid'">
					    				Select vision.
									</div>  									
						    		&nbsp;		    			
					    																	
									<s:property value="getText('BSC_PROG003D0009Q_frequency')"/>
									<gs:select name="BSC_PROG003D0009Q_frequency" dataSource="frequencyMap" id="BSC_PROG003D0009Q_frequency" value="6" onChange="BSC_PROG003D0009Q_setFrequencyValue();" width="140"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_frequency'">
					    				Select frequency.
									</div> 									
								</td>											
							</tr>	
												
							<tr valign="top">
								<td width="100%" align="left" height="25px">
								
							    	<s:property value="getText('BSC_PROG003D0009Q_startYearDate')"/>
							    	<input id="BSC_PROG003D0009Q_startYearDate" name="BSC_PROG003D0009Q_startYearDate" data-dojo-type="dojox.form.YearTextBox" 
							    		maxlength="4"  type="text" data-dojo-props='style:"width: 80px;" ' />
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_startYearDate'">
					    				Select start year.
									</div>							    		
							    	&nbsp;	
							    	<s:property value="getText('BSC_PROG003D0009Q_endYearDate')"/>
							    	<input id="BSC_PROG003D0009Q_endYearDate" name="BSC_PROG003D0009Q_endYearDate" data-dojo-type="dojox.form.YearTextBox" 
							    		maxlength="4"  type="text" data-dojo-props='style:"width: 80px;" ' />
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_endYearDate'">
					    				Select end year.
									</div>							    									    	
							    	&nbsp;&nbsp;		
									<s:property value="getText('BSC_PROG003D0009Q_startDate')"/>
									<input id="BSC_PROG003D0009Q_startDate" type="text" name="BSC_PROG003D0009Q_startDate" data-dojo-type="dijit.form.DateTextBox"
										maxlength="10" 
										constraints="{datePattern:'yyyy/MM/dd', selector:'date' }" style="width:120px;" readonly />
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_startDate'">
					    				Select start date.
									</div>											
									&nbsp;						
									<s:property value="getText('BSC_PROG003D0009Q_endDate')"/>
									<input id="BSC_PROG003D0009Q_endDate" type="text" name="BSC_PROG003D0009Q_endDate" data-dojo-type="dijit.form.DateTextBox"
										maxlength="10" 
										constraints="{datePattern:'yyyy/MM/dd', selector:'date' }" style="width:120px;" readonly />																	    									    	
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_endDate'">
					    				Select end date.
									</div>							    			
							    </td>	
							</tr>
							<tr valign="top">
								<td width="100%" align="left" height="25px">							
									<s:property value="getText('BSC_PROG003D0009Q_dataFor')"/>
									<gs:select name="BSC_PROG003D0009Q_dataFor" dataSource="{ \"all\":\"All\", \"organization\":\"${action.getText('BSC_PROG003D0009Q_measureDataOrganizationOid')}\", \"employee\":\"${action.getText('BSC_PROG003D0009Q_measureDataEmployeeOid')}\" }" id="BSC_PROG003D0009Q_dataFor" onChange="BSC_PROG003D0009Q_setDataForValue();" width="140"></gs:select>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_dataFor'">
					    				Select measure data type.
									</div>										
									&nbsp;&nbsp;
									<s:property value="getText('BSC_PROG003D0009Q_measureDataOrganizationOid')"/>
									<gs:filteringSelect name="BSC_PROG003D0009Q_measureDataOrganizationOid" dataSource="measureDataOrganizationMap" id="BSC_PROG003D0009Q_measureDataOrganizationOid" onChange="BSC_PROG003D0009Q_setMeasureDataOrgaValue();" readonly="Y" value="all"></gs:filteringSelect>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_measureDataOrganizationOid'">
					    				Select measure data organization/department.
									</div>									
									&nbsp;&nbsp;
									<s:property value="getText('BSC_PROG003D0009Q_measureDataEmployeeOid')"/>
									<gs:filteringSelect name="BSC_PROG003D0009Q_measureDataEmployeeOid" dataSource="measureDataEmployeeMap" id="BSC_PROG003D0009Q_measureDataEmployeeOid" onChange="BSC_PROG003D0009Q_setMeasureDataEmplValue();" readonly="Y" value="all"></gs:filteringSelect>
									<div data-dojo-type="dijit/Tooltip" data-dojo-props="connectId:'BSC_PROG003D0009Q_measureDataEmployeeOid'">
					    				Select measure data personal/Employee.
									</div>									
								</td>
							</tr>																						
																											
						</table>
			    			
		    		</div>		    		
		    	</div>	
		    	
			    			
			</td>
		</tr>
	</table>

	<div id="BSC_PROG003D0009Q_content_vision"></div>	
	<br>	
	<br>
	
	<div id="BSC_PROG003D0009Q_content1"></div>	
	<br>
	<div id="BSC_PROG003D0009Q_perspectives_container"></div>
	<br>
	<br>
	
	<div id="BSC_PROG003D0009Q_content2"></div>	
	<br>
	<div id="BSC_PROG003D0009Q_objectives_container"></div>	
	<br>
	<br>
	
	<div id="BSC_PROG003D0009Q_content3"></div>	
	<br>
	<div id="BSC_PROG003D0009Q_kpis_container"></div>		
	<br>
	<br>	
	
	<div id="BSC_PROG003D0009Q_perspectives_daterange_container"  style="width: 100%; height: 450px; float: left"></div>
	<br>
	<div id="BSC_PROG003D0009Q_objectives_daterange_container"  style="width: 100%; height: 450px; float: left"></div>	
	<br>
	<div id="BSC_PROG003D0009Q_kpis_daterange_container"  style="width: 100%; height: 450px; float: left"></div>
	<br>
		
<script type="text/javascript">${programId}_page_message();</script>	
</body>
</html>
