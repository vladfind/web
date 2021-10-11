<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
	<xsl:output method="html" doctype-public="XSLT-compat" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

	<xsl:template match="/">
		<hmtl>
			<head>
				<title>New Version!</title>
			</head>
			<table>
				<tr>
					<th>Направление</th>
					<th>Дата</th>
					<th>Цена</th>
					<th>Места</th>
					<th>Выезд</th>
					<th>Остановки</th>
				</tr>
				<xsl:apply-templates select="ROUTES/ROUTE">
					<xsl:sort select="PRICE" data-type="number" />
				</xsl:apply-templates>
			</table>
		</hmtl>
	</xsl:template>

	<xsl:template match="ROUTE[DATE='10.10.2021']">
		<tr>
			<td>
				<xsl:value-of select="DESTINATION" />
			</td>
			<td>
				<xsl:value-of select="DATE" />
			</td>
			<td>
				<xsl:value-of select="PRICE" />
			</td>
			<td>
				<xsl:value-of select="SEATS" />
			</td>
			<td>
				<xsl:apply-templates select="TIMES" />
			</td>
			<td>
				<xsl:apply-templates select="STOPS" />
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="ROUTE"></xsl:template>
	<xsl:template match="STOPS">
		<xsl:variable name="times" select="STOP" />
		<xsl:for-each select="$times">
			<xsl:variable name="b" select="." />
			<xsl:value-of select="$b"></xsl:value-of>
			<xsl:text>, </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<xsl:template match="TIMES">
		<xsl:variable name="times" select="TIME" />
		<xsl:for-each select="$times">
			<xsl:variable name="b" select="." />
			<xsl:value-of select="$b"></xsl:value-of>
			<xsl:text>, </xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:transform>