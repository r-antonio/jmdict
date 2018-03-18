# JMDict Gem

This is a simple gem that takes in an XML file containing the [JMDict](http://www.edrdg.org/jmdict/edict_doc.html) Japanese/English dictionary from the Electronic Dictionary Research and Development Group. To avoid dealing with the parsing of this complex file this gem gives the functionality of retrieving each entry in a Ruby Hash more friendly to just focus on the processing step.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jmdict'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jmdict

And use it in your application:

```ruby
require 'kanjidic2'
```

## Dependencies

This gem depends on `nokogiri` for XML parsing.

## Usage

The usage is very simple, just do:
```ruby
jmdict = JMDict.new("JMdict.xml")
jmdict.each_entry do |entry|
  # Here you can play with the entry
end
```
Example of an entry hash:
```
{"ent_seq"=>1000310,
  "k_ele"=>[{"keb"=>"馬酔木", "ke_inf"=>[], "ke_pri"=>[]}],
  "r_ele"=>[{"reb"=>"あせび", "re_nokanji"=>"", "re_restr"=>[], "re_inf"=>[], "re_pri"=>[]},
            {"reb"=>"あしび", "re_nokanji"=>"", "re_restr"=>[], "re_inf"=>[], "re_pri"=>[]},
            {"reb"=>"あせぼ", "re_nokanji"=>"", "re_restr"=>[], "re_inf"=>[], "re_pri"=>[]},
            {"reb"=>"あせぶ", "re_nokanji"=>"", "re_restr"=>[], "re_inf"=>[], "re_pri"=>[]},
            {"reb"=>"アセビ", "re_nokanji"=>"", "re_restr"=>[], "re_inf"=>[], "re_pri"=>[]}],
  "sense"=>[{"stagk"=>[], "stagr"=>[], "pos"=>["noun (common) (futsuumeishi)"], "xref"=>[], "ant"=>[],
            "field"=>[], "misc"=>["word usually written using kana alone"], "s_inf"=>[], "l_source"=>[], "dial"=>[], "gloss"=>[{"lang"=>nil, "gloss"=>"Japanese andromeda (Pieris japonica)"},{"lang"=>nil,"gloss"=>"lily-of-the-valley"}]},
            {"stagk"=>[], "stagr"=>[], "pos"=>[], "xref"=>[], "ant"=>[], "field"=>[], "misc"=>[], "s_inf"=>[], "l_source"=>[], "dial"=>[], "gloss"=>[{"lang"=>"dut", "gloss"=>"{plantk.} Japanse rotsheide"}, {"lang"=>"dut", "gloss"=>"Pieris japonica"}]},
            {"stagk"=>[], "stagr"=>[], "pos"=>[], "xref"=>[], "ant"=>[], "field"=>[], "misc"=>[], "s_inf"=>[], "l_source"=>[], "dial"=>[], "gloss"=>[{"lang"=>"dut", "gloss"=>"Ashibi {naam van een tanka-tijdschrift, 1903-1908}"}]},
            {"stagk"=>[], "stagr"=>[], "pos"=>[], "xref"=>[], "ant"=>[], "field"=>[], "misc"=>[], "s_inf"=>[], "l_source"=>[], "dial"=>[], "gloss"=>[{"lang"=>"dut", "gloss"=>"Ashibi {sedert 1928 de naam van het vanaf 1922 gepubliceerde haiku-tijdschrift Hamayumi 破魔弓}"}, {"lang"=>"dut", "gloss"=>"{plantk.} Japanse rotsheide"}, {"lang"=>"dut", "gloss"=>"Pieris japonica"}]},
            {"stagk"=>[], "stagr"=>[], "pos"=>[], "xref"=>[], "ant"=>[], "field"=>[], "misc"=>[], "s_inf"=>[], "l_source"=>[], "dial"=>[], "gloss"=>[{"lang"=>"ger", "gloss"=>"(f) Lavendelheide"}, {"lang"=>"ger", "gloss"=>"Pieris japonica"}]},
            {"stagk"=>[], "stagr"=>[], "pos"=>[], "xref"=>[], "ant"=>[], "field"=>[], "misc"=>[], "s_inf"=>[], "l_source"=>[], "dial"=>[], "gloss"=>[{"lang"=>"rus", "gloss"=>"(см.) あせび"}, {"lang"=>"rus", "gloss"=>"(бот.) подбел, Picris japonicum (D. Don.)"}]}]
}
```
Please read the [DTD](view-source:http://www.edrdg.org/jmdict/dtd-jmdict.xml) for more information and to know how to deal with this data. This is only a wrapper.

## Versioning

I decided to put a version number that follows the same pattern as the official DTD revision version for aknowledge the compatibility of this gem with the XML file used.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/r-antonio/jmdict.
