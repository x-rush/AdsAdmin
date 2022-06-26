<?php
  function strip_only_tags($str, $tags, $stripContent = TRUE) { 
  $content = ''; 
 
  if (!is_array($tags)) { 
    $tags = (strpos($str, '>') !== false ? explode('>', str_replace('<', '', $tags)) : array($tags)); 
    if (end($tags) == '') { 
      // http://www.manongjc.com/article/1213.html
      array_pop($tags); 
    } 
  } 
 
  foreach($tags as $tag) { 
    if ($stripContent) { 
      $content = '(.+<!--'.$tag.'(-->|s[^>]*>)|)'; 
    } 
 
    $str = preg_replace('#<!--?'.$tag.'(-->|s[^>]*>)'.$content.'#is', '', $str); 
  } 
 
  return $str; 
} 