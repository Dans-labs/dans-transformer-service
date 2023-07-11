<?xml version="1.0"?>
<xsl:stylesheet
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:ddm="http://schemas.dans.knaw.nl/dataset/ddm-v2/"
    xmlns:dcx-dai="http://easy.dans.knaw.nl/schemas/dcx/dai/"
    xmlns:dcx-gml="http://easy.dans.knaw.nl/schemas/dcx/gml/"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs math" version="3.0">
    <xsl:output indent="yes" omit-xml-declaration="no" />

    <xsl:template match="data">
        <!-- create a new root tag -->
        <ddm:DDM>
            <!-- apply the xml structure generated from JSON -->
            <xsl:apply-templates select="json-to-xml(.)" />
        </ddm:DDM>
    </xsl:template>

    <!-- template for the first tag -->
    <xsl:template match="map"
        xpath-default-namespace="http://www.w3.org/2005/xpath-functions">
        <ddm:profile>
        <!-- CIT001 -->
            <dc:title><xsl:value-of select="//array[@key='metadata']/map/string[@key='name' and text()='title']/following-sibling::string[@key='value']/."/></dc:title>
        <!-- CIT002: see dcmiMetadata -->
        <!-- CIT003: see bag-info.txt -->
        <!-- CIT004: see dcmiMetadata -->

        <!-- CIT009 -->
        <dcterms:description>
            <xsl:value-of select="/map/array[@key='metadata']/map/string[@key='name' and text()='description']/following-sibling::string[@key='value']/."/>
        </dcterms:description>
        <!-- CIT009 -->
        <dcterms:description>
            A second description
        </dcterms:description>
        <!-- CIT005 -->
        <dc:creator>
            Unformatted Creator <xsl:value-of select="//array[@key='metadata']/map/array[@key='value']/array/map/string[@key='name' and text()='contributorName']/following-sibling::string[@key='value']/."/>
        </dc:creator>
        <!-- CIT006 -->
        <dcx-dai:creatorDetails>
            <dcx-dai:author>
                <dcx-dai:titles>Dr</dcx-dai:titles>
                <dcx-dai:initials>I</dcx-dai:initials>
                <dcx-dai:surname>Lastname</dcx-dai:surname>
                <dcx-dai:organization>
                    <dcx-dai:name xml:lang="en">Example Org</dcx-dai:name>
                </dcx-dai:organization>
            </dcx-dai:author>
        </dcx-dai:creatorDetails>
        <!-- CIT007 -->
        <dcx-dai:creatorDetails>
            <dcx-dai:organization>
                <dcx-dai:name xml:lang="en">Creator Organization</dcx-dai:name>
            </dcx-dai:organization>
        </dcx-dai:creatorDetails>
        <!-- CIT008: contact is created from Dataverse account of depositing user -->

        <!-- CIT019 -->
        <ddm:created>2015-09-09</ddm:created>
        <!-- CIT025 -->
        <ddm:available>2015-09-09</ddm:available>
        <!-- CIT013 and REL001 -->
        <ddm:audience>D13400</ddm:audience>
        <ddm:audience>D16300</ddm:audience>
        <ddm:audience>D16100</ddm:audience>
        <ddm:audience>D16200</ddm:audience>
        <ddm:audience>D16400</ddm:audience>
        <ddm:audience>D16500</ddm:audience>
        <ddm:audience>E16000</ddm:audience> <!-- NB CIT013 will map this to the subject 'Other', but drop that because it is not the only subject found -->

        <!-- If changed to NO_ACCESS, demonstrates TRM003 -->
        <ddm:accessRights>OPEN_ACCESS</ddm:accessRights>
        <!-- RIG002 -->
        <ddm:personalData present="No"/>
    </ddm:profile>
    <ddm:dcmiMetadata>
        <!-- CIT002 -->
        <dcterms:title>DCTERMS title 1</dcterms:title>
        <dcterms:title>DCTERMS title 2</dcterms:title>
        <dcterms:alternative>DCTERMS alt title 1</dcterms:alternative>
        <dcterms:alternative>DCTERMS alt title 2</dcterms:alternative>

        <!-- CIT004 -->
        <dcterms:identifier>DCTERMS_ID001</dcterms:identifier>
        <dcterms:identifier>DCTERMS_ID002</dcterms:identifier>
        <dcterms:identifier>DCTERMS_ID003</dcterms:identifier>

        <!-- CIT011 -->
        <dcterms:date>some date</dcterms:date>
        <dcterms:dateAccepted>some acceptance date</dcterms:dateAccepted>
        <dcterms:dateCopyrighted>some copyright date</dcterms:dateCopyrighted>
        <dcterms:dateSubmitted>some submission date</dcterms:dateSubmitted>
        <dcterms:modified>some modified date</dcterms:modified>
        <dcterms:issued>some issuing date</dcterms:issued>
        <dcterms:valid>some validation date</dcterms:valid>
        <dcterms:coverage>some coverage description</dcterms:coverage>

        <!-- CIT012 -->
        <dcterms:description>Even more descriptions</dcterms:description>

        <!-- CIT014 -->
        <dcterms:subject>keyword1</dcterms:subject>
        <dcterms:subject>keyword2</dcterms:subject>

        <!-- CIT015 -->
        <ddm:subject schemeURI="https://data.cultureelerfgoed.nl/term/id/pan/PAN"
                     subjectScheme="PAN thesaurus ideaaltypes"
                     valueURI="https://data.cultureelerfgoed.nl/term/id/pan/08-01-08"
                     xml:lang="en">non-military uniform button
        </ddm:subject>
        <ddm:subject schemeURI="http://vocab.getty.edu/aat/"
                     subjectScheme="Art and Architecture Thesaurus"
                     valueURI="http://vocab.getty.edu/aat/300239261"
                     xml:lang="en">Broader Match: buttons (fasteners)
        </ddm:subject>

        <!-- CIT016 -->
        <dcterms:language>Old School Latin</dcterms:language>

        <!-- CIT017 -->
