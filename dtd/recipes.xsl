<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- XSL of recipes
    Made by Jacobo Tapia / UNIR
    VERSION 1.0
    21/02/2019
-->

<xsl:template match="/recipes">
    <html>
    <head>
        <title>Recetas</title>
        <style>
            .body {
                text-align: justify;
            }
            .icon {
                height: 25px;
                width: 25px;
            }
            .flex-icon {
                display: flex;
                text-transform: capitalize;
                justify-content: flex-start;
            }
            .card, .container {
                margin-top: 25px;
                margin-bottom: 25px;
            }
            .card-body {
                display: flex;
                justify-content: space-between;
                flex-wrap: wrap;
            }
        </style>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    </head>
    <body>


        <div class="container">
            <xsl:for-each select="recipe">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </div>

    </body>
    </html>
</xsl:template>


<!-- recipe template -->
<xsl:template match="recipe">
    <div class="card mb-3 border-info">

        <div class="card-header">
            <h4 class="float-left"><xsl:value-of select="name" /></h4>
            <div class="float-right">
                <!-- Tipo de platillo -->
                <div class="flex-icon">
                    <p style="text-transform: capitalize"><xsl:value-of select="@type" /> &#160;</p>
                    <xsl:choose>
                        <xsl:when test="@type = 'entrada'">
                            <img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1477/1477844.svg"/>
                        </xsl:when>
                        <xsl:when test="@type = 'sopa'">
                            <img class="icon" src="https://image.flaticon.com/icons/svg/1473/1473362.svg"/>
                        </xsl:when>
                        <xsl:when test="@type = 'ensalada'">
                            <img class="icon" src="https://image.flaticon.com/icons/svg/135/135637.svg"/>
                        </xsl:when>
                        <xsl:when test="@type = 'principal'">
                            <img class="icon" src="https://image.flaticon.com/icons/svg/1046/1046772.svg"/>
                        </xsl:when>        
                        <xsl:when test="@type = 'postre'">
                            <img class="icon" src="https://image.flaticon.com/icons/svg/135/135578.svg"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <img class="icon" src="https://image.flaticon.com/icons/svg/135/135759.svg"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
                <!-- ./Tipo de platillo -->
            </div>
        </div>
        
        <img 
            style="width: 100%; max-height: 320px;"
            class="card-img-top img-fluid">
            <xsl:attribute name="src">
                <xsl:value-of select="image" />
            </xsl:attribute>
        </img>
        
        <div class="card-body">

            <div>
                <div class="flex-icon"><h4>Ingredientes:&#160;</h4> <img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1532/1532759.svg"/></div>
                <ul>
                    <xsl:for-each select="ingredients/ingredient">
                        <xsl:apply-templates select="." />
                    </xsl:for-each>
                </ul>
            </div>

            <div>
                <div class="flex-icon"><h4>Utensilios:&#160;</h4> <img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1517/1517575.svg"/></div>
                <ul>
                    <xsl:for-each select="utensils/utensil">
                        <li><xsl:value-of select="quantity" />&#160;-&#160;<b><xsl:value-of select="name" /></b></li>
                    </xsl:for-each>
                </ul>
            </div>

            <div>
                <div class="flex-icon"><h4>Procedimiento:&#160;</h4> <img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1485/1485850.svg"/></div>
                <ul>
                    <xsl:for-each select="instructions/instruction">
                        <li><xsl:value-of select="." /></li>
                    </xsl:for-each>
                </ul>
            </div>


        </div>

        <div class="card-footer">
            <h4>Datos adicionales: </h4>
            <xsl:if test="calories">
                <br />
                <div class="flex-icon"><img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1350/1350083.svg"/>&#160;<b>Calorias:</b>&#160;<xsl:value-of select="calories" />&#160;kcal</div>
            </xsl:if>
            <br />
            <div class="flex-icon"><img class="icon" src="https://image.flaticon.com/icons/svg/148/148933.svg"/>&#160;<b>Tiempo estimado de preparación:</b>&#160;<xsl:value-of select="preparationTime" />&#160;<xsl:value-of select="preparationTime/@unit"/></div>
            <br />
            <div class="flex-icon"><img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/938/938442.svg"/>&#160;<b>Dificultad de preparación: &#160;</b><xsl:value-of select="@dificulty"/></div>
            <br />
            <div class="flex-icon"><img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1143/1143124.svg"/>&#160;<b>Se recomienda servir en: &#160;</b><xsl:value-of select="servedIn"/></div>                        
        </div>
    </div>
</xsl:template>
<!-- ./recipe template -->

<!-- ingredient template -->
<xsl:template match="ingredient">
    <xsl:choose>
        <xsl:when test="unit">
            <li><xsl:value-of select="quantity" />&#160;<xsl:value-of select="unit" />&#160;de&#160;<b><xsl:value-of select="name" /></b></li>                                        
        </xsl:when>
        <xsl:otherwise>
            <li><b><xsl:value-of select="name" /></b>&#160;-&#160;<xsl:value-of select="quantity" /></li>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>
<!-- ./ingredient template -->

</xsl:stylesheet>