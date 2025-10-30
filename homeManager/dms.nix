{
  inputs,
  ...
}:

{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
  ];

  dankMaterialShell = {
    enable = true;
  };
}
