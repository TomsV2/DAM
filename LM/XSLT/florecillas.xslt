<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<h2>Mon jardin</h2>
				<p> j'ai perdu ma plume
				</p>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Planta</th>
						<th>Tipo</th>
					</tr>
					<xsl:for-each select="jardin/planta">
						<tr>
							<td>
								<xsl:value-of select="nombre" />
							</td>
							<td>
								<xsl:value-of select="tipo" />
							</td>
						</tr>
					</xsl:for-each>
				</table>
				<p>Dedicado a Paco en agradecimiento a su gran colaboracion
				</p>
			</body>
		</html>



	</xsl:template>
</xsl:stylesheet>