<?
query_posts('name=moje-vyrobky');
if(have_posts())
{
    $post = array(
      'post_author'    => get_current_user_id(), 
      'post_content'   => "[seznam_produktu_majitel]", 
      'post_date'      => date('Y-m-d H:i:s'),
      'post_status'    => 'publish',
      'post_title'     => "Moje výrobky", 
      'post_type'      => 'page'
    );  

    wp_insert_post($post);
}

query_posts('name=upravit-vyrobek');
if(have_posts())
{
    $post = array(
      'post_author'    => get_current_user_id(), 
      'post_content'   => "[upravit_produkt]", 
      'post_date'      => date('Y-m-d H:i:s'),
      'post_status'    => 'publish',
      'post_title'     => "Upravit výrobek", 
      'post_type'      => 'page'
    );  

    wp_insert_post($post);
}
?>