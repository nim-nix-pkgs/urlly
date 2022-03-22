{
  description = ''URI and URL parsing for Nim for C/JS backends. Similar api to browsers's `window.location`.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-urlly-1_0_0.flake = false;
  inputs.src-urlly-1_0_0.ref   = "refs/tags/1.0.0";
  inputs.src-urlly-1_0_0.owner = "treeform";
  inputs.src-urlly-1_0_0.repo  = "urlly";
  inputs.src-urlly-1_0_0.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-urlly-1_0_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-urlly-1_0_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}