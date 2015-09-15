module.exports = [
  '$scope'
  '$modalInstance'
  'snippit'
  'isTyping'
  'done'
  (
    $scope
    $modalInstance
    snippit
    isTyping
    done
  ) ->

    $scope.snippit = snippit
    $scope.isTyping = isTyping
    $scope.done = done

]
