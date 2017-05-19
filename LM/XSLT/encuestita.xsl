<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h1>Encuesta</h1>
				<xsl:for-each select="encuesta/cuestion">
				
					<p><b><xsl:value-of select="pregunta" /></b></p>
					
					<select>
						<xsl:for-each select="respuesta">
						<option><xsl:value-of select="." /></option>
						</xsl:for-each>
					</select>
					
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>