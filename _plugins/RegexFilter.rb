module Jekyll
    module RegexFilter
        def matches_regex(input, regstr)
            re = Regexp.new regstr
            return input.match?(re)
        end
    end
end

Liquid::Template.register_filter(Jekyll::RegexFilter)