<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/">
	
		<html>
		
			<head>
				<title>Encuesta</title>
			</head>
			
			<body>
				<h1>Encuesta</h1><h6>(Leo no hagas examen PLS)</h6>

				<form action = "http://leo.ciclo.iesnervion.es/muestraDatos.php" method = "get">
					<fieldset>
						<xsl:for-each select = "encuesta/cuestion">
							<xsl:variable name = "pos" select = 'position ()'/>
							<xsl:value-of select = "pregunta"/><br/><br/>
							<xsl:for-each select = "respuesta">
								<input type="radio" name = 'radio {$pos}' id = "radio-choice-{position()}">
									<label for = "radio-choice-{position()}"><xsl:value-of select = "."/></label><br/><br/>
								</input>
							</xsl:for-each>
						</xsl:for-each>
					</fieldset>
					<input type="submit" value="Enviar"/>
				</form>

			</body>

		</html>
	
	</xsl:template>
</xsl:stylesheet>