<!--        <dcterms:identifier xsi:type="id-type:ISSN">0317-8471</dcterms:identifier>
-->
        <!-- CIT018 -->
        <ddm:language encodingScheme="ISO639-1" code="fy">West-Fries</ddm:language>
        <ddm:language encodingScheme="ISO639-2" code="kal">Groenlands</ddm:language>
        <ddm:language encodingScheme="ISO639-2" code="baq">Baskisch</ddm:language>

        <!-- CIT019 see profile -->

        <!-- CIT020 -->
        <dcx-dai:contributorDetails>
            <dcx-dai:author>
                <dcx-dai:titles>Prof Dr</dcx-dai:titles>
                <dcx-dai:initials>CON</dcx-dai:initials>
                <dcx-dai:insertions>van</dcx-dai:insertions>
                <dcx-dai:surname>Tributor</dcx-dai:surname>
                <dcx-dai:role>ProjectMember</dcx-dai:role>
                <dcx-dai:organization>
                    <dcx-dai:name xml:lang="en">Contributing Org</dcx-dai:name>
                </dcx-dai:organization>
            </dcx-dai:author>
        </dcx-dai:contributorDetails>

        <!-- CIT021 -->
        <dcx-dai:contributorDetails>
            <dcx-dai:organization>
                <dcx-dai:name xml:lang="en">Contributing Org</dcx-dai:name>
                <dcx-dai:role>Sponsor</dcx-dai:role>
            </dcx-dai:organization>
        </dcx-dai:contributorDetails>

        <!-- CIT022 -->
        <!-- Rule under revision -->

        <!-- CIT023 -->
