module.exports = [
  '$state'
  'codeService'
  (
    $state
    codeService
  ) ->
    if codeService.code is ''
      $state.go 'upload'
]
