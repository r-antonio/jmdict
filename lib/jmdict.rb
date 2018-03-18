require "jmdict/version"
require 'nokogiri'

class JMDict
  	@jmdict_file = nil

  	def initialize(filename)
  		@jmdict_file = File.open(filename) { |f| Nokogiri::XML(f) }
  	end

  	def each_entry()
  		@jmdict_file.xpath('JMdict/entry').each do |e|
  			yield(parse_entry(e))
  		end
  	end

  	# Many elements consists of text only subelements
    def fill_elems(tag, element)
      aux = []
      element.css(tag).each do |elem|
        aux << elem.text
      end
      aux
    end

  	# For the fields info see the DTD Rev 1.09 (http://www.edrdg.org/jmdict/dtd-jmdict.xml)
  	def parse_entry(entry)

  		this_entry = {}

  		this_entry["ent_seq"] = entry.css("ent_seq").text.to_i

  		this_entry["k_ele"] = []

  		entry.css("k_ele").each do |elem|
        k_ele = {}
        k_ele['keb'] = elem.css('keb').text
        k_ele['ke_inf'] = fill_elems('ke_inf', elem)
        k_ele['ke_pri'] = fill_elems('ke_pri', elem)
  			this_entry['k_ele'] << k_ele
  		end

      this_entry["r_ele"] = []

      entry.css("r_ele").each do |elem|
        r_ele = {}
        r_ele['reb'] = elem.css('reb').text
        r_ele['re_nokanji'] = elem.css('re_nokanji').text
        r_ele['re_restr'] = fill_elems('re_restr', elem)
        r_ele['re_inf'] = fill_elems('re_inf', elem)
        r_ele['re_pri'] = fill_elems('re_pri', elem)
  			this_entry['r_ele'] << r_ele
  		end

      this_entry["sense"] = []

      entry.css("sense").each do |s|
        sense = {}
        sense['stagk'] = fill_elems('stagk', s)
        sense['stagr'] = fill_elems('stagr', s)
        sense['pos'] = fill_elems('pos', s)
        sense['xref'] = fill_elems('xref', s)
        sense['ant'] = fill_elems('ant', s)
        sense['field'] = fill_elems('field', s)
        sense['misc'] = fill_elems('misc', s)
        sense['s_inf'] = fill_elems('s_inf', s)
        sense['l_source'] = []
        s.css('l_source').each do |ls|
          l_source = {}
          l_source['lang'] = ls.lang
          l_source['ls_type'] = ls.ls_type
          l_source['ls_wasei'] = ls.ls_wasei
          l_source['ls_source'] = ls.ls_source.text
          sense['l_source'] << l_source
        end
        sense['dial'] = fill_elems('dial', s)
        sense['gloss'] = []
        s.css('gloss').each do |g|
          gloss = {}
          gloss['lang'] = g.lang

  				# Give errors if accesed the same way as lang attribute when are not present
  				gloss['g_gend'] = g['g_gend'] if g.key? 'g_gend'
  				gloss['g_type'] = g['g_type'] if g.key? 'g_type'

  				# The gloss could have a text PCData or a 'pri' element.
  				# Currently in rev 1.09 there is no 'pri' at all. Just for the sake of DTD.
  				gloss['pri'] = g.at_css('pri').text unless g.at_css('pri').nil?

          gloss['gloss'] = g.text
          sense['gloss'] << gloss
        end

  			this_entry['sense'] << sense
  		end

      return this_entry
  	end

  end
