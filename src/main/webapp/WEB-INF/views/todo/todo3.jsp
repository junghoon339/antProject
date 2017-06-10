<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/todo/css/todo.css"/>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript">
function createGuid() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c === 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}

var sections = [
{
Id: 1, Name: 'Section-1', RowOrder: 1, Colspan: 1, Rowspan: 1, Color: 'panel-success', RowCount: 2,
Fields: [
{ FieldId: 1, Name: 'name', RowOrder: 1, Colspan: 1, Rowspan: 1 },
{ FieldId: 2, Name: 'surname', RowOrder: 1, Colspan: 1, Rowspan: 1 },
{ FieldId: 3, Name: 'city', RowOrder: 2, Colspan: 2, Rowspan: 1 }]
},
{
Id: 2, Name: 'Section-2', RowOrder: 1, Colspan: 1, Rowspan: 1, Color: 'panel-info', RowCount: 2,
Fields: [
{ FieldId: 1, Name: 'name', RowOrder: 1, Colspan: 1, Rowspan: 1 },
{ FieldId: 1, Name: 'surname', RowOrder: 2, Colspan: 1, Rowspan: 1 }]
},
{
Id: 3, Name: 'Section-3', RowOrder: 2, Colspan: 2, Rowspan: 1, Color: 'panel-danger', RowCount: 2,
Fields: [
{ FieldId: 1, Name: 'name', RowOrder: 1, Colspan: 1, Rowspan: 1 },
{ FieldId: 2, Name: 'surname', RowOrder: 1, Colspan: 1, Rowspan: 1 },
{ FieldId: 3, Name: 'email', RowOrder: 1, Colspan: 1, Rowspan: 1 },
{ FieldId: 4, Name: 'city', RowOrder: 2, Colspan: 2, Rowspan: 1 },
{ FieldId: 5, Name: 'county', RowOrder: 2, Colspan: 1, Rowspan: 1 }]
}
];

var layout = { Id: 1, RowCount: 2, Sections: sections };
//layout = [];

$(function () {
var table = $('<table class="table table-bordered table-layout" />');

for (var i = 0; i < layout.RowCount; i++) {
var tr = $('<tr/>');
$.each(layout.Sections, function () {
    if (this.RowOrder == i + 1) {
        var panel = $('.panel.hidden').clone()
            .removeClass('hidden')
            .addClass(this.Color);

        panel.find('.panel-heading span [contenteditable]').attr('data-name', this.Name).html(this.Name);

        if (this.Fields.length > 0) {
            for (var j = 0; j < this.RowCount; j++) {
                var pTr = $('<tr/>');
                $.each(this.Fields, function () {
                    if (this.RowOrder == j + 1) {

                        var item = $('<div/>', { id: this.FieldId, title: this.Name, 'class': 'col-lg-12', cf:'' })
                                            .append($('<div/>', { 'class': 'draggable col-lg-12 bg-primary' })
                                            .append($('<i/>', { 'class': 'fa fa-database' })).append(' ' + this.Name)),
                        td = $('<td/>', {
                            colspan: this.Colspan,
                            rowspan: this.Rowspan
                        }).append(item);

                        pTr.append(td);
                    }
                });
                var uniqId = createGuid();
                panel.find('.panel-body').attr('id', uniqId); // benzersiz id
                panel.find('.tools').attr('data-id', uniqId); // benzersiz id
                panel.find('.panel-body table').append(pTr);
            }
        }

        tr.append($('<td/>', {
            colspan: this.Colspan,
            rowspan: this.Rowspan
        }).append(panel));

    }
});
table.append(tr);
}

$("#PageLayout").append(table);
});

function draggableInit() {
$('.panel-body td, .panel-body.source').sortable({
handle: '.draggable',
connectWith: '.panel-body td, .panel-body.source',
receive: function (event, ui) {
    var dragItemId = ui.item.attr('id'),
        sourceZone = ui.sender, draggedItem = ui.item,
        sourceId = sourceZone.closest('.panel').attr('id'),
        targetId = draggedItem.closest('.panel').attr('id');

    draggedItem.removeClass().addClass('col-lg-12');

    sourceZone.removeClass('ui-selected').addClass('empty');
    if (targetId == 'cf_source') {
        draggedItem.removeClass().addClass('col-lg-3');
    } else {
        draggedItem.parent().removeClass();
        if (draggedItem.parent().children('div').length > 1) {
            if (sourceId != 'cf_source') sourceZone.removeClass();
            else draggedItem.removeClass().addClass('col-lg-3');
            sourceZone.append(draggedItem)
        }
    }

    selectableInit();
    eventChangeData();
},
update: function (event, ui) {
    eventChangeData();
}
}).disableSelection();
}

//only empty cell selectable
function selectableInit() {
$('table.table-layout, table.table-panel').selectable({
filter: "td.empty",
autoRefresh: true,
selecting: function (event, ui) {
    var td = $(ui.selecting);
    //if (td.closest('table').hasClass('table-layout')) {
    //    console.log('table-layout');
    //} else {
    //    console.log('table-panel');
    //}
},
stop: function (event, ui) {
    $(event.target).find(':not(.empty)').removeClass('ui-selected');
    enableAddPanelButton($(event.target));
    selectableInit();
}
});
}