<!--        <dcterms:identifier xsi:type="id-type:NWO-PROJECTNR">54321</dcterms:identifier>-->

        <!-- CIT024 -->
        <dcterms:publisher>D. I. Stributor</dcterms:publisher>
        <!-- Special values: skipped -->
        <dcterms:publisher>DANS</dcterms:publisher>
        <dcterms:publisher>DANS-KNAW</dcterms:publisher>
        <dcterms:publisher>DANS/KNAW</dcterms:publisher>

        <!-- CIT025 see profile -->

        <!-- CIT026 -->
        <ddm:datesOfCollection>2015-06-01/2016-12-31</ddm:datesOfCollection>

        <!-- CIT027 -->
        <ddm:description descriptionType="SeriesInformation">Information about a series: first</ddm:description>
        <ddm:description descriptionType="SeriesInformation">Information about a series: second</ddm:description>

        <!-- CIT028 --> <!-- RIG003 Any element can add a metadata language -->
        <dcterms:source xml:lang="ht">Sous an ayisyen</dcterms:source>
        <dcterms:source>Source 2</dcterms:source>
        <dcterms:source>Source 3</dcterms:source>

        <!-- RIG001 -->
        <dcterms:rightsHolder>I Lastname</dcterms:rightsHolder>

        <!-- RIG002 see profile -->

        <!-- RIG003 Any element can add a metadata language -->
        <dcterms:abstract xml:lang="ka">Georgian</dcterms:abstract>


        <!-- REL001 see profile -->

        <!-- REL002 -->
        <ddm:inCollection
                subjectScheme="DANS Collection"
                schemeURI="https://vocabularies.dans.knaw.nl/collections"
                valueURI="https://vocabularies.dans.knaw.nl/collections/ssh/ce21b6fb-4283-4194-9369-b3ff4c3d76e7"/>

        <!-- REL003. N.B. hrefs do not resolve -->
        <ddm:relation href="https://example.com/relation">Test relation</ddm:relation>
        <ddm:conformsTo href="https://example.com/conformsTo">Test conforms to</ddm:conformsTo>
        <ddm:hasFormat href="https://example.com/hasFormat">Test has format</ddm:hasFormat>
        <ddm:hasPart href="https://example.com/hasPart">Test has part</ddm:hasPart>
        <ddm:references href="https://example.com/references">Test references</ddm:references>
        <ddm:replaces href="https://example.com/replaces">Test replaces</ddm:replaces>
        <ddm:requires href="https://example.com/requires">Test requires</ddm:requires>
        <ddm:hasVersion href="https://example.com/hasVersion">Test has version</ddm:hasVersion>
        <ddm:isFormatOf href="https://example.com/isFormatOf">Test is format of</ddm:isFormatOf>
        <ddm:isPartOf href="https://example.com/isPartOf">Test is part of</ddm:isPartOf>
        <ddm:isReferencedBy href="https://example.com/isReferencedBy">Test is referenced by</ddm:isReferencedBy>
        <ddm:isRequiredBy href="https://example.com/isRequiredBy">Test is required by</ddm:isRequiredBy>
        <ddm:isVersionOf href="https://example.com/isVersionOf">Test is version of</ddm:isVersionOf>

        <!-- AR001 -->
<!--        <dcterms:identifier xsi:type="id-type:ARCHIS-ZAAK-IDENTIFICATIE">12345</dcterms:identifier>-->

        <!-- AR002 -->
       <!-- <dcterms:identifier xsi:type="id-type:ARCHIS-ONDERZOEK">12345</dcterms:identifier>
        <dcterms:identifier xsi:type="id-type:ARCHIS-VONDSTMELDING">67890</dcterms:identifier>
        <dcterms:identifier xsi:type="id-type:ARCHIS-MONUMENT">12345</dcterms:identifier>
        <dcterms:identifier xsi:type="id-type:ARCHIS-WAARNEMING">67890</dcterms:identifier>
