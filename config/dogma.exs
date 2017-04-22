use Mix.Config
alias Dogma.Rule

config :dogma,
  rule_set: Dogma.RuleSet.All,
  exclude: [
    ~r(\Alib/vendor/),
  ],

  override: [
    %Rule.ModuleDoc{enabled: false},
    %Rule.LineLength{enabled: false, max_length: 80}
  ]
