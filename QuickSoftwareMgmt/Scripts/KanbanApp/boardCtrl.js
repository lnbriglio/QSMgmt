sulhome.kanbanBoardApp.controller('boardCtrl', function ($scope, boardService) {
    // Model
    $scope.columns = [];
    $scope.isLoading = false;

    function init() {
        $scope.isLoading = true;
        //boardService.initialize().then(function (data) {
        //    $scope.isLoading = false;
        //    $scope.refreshBoard();
        //}, onError);
        $scope.isLoading = false;
        $scope.refreshBoard();
    };

    $scope.refreshBoard = function refreshBoard() {
        $scope.isLoading = true;
        boardService.getColumns()
           .then(function (data) {
               $scope.isLoading = false;
               $scope.columns = data;
           }, onError);
    };

    $scope.onDrop = function (data, targetColId) {
        boardService.canMoveTask(data.ColumnId, targetColId)
            .then(function (canMove) {
                if (canMove) {
                    /*
                    boardService.moveTask(data.Id, targetColId).then(function (taskMoved) {
                        $scope.isLoading = false;
                        //boardService.sendRequest();
                        $scope.refreshBoard();
                    }, onError);
                    $scope.isLoading = true;
                    */
                    getModal(data.Id, targetColId);

                    $scope.isLoading = true;

                    function getModal(taskId, targetStateId) {
                        $.get($scope.UpdateTaskUrl,
                        {
                            taskId: taskId,
                            nextStateId: targetStateId
                        },
                        function (partialResult) {
                            refreshModal(partialResult);
                        });
                    }

                    function refreshModal(data) {
                        $('#updateTaskModal').html(data);

                        $("#updateTaskModal").off("submit", "#form-updateTask");

                        $("#updateTaskModal").on("submit", "#form-updateTask", function (e) {
                            e.preventDefault();  // prevent standard form submission
                            var form = $(this);
                            $.ajax({
                                url: form.attr("action"),
                                method: form.attr("method"),  // post
                                data: form.serialize(),
                                success: function (partialResult) {
                                    refreshModal(partialResult);

                                    $('#updateTaskModal').on('hidden.bs.modal', function () {
                                        //window.location.reload(true);
                                        $scope.refreshBoard();
                                    });
                                }
                            });
                        });
                        $('#updateTaskModal').modal('show');
                    }
                }
            }, onError);
    };

    // Listen to the 'refreshBoard' event and refresh the board as a result
    $scope.$parent.$on("refreshBoard", function (e) {
        $scope.refreshBoard();
        toastr.success("Board updated successfully", "Success");
    });

    var onError = function (errorMessage) {
        $scope.isLoading = false;
        toastr.error(errorMessage, "Error");
    };

    $scope.editTask = function (taskId) {
        getModal(taskId);

        $scope.isLoading = true;

        function getModal(taskId) {
            $.get($scope.EditTaskUrl,
            {
                id: taskId,
            },
            function (partialResult) {
                refreshModal(partialResult);
            });
        }

        function refreshModal(data) {
            $('#editTaskModal').html(data);

            $("#editTaskModal").off("submit", "#form-editTask");

            $("#editTaskModal").on("submit", "#form-editTask", function (e) {
                e.preventDefault();  // prevent standard form submission
                var form = $(this);
                $.ajax({
                    url: form.attr("action"),
                    method: form.attr("method"),  // post
                    data: form.serialize(),
                    success: function (partialResult) {
                        refreshModal(partialResult);

                        $('#editTaskModal').on('hidden.bs.modal', function () {
                            //window.location.reload(true);
                            $scope.refreshBoard();
                        });
                    }
                });
            });
            $('#editTaskModal').modal('show');
        }
    };

    init();
});