<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	<html>
		<body>
			<table border="1">
				<tr bgcolor="#9acd32">
					<th>ID árbol</th>
					<th>Nombre científico</th>
					<th>Nombre común</th>
					<th>Tipo de vegetación</th>
					<th>Altura</th>
					<th>Color en Primavera</th>
					<th>Resistencias a las heladas</th>
					<th>Estructura: Copa</th>
					<th>Estructura: Tronco</th>
					<th>Estructura: Ramaje</th>
				</tr>
				
				<tr>
					<xsl:for-each select="registro_arboles/arbol">
						<!--<xsl:if test="estructura/tronco=&quot;Recto&quot;">   Para que solo te salga lo que tu quieres  -->
							<tr>
								<td>
									<xsl:value-of select="@id" />
								</td>
								
								<td>
									<xsl:value-of select="@nombre" />
								</td>
								
								<td>
									<xsl:value-of select="nombre_comun" />
								</td>
								
								<td>
									<xsl:value-of select="vegetacion" />
								</td>
								
								<td>
									<xsl:value-of select="altura" />
								</td>
								
								<td>
									<xsl:value-of select="color_primavera" />
								</td>
								
								<td>
									<xsl:value-of select="resistencia_heladas" />
								</td>
								
								<td>
									<xsl:value-of select="estructura/copa" />
								</td>
								
								<td>
									<xsl:value-of select="estructura/tronco" />
								</td>
								
								<td>
									<xsl:value-of select="estructura/ramaje" />
								</td>
							</tr>
						<!--</xsl:if>-->
					</xsl:for-each>
				</tr>
			</table>
		</body>
	</html>
	</xsl:template>
</xsl:stylesheet>