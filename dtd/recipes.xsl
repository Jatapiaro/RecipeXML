<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous" />
    </head>
    <body>


        <div class="container">
            <xsl:for-each select="recipe">
                <div class="card mb-3">

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
                    
                    <img style="width: 100%; max-height: 320px;" class="card-img-top img-fluid" src="http://significadosdelossuenos.net/wp-content/uploads/2017/05/Qu%C3%A9-significa-so%C3%B1ar-con-hamburguesa.jpg" alt="Card image cap" />
                    
                    <div class="card-body">

                        <div>
                            <div class="flex-icon"><h4>Ingredientes:&#160;</h4> <img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1532/1532759.svg"/></div>
                            <ul>
                                <xsl:for-each select="ingredients/ingredient">
                                    <xsl:choose>
                                        <xsl:when test="unit">
                                            <li><xsl:value-of select="quantity" />&#160;<xsl:value-of select="unit" />&#160;de&#160;<xsl:value-of select="name" /></li>                                        
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <li><xsl:value-of select="name" />&#160;-&#160;<xsl:value-of select="quantity" /></li>
                                        </xsl:otherwise>
                                    </xsl:choose>                                    
                                </xsl:for-each>
                            </ul>
                        </div>

                        <div>
                            <div class="flex-icon"><h4>Utensilios:&#160;</h4> <img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1517/1517575.svg"/></div>
                            <ul>
                                <xsl:for-each select="utensils/utensil">
                                    <li><xsl:value-of select="quantity" />&#160;-&#160;<xsl:value-of select="name" /></li>
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
                        <br />
                        <div class="flex-icon"><img class="icon" src="https://image.flaticon.com/icons/svg/148/148933.svg"/>&#160;<b>Tiempo estimado de preparación:</b>&#160;<xsl:value-of select="preparationTime" />&#160;<xsl:value-of select="preparationTime/@unit"/></div>
                        <br />
                        <div class="flex-icon"><img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/938/938442.svg"/>&#160;<b>Dificultad de preparación: &#160;</b><xsl:value-of select="@dificulty"/></div>
                        <br />
                        <div class="flex-icon"><img class="icon" src="https://www.flaticon.com/premium-icon/icons/svg/1143/1143124.svg"/>&#160;<b>Se recomienda servir en: &#160;</b><xsl:value-of select="servedIn"/></div>                        
                    </div>
                </div>
            </xsl:for-each>
        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>