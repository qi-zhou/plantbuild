// For section a
local k8s = import 'k8s.jsonnet';

k8s.configmap(
  namespace='example',
  name='cm-mutiapp',
  deployment='app1 app2',
  data={
    Hello: 'Value122',
    OwnerName: 'Felix',
    // For Section b
    Hello1: 'ABC',
  }
)
