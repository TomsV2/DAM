<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
		<html>
			<body>
				<table border="1">
					<tr bgcolor="#9acd32">
						<th>Nombre</th>
						<th>Habitantes</th>
						<th>Capital</th>
						<th>Sigla del pais</th>
						<th>Prefijo</th>
					</tr>
					
					<xsl:for-each select="Europa/pais">
						<tr>
							<td>
								<xsl:value-of select="nombre" />
							</td>
							
							<td>
								<xsl:value-of select="habitantes" />
							</td>
							
							<td>
								<xsl:value-of select="capital" />
							</td>
							
							<td>
								<xsl:value-of select="sigla-pais" />
							</td>
							
							<td>
								<xsl:value-of select="prefijo" />
							</td>
						</tr>
					</xsl:for-each>
					
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>