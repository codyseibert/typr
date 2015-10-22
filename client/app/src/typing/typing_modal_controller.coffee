module.exports = [
  '$scope'
  '$modalInstance'
  'snippit'
  'isTyping'
  'done'
  'cb'
  (
    $scope
    $modalInstance
    snippit
    isTyping
    done
    cb
  ) ->

    $scope.snippit = snippit
    $scope.isTyping = isTyping
    $scope.done = done
    $scope.elapsed = 0
    $scope.cb = cb

]
