local dc = import 'dc.jsonnet';
local ndc = dc {
  dockerRegistry: '',
};
ndc.build_image('zhouqi/plantbuild')