-->
        <!-- AR003 and AR004 -->
        <ddm:reportNumber
                subjectScheme="ABR Rapporten"
                schemeURI="https://data.cultureelerfgoed.nl/term/id/abr/7a99aaba-c1e7-49a4-9dd8-d295dbcc870e"
                valueURI="https://data.cultureelerfgoed.nl/term/id/abr/d6b2e162-3f49-4027-8f03-28194db2905e"
                reportNo="123-A">
            BAAC 123-A
        </ddm:reportNumber>

        <!-- AR005 -->
        <ddm:acquisitionMethod
                subjectScheme="ABR verwervingswijzen"
                schemeURI="https://data.cultureelerfgoed.nl/term/id/abr/554ca1ec-3ed8-42d3-ae4b-47bcb848b238"
                valueURI="https://data.cultureelerfgoed.nl/term/id/abr/967bfdf8-c44d-4c69-8318-34ed1ab1e784">
            archeologisch: onderwaterarcheologie
        </ddm:acquisitionMethod>

        <!-- AR006 -->
        <ddm:subject
                subjectScheme="ABR Complextypen"
                schemeURI="https://data.cultureelerfgoed.nl/term/id/abr/e9546020-4b28-4819-b0c2-29e7c864c5c0"
                valueURI="https://data.cultureelerfgoed.nl/term/id/abr/9a758542-8d0d-4afa-b664-104b938fe13e">
            houtwinning
        </ddm:subject>

        <!-- AR007 -->
        <ddm:subject
                subjectScheme="ABR Artefacten"
                schemeURI="https://data.cultureelerfgoed.nl/term/id/abr/22cbb070-6542-48f0-8afe-7d98d398cc0b"
                valueURI="https://data.cultureelerfgoed.nl/term/id/abr/5bd97bc0-697c-4128-b7b2-d2324bc4a2e1">
            rammelaar
        </ddm:subject>

        <!-- AR008 -->
        <ddm:temporal
                subjectScheme="ABR Periodes"
                schemeURI="https://data.cultureelerfgoed.nl/term/id/abr/9b688754-1315-484b-9c89-8817e87c1e84"
                valueURI="https://data.cultureelerfgoed.nl/term/id/abr/5b253754-ddd0-4ae0-a5bb-555176bca858">
            Midden Romeinse Tijd A
        </ddm:temporal>

        <!-- TS001 -->
        <dcterms:temporal>Het Romeinse Rijk</dcterms:temporal>
        <dcterms:temporal>De Oudheid</dcterms:temporal>

        <!-- TS002 -->
        <dcx-gml:spatial srsName="http://www.opengis.net/def/crs/EPSG/0/28992">
            <Point xmlns="http://www.opengis.net/gml">
                <pos>126466 529006</pos>
            </Point>
        </dcx-gml:spatial>

        <!-- TS003, defaults to latitude/longitude-->
        <dcx-gml:spatial>
            <Point xmlns="http://www.opengis.net/gml">
                <pos>52.078663 4.288788</pos>
            </Point>
        </dcx-gml:spatial>

        <!-- TS004 -->
        <dcx-gml:spatial>
            <boundedBy xmlns="http://www.opengis.net/gml">
                <Envelope srsName="http://www.opengis.net/def/crs/EPSG/0/28992">
                    <lowerCorner>102000 335000</lowerCorner>
                    <upperCorner>140000 628000</upperCorner>
                </Envelope>
            </boundedBy>
        </dcx-gml:spatial>

        <!-- TS005 -->
        <dcx-gml:spatial>
            <boundedBy xmlns="http://www.opengis.net/gml">
                <Envelope srsName="http://www.opengis.net/def/crs/EPSG/0/4326">
                    <lowerCorner>51.46343658020442 3.5621054065986075</lowerCorner>
                    <upperCorner>53.23074335194507 6.563118076315912</upperCorner>
                </Envelope>
            </boundedBy>
        </dcx-gml:spatial>

        <!-- Not RD or lat/lon, so should be ignored -->
        <dcx-gml:spatial>
            <boundedBy xmlns="http://www.opengis.net/gml">
                <Envelope srsName="XXX">
                    <lowerCorner>1 2</lowerCorner>
                    <upperCorner>3 4</upperCorner>
                </Envelope>
            </boundedBy>
        </dcx-gml:spatial>

        <!-- TS006, note that the text must exactly match the vocabulary term, so South-Africa will be handled by TS007 -->
        <dcterms:spatial>South Africa</dcterms:spatial>
        <dcterms:spatial>Japan</dcterms:spatial>

        <!-- TS007, not in the controlled list, so mapped to the free text field -->
        <dcterms:spatial>Roman Empire</dcterms:spatial>

        <!--TRM001 -->
        <dcterms:license xsi:type="dcterms:URI">http://opensource.org/licenses/MIT</dcterms:license>

        <!-- TRM002 see example restricted-files-no-access-request -->

        <!-- TRM005 and TRM006 -->
        <dcterms:accessRights>Restricted files accessible under the following conditions: ...</dcterms:accessRights>

    </ddm:dcmiMetadata>
        
        <!--<ddm:dcmiMetadata>
            <dcterms:license xsi:type="dcterms:URI">http://opensource.org/licenses/MIT</dcterms:license>
            <dcterms:rightsHolder>I Lastname</dcterms:rightsHolder>
        </ddm:dcmiMetadata>-->
    </xsl:template>


</xsl:stylesheet>