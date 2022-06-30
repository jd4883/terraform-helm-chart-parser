locals {
  charts = { for i in var.charts : i.chart => merge(
    i,
    {
      extras = merge(i, (contains(var.extras_injection_condition, i.chart) ? var.extras_payload : var.default_extras))
      image = {
        pullPolicy = lookup(lookup(i, "image", {}), "pullPolicy", var.image_default.pullPolicy)
        registry   = lookup(lookup(i, "image", {}), "registry", var.image_default.registry)
        tag        = lookup(lookup(i, "image", {}), "tag", var.image_default.tag)
      }
      no_set_defaults = lookup(i, "no_set_defaults", false)
    }
    )
  }
  dependent_charts   = { for k, v in local.charts : k => v if alltrue([(length(lookup(v, "depends_on", [])) > 0)]) }
  independent_charts = { for k, v in local.charts : k => v if alltrue([(length(lookup(v, "depends_on", [])) == 0)]) }
}
