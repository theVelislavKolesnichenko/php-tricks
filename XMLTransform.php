<?php
class XMLTransform {   
    private $xslt;
    private $xml;

    function __construct($xsltFileName, $xmlFileName) {
        $this->xml = new DOMDocument;
        $this->xml->load($xmlFileName);

        $this->xslt = new XSLTProcessor;
        $this->xslt->importStyleSheet($xsltFileName);
    }

    function transform() {       
        return $this->xslt->transformToXML($xml);
      }
}
?>