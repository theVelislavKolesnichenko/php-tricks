copy ..\..\..\style\base.css .
saxon date.month-abbreviation.xml ../../../style/function.xsl
wzzip -P -o date.month-abbreviation.zip @date.month-abbreviation.package.txt
wzzip -P -o date.month-abbreviation.use-cases.zip @date.month-abbreviation.use-cases.txt
cd ..
cd ..
saxon date.xml ../style/module.xsl
wzzip -P -o date.zip @date.package.txt
cd ..
saxon modules.xml style/package.xsl
wzzip -P -o all-exslt.zip @package.txt
saxon modules.xml style/xml-package.xsl
wzzip -P -o exslt.zip @xml-package.txt
cd date
cd functions
cd month-abbreviation
