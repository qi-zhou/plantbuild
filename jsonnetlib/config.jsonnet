local v = std.extVar('VERSION');
assert std.length(v) > 0 : 'version is empty';

{
  version: v,
  dockerRegistry: 'registry.example.com',
  imagePullSecrets: 'registry-secrets',
  defaultNamespace: 'default',
  port: 4000,
  baseHost: '',
  memoryRequest: '20Mi',
  cpuRequest: '20m',
  memoryLimit: '200Mi',
  cpuLimit: '500m',
  maxSurge: 1,
  strategy: 'RollingUpdate',
  replicas: 1,
  minAvailable: 1,
  failedJobsHistoryLimit: 2,
  successfulJobsHistoryLimit: 1,
  projectRoot: '/go/src/github.com',
  podSpec: {},
  defaultProtocolType: 'http',
  defaultPodAnnotations: {'sidecar.istio.io/inject': 'false',},

  // config helper func
  local root = self,
  with_registry(image)::
    if std.length(root.dockerRegistry) == 0 then
      image
    else
      '%s/%s' % [self.dockerRegistry, image],
}
