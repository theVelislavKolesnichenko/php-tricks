<?php

//echo 1;
// Load the XML source
$xml = new DOMDocument;
$xml->load('collection.xml');
$xml->load('https://obsessive.com/productsexport/b2b_eur_en_products.xml');
//echo 2;
$xsl = new DOMDocument;
$xsl->load('collection.xsl');
//echo 3;



// Configure the transformer
$proc = new XSLTProcessor;
$proc->importStyleSheet($xsl); // attach the xsl rules
//echo 4;
header("Content-type: text/xml; charset=utf-8");
echo $proc->transformToXML($xml);

//echo 5;

$xml = 'https://obsessive.com/productsexport/b2b_eur_en_products.xml';
$xsl = 'collection.xsl';

$proc = new XMLTransform($xsl, $xml);

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
?>