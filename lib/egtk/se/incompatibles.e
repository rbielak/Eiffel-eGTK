indexing
	description: "Incompatible features - SE version"
	author: "Oliver Elphick"
	date: "$Date: 2002/03/02 12:45:36 $"
	revision: "$Revision: 1.5 $"

class

	INCOMPATIBLES

feature -- Miscellaneous

	progname: STRING is
			-- basename of running program
		local
			tmp, tmp1: STRING
			p: INTEGER
		once
-- ISE	tmp1 := clone(command_line.command_name)
			tmp1 := clone(argument(0))
-- ISE	tmp1.prune_all_trailing('/')
			from
				p := tmp1.count
				tmp := tmp1.substring(p, p)
			invariant
				0 < p
			variant
				p
			until
				tmp.occurrences('/') > 0 or p <= 1
			loop
				p := p - 1
				tmp := tmp1.substring(p, tmp1.count)
			end
-- ISE	tmp.prune_all_leading('/')
			Result := tmp
		ensure
			Result /= Void and then Result.count /= 0
		end

	string_has_string(s, x: STRING): BOOLEAN is
		local
			p: INTEGER
		do
			p := s.substring_index(x, 1)
			if p>=1 and p<=s.count then
				Result := True
			end
		end

	extend_string_collection(c: COLLECTION[STRING]; s: STRING) is
		do
			c.add_last(s)
-- ISE	c.extend(s)
		end

-- Other incompatibilities:
--
-- STRING
--         clear(SE), clear_all(ISE): use wipe-out
--         occurrences_of(SE): use occurrences

end -- class INCOMPATIBLES
