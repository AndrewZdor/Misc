# filter: TSV data to HTML table
# 
# строка вызова experiment.rb < tsv.tsv > output.html

class TsvToHTML
	@@styleBlock = <<-ENDMARK
	<style type='text/css'>
	td {
		border-left:1px solid #000000;
		padding-right:4px;
		padding-left:4px;
		white-space: nowrap;
	}
	.cellTitle {
		border-bottom:1px solid #000000;
		background:#ffffe0;
		font-weight: bold;
		text-align: center;
	}
	.cell0 { background:#eff1f1; }
	.cell1 { background:#f8f8f8; }
	</style>
	ENDMARK
	def TsvToHTML::wrapTag(data,tag,modifier = "")
		return "<#{tag} #{modifier}>" + data + "</#{tag}>\n"
	end # wrapTag
	def TsvToHTML::makePage(source)	
		page = ""
		rowNum = 0
		source.readlines.each { |record|
			row = ""
			record.chomp.split("\t").each { |field|
				# replace blank fields with &nbsp;
				field.sub!(/^$/,"&nbsp;")
				# wrap in TD tag, specify style
				row += wrapTag(field,"td","class=\"" +
				((rowNum == 0)?"cellTitle":"cell#{rowNum % 2}") +
				"\"")
			}
			rowNum += 1
			# wrap in TR tag, add row to page
			page += wrapTag(row,"tr") + "\n"
		}
		# finish page formatting
		[ [ "table","cellpadding=0 cellspacing=0 border=0" ], "body","html" ].each { |tag|
			page = wrapTag(@@styleBlock,"head") + page if tag == "html"
			page = wrapTag(page,*tag)
		}
		return page
	end # makePage
end # class
# stdin -> convert -> stdout
print TsvToHTML.makePage(STDIN)