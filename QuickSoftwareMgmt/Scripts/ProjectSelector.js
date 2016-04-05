$(function () {
    $("#ProjectSelector").change(changeContext);
    $("#SprintSelector").change(changeContext);

    function changeContext(e) {
        var selectedProjectId = $("#ProjectSelector").val();
        var selectedSprintId = $("#SprintSelector").val();


        var ref = $(this).data("ref");
        window.location = ref + "?projectId=" + selectedProjectId +"&sprintId="+selectedSprintId;
    }
});