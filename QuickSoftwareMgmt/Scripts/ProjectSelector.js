$(function () {
    $("#ProjectSelector").change(function (e) {
        var selectedProjectId = $(this).val();
        var ref = $(this).data("ref");
        window.location = ref + "/" + selectedProjectId;
    });
});