function enableAddPanelButton(table) {
if (table.find('.ui-selected').length == 1) {
$('.btn-add-panel').show();
} else {
$('.btn-add-panel').hide();
}
}

// Panel color setting
$('body').on('click', '[data-color]', function () {
var panel = $(this).closest('.panel');
var color = $(this).data('color');
panel.removeClass().addClass('panel').addClass('panel-' + color).attr('data-panelcolor', color);
eventChangeData();
});

// Panel slide toggle effect
$('body').on('click', '.panel-toggle', function () {
var panelBlock = $(this).closest('.panel').children('.panel-body');
panelBlock.slideToggle();
});

//contenteditable
$('body').on('click', '.contenteditable', function () {
var span = $(this).closest('span');
var contentEditable = span.children('[contenteditable]');
contentEditable.attr('contenteditable', true).focus();
contentEditable.blur(function () {
$(this).attr('contenteditable', false);
});
});

$('body').on('keydown', '[contenteditable="true"]', function (e) {
var item = $(this);

if (e.keyCode === 27) {
item.html(item.data('name'));
item.blur();
return false;
} else {
eventChangeData();
}
if (e.keyCode === 13) {
item.blur();
return false;
}
});

function eventChangeData() {
// data deðiþikliði oldu
}

function tableSizer() {
var sizeChooser = $('.SizeChooser');
sizeChooser.each(function () {
var trs = $(this).find('table tr'),
    tds = $(this).find('table td'),
    buttons = $(this).find('table td button');

trs.each(function (i) {
    var $tr = $(this);
    $tr.attr('data-index', i + 1);
    $tr.find('td').each(function (j) {
        $(this).attr('data-index', j + 1);
    });
});

tds.mouseover(function () {
    var trIndex = $(this).closest('tr').data('index'),
        tdIndex = $(this).data('index');

    var colXrow = $(this).closest('.SizeChooser').find('.colXrow');
    colXrow.eq(0).html(trIndex);
    colXrow.eq(1).html(tdIndex);

    buttons.removeClass('btn-info');
    buttons.each(function () {
        var $button = $(this);
        if ($button.closest('tr').data('index') < trIndex + 1 && $button.parent().data('index') < tdIndex + 1) {
            $button.addClass('btn-info');
        }
    });
});
});
}

$(function () {
//table  generator
$('body').on('click', 'td[data-index] button', function () {
var trIndex = $(this).closest('tr').data('index'), tdIndex = $(this).parent().data('index'),
    tableId = '#' + $(this).closest('.tools').data('id'),
    table = $(tableId + ' > table'), trs = $(tableId + ' > table > tbody > tr'),
    trOrder, tdMaxCount = 0, newTrCount = (trIndex - trs.length), newTdCount, isDeletable = null;

trs.each(function () {
    var $tr = $(this), $tdLen = $tr.children('td').length;
    if ($tdLen > tdMaxCount) tdMaxCount = $tdLen;
});

newTdCount = (tdIndex - tdMaxCount);
trs.each(function () {
    var $tr = $(this);
    for (var j = 0; j < newTdCount; j++) $tr.append($('<td/>', { colspan: 1, rowspan: 1, 'class': 'empty' }));

    //seçim dýþý kalan td siler
    if (newTdCount < 0) for (i = 0; i < Math.abs(newTdCount) ; i++) {
        var last = $tr.find('td').last();
        last.find('div[cf]').clone().removeClass().addClass('col-lg-3').appendTo('#cf_source .panel-body');
        last.remove();
    }

});
tdMaxCount += newTdCount;

// yeni tr ler ekler
for (trOrder = 0; trOrder < newTrCount ; trOrder++) {
    var tr = $('<tr/>');
    for (var i = 0; i < tdMaxCount; i++) tr.append($('<td/>', { colspan: 1, rowspan: 1, 'class': 'empty' }));
    table.append(tr);
}

//seçim dýþý kalan tr siler
if (newTrCount < 0) for (trOrder = 0; trOrder < Math.abs(newTrCount) ; trOrder++) {
    var last = $(tableId + ' > table > tbody > tr').last();
    last.find('div[cf]').clone().removeClass().addClass('col-lg-3').appendTo('#cf_source .panel-body');
    last.remove();
}

draggableInit();
eventChangeData();
});

// seçili hüçrelerin merge edilmesi
$('body').on('click', '.tools .merge', function () {
var containerId = '#' + $(this).closest('.tools').data('id'),
    table = $(containerId + ' > table > tbody'),
    selectedSelector = containerId + ' > table > tbody > tr .ui-selected',
    cs = 0, rs = 1;

table.find('tr').each(function () {
    var $tr = $(this),
        selecteds = $tr.find('.ui-selected');

    cs = 0;
    selecteds.each(function () {
        cs += parseInt($(this).attr('colspan'));
        var newRs = parseInt($(this).attr('rowspan'));
        if (newRs > rs) rs = newRs;
    });
    selecteds.last().after(($('<td/>', { colspan: cs, rowspan: rs, 'class': 'empty ui-selected' })));
    selecteds.remove();
});

rs = 0, cs = 1;
$(selectedSelector).each(function () {
    rs += parseInt($(this).attr('rowspan'));
    var newCs = parseInt($(this).attr('colspan'));
    if (newCs > cs) cs = newCs;
});
$(selectedSelector).each(function (i) {

    var $elem = $(this);
    if (i == 0) {
        $elem.attr('rowspan', rs).attr('colspan', cs);
    } else {
        $elem.remove();
    }
});


draggableInit();
eventChangeData();
enableAddPanelButton(table);
});
});

