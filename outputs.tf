output "all" { value = local.charts }
output "has_dependencies" { value = local.dependent_charts }
output "has_no_dependencies" { value = local.independent_charts }