$(function () {
    draggableInit();
    selectableInit();
    tableSizer();

    $('.btn-add-panel').click(function () {
        var selected = $('#PageLayout .ui-selected');
        if (selected.length == 1) {
            var cloned = $('.panel.hidden').clone();

            var uniq = createGuid();
            cloned.find('.panel-body').attr('id', uniq); // benzersiz id
            cloned.find('.tools').attr('data-id', uniq); // benzersiz id

            selected.append(cloned.removeClass('hidden')).removeClass();

            selectableInit();
            tableSizer();
        }
    });
});

</script>
</head>
<body class="container">
    <br />

    <div id="cf_source" class="panel panel-default">
        <div class="panel-heading">
            free fields (<a href="https://github.com/beratbilgin/drag-and-drop-page-design" target="_blank">all fields on github</a>)
        </div>
        <div class="panel-body source bg-success">
            <div id="XX" title="XX" class="col-lg-3" cf>
                <div class="draggable col-lg-12 bg-primary">
                    <i class="fa fa-database"></i>
                    XX
                </div>
            </div>

            <div id="YY" title="YY" class="col-lg-3" cf>
                <div class="draggable col-lg-12 bg-primary">
                    <i class="fa fa-database"></i>
                    YY
                </div>
            </div>

            <div id="ZZ" title="ZZ" class="col-lg-3" cf>
                <div class="draggable col-lg-12 bg-primary">
                    <i class="fa fa-database"></i>
                    ZZ
                </div>
            </div>
        </div>
    </div>

    <div class="well text-center tools" data-id="PageLayout">
        <div class="btn-group">
            <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" title="btn_color">
                <i class="fa fa-table fa-2x"></i>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li style="height: 255px; width: 248px">
                    <div class="SizeChooser">
                        <table><tbody><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr></tbody></table>
                        <div class="text-center">
                            <span class="colXrow">0</span> <span>x</span> <span class="colXrow">0</span>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <button type="button" class="btn btn-sm btn-default merge" title="btn_merge">
            <i class="fa fa-compress fa-2x"></i>
        </button>
        <button type="button" class="btn btn-sm btn-default btn-add-panel" title="btn_new_panel" style="display: none">
            <i class="fa fa-plus fa-2x"></i>
        </button>
    </div>

    <div class="row" id="PageLayout">

    </div>

    <!--K�lavuz panel-->
    <div class="panel panel-default hidden">
        <div class="panel-heading tools">
            <span><button class="btn btn-xs contenteditable"><i class="fa fa-edit" style="cursor: pointer"></i></button> <span contenteditable="false">New panel</span></span>
            <div class="pull-right">
                <!--<a class="btn btn-xs btn-default move-cursor"><i class="fa fa-arrows"></i></a>-->
                <button type="button" class="btn btn-xs btn-default panel-toggle" title="btn_toggle">
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="btn-group">
                    <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown" title="btn_color">
                        <i class="fa fa-eye"></i>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li data-color="default">
                            <button class="btn btn-block"> </button>
                        </li>
                        <li data-color="danger">
                            <button class="btn btn-danger btn-block"> </button>
                        </li>
                        <li data-color="success">
                            <button class="btn btn-success btn-block"> </button>
                        </li>
                        <li data-color="info">
                            <button class="btn btn-info btn-block"> </button>
                        </li>
                        <li data-color="warning">
                            <button class="btn btn-warning btn-block"> </button>
                        </li>
                        <li data-color="primary">
                            <button class="btn btn-primary btn-block"> </button>
                        </li>
                    </ul>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-xs btn-default dropdown-toggle" data-toggle="dropdown" title="btn_color">
                        <i class="fa fa-table"></i>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li style="height: 255px; width: 248px">
                            <div class="SizeChooser">
                                <table><tbody><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr><tr><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td><td><button class="btn btn-xs"></button></td></tr></tbody></table>
                                <div class="text-center">
                                    <span class="colXrow">0</span> <span>x</span> <span class="colXrow">0</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <button type="button" class="btn btn-xs btn-default merge" title="btn_merge">
                    <i class="fa fa-compress"></i>
                </button>

            </div>
        </div>
        <div class="panel-body">
            <table class="table-panel table table-bordered"></table>
        </div>
    </div>
    
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
</body>
</html>